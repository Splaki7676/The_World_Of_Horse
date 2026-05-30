using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string BodyCssClass = "home-page"; //הוספת משתנה שיאפשר  שינוי קלאס לבאדי
        protected void Page_Load(object sender, EventArgs e)
        {
            IsAdminUser = false; // ברירת מחדל

            if (Session["id"] != null)
            {
                int userId = Convert.ToInt32(Session["id"]);
                IsAdminUser = CheckIfUserIsAdmin(userId);
            }

            // לאחר בדיקת IsAdminUser
            string currentPage = System.IO.Path.GetFileName(Request.Path)?.ToLower() ?? "";
            var allowedPublic = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
{
    "loginpage.aspx",
    "registerpage.aspx",
    "forgotpassword.aspx",
    "resetpassword.aspx",
    "homepage.aspx"
};

            if (Session["id"] == null && !allowedPublic.Contains(currentPage))
            {
                Response.Redirect("~/HomePage.aspx");
                return;
            }

        }




        protected void logOut_Click(object sender, EventArgs e)
        {

            Application.Lock();
            Application["LoggedInUsers"] =
                Math.Max(0, (int)Application["LoggedInUsers"] - 1);
            Application.UnLock();

            ResetInfo();
            Response.Redirect("HomePage.aspx");


        }
        public void ResetInfo()
        {
            Session.Clear();
            Session.Abandon();
        }












        protected bool IsAdminUser;



        private bool CheckIfUserIsAdmin(int userId)
        {
            string connectionString =
                @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT IsAdmin FROM Users WHERE Id = @UserId",
                    con
                );

                cmd.Parameters.AddWithValue("@UserId", userId);

                object result = cmd.ExecuteScalar();

                if (result == null)
                    return false;

                return Convert.ToBoolean(result);
            }
        }
    }
}