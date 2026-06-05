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
    public partial class ResetPassword : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "login-page";


            string token = Request.QueryString["token"];


            if (string.IsNullOrEmpty(token))
            {
               
                msgDiv.InnerText = "Invalid reset link.";
                msgDiv.Style["color"] = "red";
                formFields.Style["display"] = "none";
                return;
            }

            if (IsPostBack)
            {
                string newPass = Request.Form["newPass"]?.Trim();

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // בדיקת טוקן תקין ולא פג תוקף
                    SqlCommand checkToken = new SqlCommand(
                        "SELECT userId FROM PasswordResets WHERE token=@token AND expiry > @now", con);
                    checkToken.Parameters.AddWithValue("@token", token);
                    checkToken.Parameters.AddWithValue("@now", DateTime.Now);
                    object result = checkToken.ExecuteScalar();

                    if (result == null)
                    {
                        msgDiv.InnerText = "Reset link expired or invalid.";
                        msgDiv.Style["color"] = "red";
                        formFields.Style["display"] = "none";
                        return;
                    }

                    int userId = (int)result;

                    // עדכון הסיסמא
                    SqlCommand updatePass = new SqlCommand(
                        "UPDATE Users SET password=@password WHERE id=@id", con);
                    updatePass.Parameters.AddWithValue("@password", newPass);
                    updatePass.Parameters.AddWithValue("@id", userId);
                    updatePass.ExecuteNonQuery();

                    // מחיקת הטוקן מהטבלה
                    SqlCommand deleteToken = new SqlCommand(
                        "DELETE FROM PasswordResets WHERE token=@token", con);
                    deleteToken.Parameters.AddWithValue("@token", token);
                    deleteToken.ExecuteNonQuery();

                    msgDiv.InnerText = "success";
                    formFields.Style["display"] = "none";
                }
            }

        }
    }
}