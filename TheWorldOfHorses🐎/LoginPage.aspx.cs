using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TheWorldOfHorses__
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        string Username, password;
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "login-page"; //משנה שם קלאס לבאדי בדף התחברות

         

            if (IsPostBack)// תנאי שבודק אם יש נתונים לשמור - כלומר האם המשתמש הכניס נתונים 
            {


                Username = Request.Form["Username"].ToString().Trim();
                password = Request.Form["password"].ToString().Trim();

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "SELECT id FROM Users WHERE Username=@Username AND password=@password", con);
                    cmd.Parameters.AddWithValue("@Username", Username);
                    cmd.Parameters.AddWithValue("@password", password);

                    object obj = cmd.ExecuteScalar();

                    if (obj != null)
                    {
                        ClearError(loginError);

                        Session["Username"] = Username;
                        Session["id"] = obj;

                        Application.Lock();
                        Application["LoggedInUsers"] =
                            (int)Application["LoggedInUsers"] + 1;
                        Application.UnLock();

                        // שליפת mail מה-DB ושמירה ב-Session
                        SqlCommand cmdMail = new SqlCommand(
                            "SELECT mail FROM Users WHERE id=@id", con);
                        cmdMail.Parameters.AddWithValue("@id", obj);
                        Session["mail"] = cmdMail.ExecuteScalar().ToString();

                        // 🆕 טעינת תמונת פרופיל מהמסד
                        SqlCommand cmdPic = new SqlCommand(
                            "SELECT ProfilePic FROM Users WHERE id=@id", con);
                        cmdPic.Parameters.AddWithValue("@id", obj);
                        object pic = cmdPic.ExecuteScalar();
                        if (pic != null && pic != DBNull.Value)
                            Session["ProfilePic"] = (byte[])pic;

                        // 🆕 קביעת אדמין לפי ID
                        SqlCommand cmdIsAdmin = new SqlCommand(
                           "SELECT IsAdmin FROM Users WHERE id=@id", con);
                        cmdIsAdmin.Parameters.AddWithValue("@id", obj);
                        object isAdmin = cmdIsAdmin.ExecuteScalar();
                        Session["IsAdmin"] = (isAdmin != null && isAdmin != DBNull.Value && (bool)isAdmin);


                        Response.Redirect("HomePage.aspx");
                      
                    }
                    else
                    {
                        // שגיאה — משתמש לא נמצא
                        SetError(loginError, "Username or password is incorrect!");
                    }

                }
            }

        }
        //show error message in div and style it
        public void SetError(HtmlGenericControl div,string msg)
        {
            div.Style["font-size"] = "14px";
            div.Style["color"] = "red";
            div.InnerText = msg;
            if (div == loginError)
            {
                div.Style["text-align"] = "center";
                div.Style["font-size"] = "22px";
            }

        }
        //clear error message from div
        public void ClearError(HtmlGenericControl div)
        {
            div.InnerText = "";

        }
    }
}