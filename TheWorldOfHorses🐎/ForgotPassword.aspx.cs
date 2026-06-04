using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TheWorldOfHorses__
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "login-page";

            if (IsPostBack)
            {
                string email = Request.Form["emailInput"]?.Trim();

                if (string.IsNullOrEmpty(email))
                {
                    msgDiv.InnerText = "Please enter your email.";
                    msgDiv.Style["color"] = "red";
                    return;
                }

                using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True"))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "SELECT id, Username FROM Users WHERE mail=@mail", con);
                    cmd.Parameters.AddWithValue("@mail", email);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (!reader.Read())
                    {
                        reader.Close();
                        msgDiv.InnerText = "Email not found.";
                        msgDiv.Style["color"] = "red";
                        return;
                    }

                    int userId = (int)reader["id"];
                    string username = reader["Username"].ToString();
                    reader.Close();

                    string token = Guid.NewGuid().ToString();
                    DateTime expiry = DateTime.Now.AddHours(1);

                    SqlCommand saveToken = new SqlCommand(
                        "INSERT INTO PasswordResets (userId, token, expiry) VALUES (@userId, @token, @expiry)", con);
                    saveToken.Parameters.AddWithValue("@userId", userId);
                    saveToken.Parameters.AddWithValue("@token", token);
                    saveToken.Parameters.AddWithValue("@expiry", expiry);
                    saveToken.ExecuteNonQuery();

                    string resetLink = $"https://localhost:44359/ResetPassword.aspx?token={token}";
                    SendResetEmail(email, username, resetLink);

                    msgDiv.InnerText = "Reset link sent! Check your email.";
                    msgDiv.Style["color"] = "green";
                }
            }

        }
        private void SendResetEmail(string toEmail, string username, string resetLink)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.From = new System.Net.Mail.MailAddress("aradlopmm2020@gmail.com");
            mail.To.Add(toEmail);
            mail.Subject = "Password Reset - The World Of Horses";
            mail.Body = $"Hi {username},\n\nClick the link below to reset your password:\n{resetLink}\n\nThe link expires in 1 hour.";

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            // Use credentials from web.config for security
            string smtpEmail = ConfigurationManager.AppSettings["SmtpEmail"];
            string smtpPassword = ConfigurationManager.AppSettings["SmtpPassword"];
            smtp.Credentials = new System.Net.NetworkCredential(smtpEmail, smtpPassword);
            
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
    }
}