using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__.Admin_Master_Nested_
{
    public partial class AdminUsers : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master.Master).BodyCssClass = "admin-page";

            if (!IsPostBack)
                LoadUsers();

        }
        private void LoadUsers()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // שליפת כל המשתמשים עם הציון הכי טוב שלהם מ-GameScores
                string query = @"
                    SELECT u.Id, u.Username, u.mail, u.gender, u.favoriteBreed,
                    u.IsAdmin,
                    MAX(g.BestScore) AS BestScore,
                    SUM(g.Attempts) AS Attempts
                    FROM Users u
                    LEFT JOIN GameScores g ON u.Id = g.UserId
                    GROUP BY u.Id, u.Username, u.mail, u.gender, u.favoriteBreed, u.IsAdmin";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptUsers.DataSource = dt;
                rptUsers.DataBind();
            }
        }

        protected void btnHide_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int userId = int.Parse(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Users SET IsHidden = 1 WHERE Id = @id", con);
                cmd.Parameters.AddWithValue("@id", userId);
                cmd.ExecuteNonQuery();
            }

            LoadUsers();
        }
    }
}