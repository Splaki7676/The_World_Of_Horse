using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__.Admin_Master_Nested_
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master.Master).BodyCssClass = "admin-page";

            if (!IsPostBack)
                LoadStats();
        }

        private void LoadStats()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Total users
                SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", con);
                lblTotalUsers.Text = cmdUsers.ExecuteScalar().ToString();

                // Total games played
                SqlCommand cmdGames = new SqlCommand("SELECT COUNT(*) FROM GameScores", con);
                lblTotalGames.Text = cmdGames.ExecuteScalar().ToString();

                // Top score
                SqlCommand cmdTop = new SqlCommand("SELECT MAX(BestScore) FROM GameScores", con);
                object top = cmdTop.ExecuteScalar();
                lblTopScore.Text = (top != null && top != DBNull.Value) ? top.ToString() : "0";


                // 🟢 Online Users (Application)
                lblOnlineUsers.Text =
                    (Application["OnlineUsers"] ?? 0).ToString();

                // 🔵 Logged In Users (Application)
                lblLoggedInUsers.Text =
                    (Application["LoggedInUsers"] ?? 0).ToString();

            }
        }
    }
}