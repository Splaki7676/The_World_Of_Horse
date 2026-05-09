using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__.Admin_Master_Nested
{
    public partial class AdminEditUser : System.Web.UI.Page
    {

        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True";
        private int UserId
        {
            get { int id; return int.TryParse(Request.QueryString["id"], out id) ? id : 0; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master.Master).BodyCssClass = "admin-page";

            if (UserId == 0)
            {
                Response.Redirect("~/Admin_Master_Nested/AdminUsers.aspx");
                return;
            }

            if (!IsPostBack)
                LoadUser();
        }
        private void LoadUser()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Id = @id", con);
                cmd.Parameters.AddWithValue("@id", UserId);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (!dr.Read())
                    {
                        Response.Redirect("~/Admin_Master_Nested/AdminUsers.aspx");
                        return;
                    }

                    txtUsername.Text = dr["Username"].ToString();
                    txtMail.Text = dr["mail"].ToString();
                    txtDate.Text = dr["date"].ToString();
                    txtFavoriteBreed.Text = dr["favoriteBreed"].ToString();
                    ddlGender.SelectedValue = dr["gender"].ToString();

                    string nl = dr["newLover"]?.ToString();
                    string ol = dr["oldLover"]?.ToString();
                    if (!string.IsNullOrEmpty(nl)) ddlNewLover.SelectedValue = nl;
                    if (!string.IsNullOrEmpty(ol)) ddlOldLover.SelectedValue = ol;

                    chkIsAdmin.Checked = dr["IsAdmin"] != DBNull.Value && (bool)dr["IsAdmin"];
                    chkIsHidden.Checked = dr["IsHidden"] != DBNull.Value && (bool)dr["IsHidden"];

                    // 🆕 שמור ערכים מקוריים ב-ViewState
                    ViewState["origUsername"] = dr["Username"].ToString();
                    ViewState["origMail"] = dr["mail"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!ValidateForm())
                return;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    string query = @"UPDATE Users SET Username=@username, mail=@mail,
    gender=@gender, date=@date, newLover=@newLover, oldLover=@oldLover,
    favoriteBreed=@favoriteBreed, IsAdmin=@isAdmin, IsHidden=@isHidden WHERE Id=@id";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@mail", txtMail.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@date", txtDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@newLover", string.IsNullOrEmpty(ddlNewLover.SelectedValue) ? (object)DBNull.Value : ddlNewLover.SelectedValue);
                    cmd.Parameters.AddWithValue("@oldLover", string.IsNullOrEmpty(ddlOldLover.SelectedValue) ? (object)DBNull.Value : ddlOldLover.SelectedValue);
                    cmd.Parameters.AddWithValue("@favoriteBreed", txtFavoriteBreed.Text.Trim());
                    cmd.Parameters.AddWithValue("@isAdmin", chkIsAdmin.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@isHidden", chkIsHidden.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@id", UserId);



                    cmd.ExecuteNonQuery();
                }

                ShowMessage("✅ User updated successfully!", true);
            }
            catch (Exception ex)
            {
                ShowMessage("❌ Error: " + ex.Message, false);
            }
        }

        private bool ValidateForm()
        {
            bool isValid = true;

            lblErrUsername.Visible = false;

            lblErrMail.Visible = false;
            lblErrGender.Visible = false;
            lblErrDate.Visible = false;
            lblErrFavoriteBreed.Visible = false;
            lblErrLovers.Visible = false;

            string username = txtUsername.Text.Trim();
            string mail = txtMail.Text.Trim();

            string origUsername = ViewState["origUsername"]?.ToString() ?? "";
            string origMail = ViewState["origMail"]?.ToString() ?? "";

            // ===== Username =====
            if (username.Length == 0)
            {
                ShowFieldError(lblErrUsername, "Username is required");
                isValid = false;
            }
            else if (username.Length < 4 || username.Length > 9)
            {
                ShowFieldError(lblErrUsername, "Username must be 4–9 characters");
                isValid = false;
            }
            else if (!Regex.IsMatch(username, @"^(?=.*[A-Za-z])[a-zA-Z0-9_]+$"))
            {
                ShowFieldError(lblErrUsername, "Only letters, numbers and _ — at least one letter");
                isValid = false;
            }
            // 🆕 בדוק כפילות רק אם שם משתמש השתנה
            else if (username != origUsername && UsernameExistsForOther(username))
            {
                ShowFieldError(lblErrUsername, "Username already taken by another user");
                isValid = false;
            }



            // ===== Email =====
            if (mail.Length == 0)
            {
                ShowFieldError(lblErrMail, "Email is required");
                isValid = false;
            }
            else if (!Regex.IsMatch(mail, @"^[^@\s]+@[^@\s]+\.[^@\s]{2,}$"))
            {
                ShowFieldError(lblErrMail, "Email is invalid");
                isValid = false;
            }
            // 🆕 בדוק כפילות רק אם אימייל השתנה
            else if (mail != origMail && EmailExistsForOther(mail))
            {
                ShowFieldError(lblErrMail, "Email already taken by another user");
                isValid = false;
            }

            // ===== Gender =====
            if (ddlGender.SelectedValue == "")
            {
                ShowFieldError(lblErrGender, "Please select a gender");
                isValid = false;
            }

            // ===== Date =====
            if (txtDate.Text.Trim().Length == 0)
            {
                ShowFieldError(lblErrDate, "Date of birth is required");
                isValid = false;
            }

            // ===== Favorite Breed =====
            if (txtFavoriteBreed.Text.Trim().Length == 0)
            {
                ShowFieldError(lblErrFavoriteBreed, "Favorite breed is required");
                isValid = false;
            }

            // ===== NewLover + OldLover =====
            if (ddlNewLover.SelectedValue == "Yes" && ddlOldLover.SelectedValue == "Yes")
            {
                ShowFieldError(lblErrLovers, "Cannot be both New Lover and Old Lover");
                isValid = false;
            }

            return isValid;
        }

        // בדיקת username — מתעלם מהמשתמש הנוכחי
        private bool UsernameExistsForOther(string username)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Username = @u AND Id != @id", con);
                cmd.Parameters.AddWithValue("@u", username);
                cmd.Parameters.AddWithValue("@id", UserId);
                return (int)cmd.ExecuteScalar() > 0;
            }
        }

        // בדיקת email — מתעלם מהמשתמש הנוכחי
        private bool EmailExistsForOther(string mail)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE mail = @m AND Id != @id", con);
                cmd.Parameters.AddWithValue("@m", mail);
                cmd.Parameters.AddWithValue("@id", UserId);
                return (int)cmd.ExecuteScalar() > 0;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin_Master_Nested/AdminUsers.aspx");
        }

        private void ShowFieldError(System.Web.UI.WebControls.Label lbl, string msg)
        {
            lbl.Text = msg;
            lbl.Visible = true;
        }

        private void ShowMessage(string msg, bool success)
        {
            lblMessage.Text = msg;
            lblMessage.Visible = true;
            lblMessage.Style["background-color"] = success ? "#d4edda" : "#f8d7da";
            lblMessage.Style["color"] = success ? "#155724" : "#721c24";
            lblMessage.Style["border"] = success ? "1px solid #c3e6cb" : "1px solid #f5c6cb";
        }
    }
}