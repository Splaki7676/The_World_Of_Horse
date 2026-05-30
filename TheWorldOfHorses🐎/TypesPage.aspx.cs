using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Web.Services;

namespace TheWorldOfHorses__
{
    public partial class TypesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "types-page";
        }


        [WebMethod] // מאפשר קריאה לפונקציה זו מהדפדפן באמצעות JavaScript (לחיצות וכדומה)

        /// <summary>
        /// Adds or removes a horse in the current user's favorites: if the horse is already in favorites it is removed,
        /// otherwise it is added. If the user is not logged in the method returns false.
        /// </summary>
        /// <param name="horseName">Name of the horse to add or remove from favorites</param>
        /// <returns>True if the horse was added to favorites; False if it was removed or if the user is not logged in</returns>
        public static bool ToggleFavorite(string horseName)
        {
            if (HttpContext.Current.Session["id"] == null)
            {
                return false;
            }

            int userId = Convert.ToInt32(HttpContext.Current.Session["id"]);
            string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                string checkQuery = "SELECT COUNT(*) FROM UserFavorites WHERE UserId=@UserId AND HorseName=@HorseName";

                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@UserId", userId);
                checkCmd.Parameters.AddWithValue("@HorseName", horseName);

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists > 0)
                {
                    string deleteQuery = "DELETE FROM UserFavorites WHERE UserId=@UserId AND HorseName=@HorseName";

                    SqlCommand delCmd = new SqlCommand(deleteQuery, con);
                    delCmd.Parameters.AddWithValue("@UserId", userId);
                    delCmd.Parameters.AddWithValue("@HorseName", horseName);
                    delCmd.ExecuteNonQuery();

                    return false;
                }
                else
                {
                    string insertQuery = "INSERT INTO UserFavorites (UserId, HorseName) VALUES (@UserId, @HorseName)";

                    SqlCommand insCmd = new SqlCommand(insertQuery, con);
                    insCmd.Parameters.AddWithValue("@UserId", userId);
                    insCmd.Parameters.AddWithValue("@HorseName", horseName);
                    insCmd.ExecuteNonQuery();

                    return true;
                }
            }
        }

        [WebMethod]

        /// <summary>
        /// מחזיר רשימה של כל הסוסים שהמשתמש המחובר סימן כמועדפים.
        /// אם המשתמש לא מחובר מוחזרת רשימה ריקה.
        /// </summary>
        /// <returns>רשימת שמות של סוסים מועדפים</returns>

        public static List<string> GetFavorites()
        {
            if (HttpContext.Current.Session["id"] == null)
                return new List<string>();

            int userId = Convert.ToInt32(HttpContext.Current.Session["id"]);

            string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";

            List<string> favorites = new List<string>();

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                string query = "SELECT HorseName FROM UserFavorites WHERE UserId=@UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    favorites.Add(reader["HorseName"].ToString());
                }
            }

            return favorites;
        }
    }
}