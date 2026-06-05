using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__.Admin_Master_Nested
{
    public partial class AdminAddUser : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master.Master).BodyCssClass = "admin-page";

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!ValidateForm())
                return;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    string query = @"INSERT INTO Users 
                        (Username, password, password2, mail, gender, date, terms, newLover, oldLover, favoriteBreed, IsAdmin, IsHidden)
                        VALUES 
                        (@username, @password, @password2, @mail, @gender, @date, '1', @newLover, @oldLover, @favoriteBreed, @isAdmin, 0)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@password2", txtPassword2.Text.Trim());
                    cmd.Parameters.AddWithValue("@mail", txtMail.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@date", txtDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@newLover", string.IsNullOrEmpty(ddlNewLover.SelectedValue) ? (object)DBNull.Value : ddlNewLover.SelectedValue);
                    cmd.Parameters.AddWithValue("@oldLover", string.IsNullOrEmpty(ddlOldLover.SelectedValue) ? (object)DBNull.Value : ddlOldLover.SelectedValue);
                    cmd.Parameters.AddWithValue("@favoriteBreed", txtFavoriteBreed.Text.Trim());
                    cmd.Parameters.AddWithValue("@isAdmin", chkIsAdmin.Checked ? 1 : 0);
                    cmd.ExecuteNonQuery();
                }

                ShowMessage("✅ User added successfully!", true);
                ClearForm();
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
            lblErrPassword.Visible = false;
            lblErrPassword2.Visible = false;
            lblErrMail.Visible = false;
            lblErrGender.Visible = false;
            lblErrDate.Visible = false;
            lblErrFavoriteBreed.Visible = false;
            lblErrLovers.Visible = false;

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string password2 = txtPassword2.Text.Trim();
            string mail = txtMail.Text.Trim();

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
            else if (UsernameExists(username))
            {
                ShowFieldError(lblErrUsername, "Username already exists");
                isValid = false;
            }

            // ===== Password =====
            if (password.Length == 0)
            {
                ShowFieldError(lblErrPassword, "Password is required");
                isValid = false;
            }
            else if (password.Length < 6)
            {
                ShowFieldError(lblErrPassword, "Password must be at least 6 characters");
                isValid = false;
            }
            else if (!Regex.IsMatch(password, @"[0-9]"))
            {
                ShowFieldError(lblErrPassword, "Password must contain at least one number");
                isValid = false;
            }
            else if (Regex.Matches(password, @"[a-zA-Z]").Count < 3)
            {
                ShowFieldError(lblErrPassword, "Password must contain at least 3 letters");
                isValid = false;
            }

            // ===== Confirm Password =====
            if (password2.Length == 0)
            {
                ShowFieldError(lblErrPassword2, "Please confirm the password");
                isValid = false;
            }
            else if (password2 != password)
            {
                ShowFieldError(lblErrPassword2, "Passwords do not match");
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
            else if (EmailExists(mail))
            {
                ShowFieldError(lblErrMail, "Email already exists");
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

        private bool UsernameExists(string username)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username = @u", con);
                cmd.Parameters.AddWithValue("@u", username);
                return (int)cmd.ExecuteScalar() > 0;
            }
        }

        private bool EmailExists(string mail)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE mail = @m", con);
                cmd.Parameters.AddWithValue("@m", mail);
                return (int)cmd.ExecuteScalar() > 0;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            lblMessage.Visible = false;
        }

        private void ClearForm()
        {
            txtUsername.Text = txtPassword.Text = txtPassword2.Text =
                txtMail.Text = txtDate.Text = txtFavoriteBreed.Text = "";
            ddlGender.SelectedIndex = ddlNewLover.SelectedIndex = ddlOldLover.SelectedIndex = 0;
            chkIsAdmin.Checked = false;

            lblErrUsername.Visible = lblErrPassword.Visible = lblErrPassword2.Visible =
                lblErrMail.Visible = lblErrGender.Visible = lblErrDate.Visible =
                lblErrFavoriteBreed.Visible = lblErrLovers.Visible = false;
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