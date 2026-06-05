using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class EditProfile : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString; protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "edit-page"; //משנה שם קלאס לבאדי בדף עדכון נתונים 

            if (Session["id"] == null)
                Response.Redirect("LoginPage.aspx");


            if (Session["verified"] != null)
            {
                editFields.Style["display"] = "block";
            }


        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string newUsername = textBox_Username.Text.Trim();
            string newEmail = textBox_Email.Text.Trim();
            string newPass = textBox_NewPass.Text.Trim();
            string imageBase64 = croppedImageData.Value;

            bool hasError = false;

            //Div ניקוי שגיאות
            UsernameDiv.InnerText = "";
            emailDiv.InnerText = "";
            newPassDiv.InnerText = "";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();



                // בדיקת כפילות Username
                if (newUsername != Session["Username"].ToString())
                {
                    SqlCommand checkUsername = new SqlCommand(
                        "SELECT COUNT(*) FROM Users WHERE Username=@Username AND id!=@id", con);
                    checkUsername.Parameters.AddWithValue("@Username", newUsername);
                    checkUsername.Parameters.AddWithValue("@id", Session["id"]);
                    int usernameCount = (int)checkUsername.ExecuteScalar();

                    if (usernameCount > 0)
                    {
                        UsernameDiv.InnerText = "Username already exists!";
                        hasError = true;
                    }
                }

                // בדיקת כפילות Email
                if (newEmail != Session["mail"].ToString())
                {
                    SqlCommand checkEmail = new SqlCommand(
                        "SELECT COUNT(*) FROM Users WHERE mail=@mail AND id!=@id", con);
                    checkEmail.Parameters.AddWithValue("@mail", newEmail);
                    checkEmail.Parameters.AddWithValue("@id", Session["id"]);
                    int emailCount = (int)checkEmail.ExecuteScalar();

                    if (emailCount > 0)
                    {
                        emailDiv.InnerText = "Email already exists!";
                        hasError = true;
                    }
                }

                if (hasError) return;

                var setParts = new List<string>();

                if (!string.IsNullOrEmpty(newUsername) && newUsername != Session["Username"].ToString())
                    setParts.Add("Username=@Username");

                if (!string.IsNullOrEmpty(newEmail) && newEmail != Session["mail"].ToString())
                    setParts.Add("mail=@mail");

                if (!string.IsNullOrEmpty(newPass))
                    setParts.Add("password=@password");

                if (!string.IsNullOrEmpty(imageBase64))
                    setParts.Add("ProfilePic=@ProfilePic");

                if (setParts.Count == 0)
                {
                    Session.Remove("verified");
                    Session["successMsg"] = "No changes were made.";
                    Response.Redirect("myAccount.aspx");
                    return;
                }

                // עדכון במסד הנתונים
                string updateQuery = "UPDATE Users SET " + string.Join(", ", setParts) + " WHERE id=@id";






                SqlCommand updateCmd = new SqlCommand(updateQuery, con);

                if (!string.IsNullOrEmpty(newUsername) && newUsername != Session["Username"].ToString())
                {
                    updateCmd.Parameters.AddWithValue("@Username", newUsername);
                    Session["Username"] = newUsername;

                }
                if (!string.IsNullOrEmpty(newEmail) && newEmail != Session["mail"].ToString())
                {
                    updateCmd.Parameters.AddWithValue("@mail", newEmail);
                    Session["mail"] = newEmail;

                }
                if (!string.IsNullOrEmpty(newPass))
                    updateCmd.Parameters.AddWithValue("@password", newPass);

                if (!string.IsNullOrEmpty(imageBase64))
                {
                    string base64Data = imageBase64.Substring(imageBase64.IndexOf(",") + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64Data);
                    updateCmd.Parameters.AddWithValue("@ProfilePic", imageBytes);
                    Session["ProfilePic"] = imageBytes;
                }



                updateCmd.Parameters.AddWithValue("@id", Session["id"]);

                updateCmd.ExecuteNonQuery();





                Session.Remove("verified");

                Session["successMsg"] = "Profile updated successfully!";

                Response.Redirect("myAccount.aspx");

            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("verified");
            Response.Redirect("myAccount.aspx");
        }
        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string currentPass = textBox_currentPass.Text.Trim();

            if (string.IsNullOrEmpty(currentPass))
            {
                currentPassDiv.InnerText = "Please enter your current password";
                return;
            }

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE id=@id AND password=@password", con);
                cmd.Parameters.AddWithValue("@id", Session["id"]);
                cmd.Parameters.AddWithValue("@password", currentPass);

                int count = (int)cmd.ExecuteScalar();

                if (count == 0)
                {
                    currentPassDiv.InnerText = "Current password is incorrect!";
                    editFields.Style["display"] = "none";
                    return;
                }

                // סיסמא נכונה — פותח את השדות
                currentPassDiv.InnerText = "";
                editFields.Style["display"] = "block";

                Session["verified"] = true;
            }
        }
    }
}