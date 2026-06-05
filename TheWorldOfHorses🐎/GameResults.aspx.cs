using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class GameResults : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString; protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Score"] != null)
            {
                int score = Convert.ToInt32(Session["Score"]);
                string game = Session["GameName"] != null
                    ? Session["GameName"].ToString()
                    : "Game";
                for (int i=0;i<game.Length;i++)
                {
                    
                    if (game[i] >='A'&&game[i] <='Z')
                    {
                        
                    }
                }

                string maxQ_qury = "select MaxScore from GameScores where GameName=@GameName";
                int maxScore = 0;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(maxQ_qury, con);
                    cmd.Parameters.AddWithValue("@GameName", game);
                    maxScore = Convert.ToInt32(cmd.ExecuteScalar() ?? 0);
                }

                game = SplitStToWords(game);
                lblScore.Text = $"{score } / {maxScore}";
                lblGame.Text = game;

                // הודעה לפי ציון
                if (score == 5)
                    lblMessage.Text = "🔥 Perfect!";
                else if (score >= 3)
                    lblMessage.Text = "👍 Good job!";
                else
                    lblMessage.Text = "😅 Try again!";
            }
            else
            {
                lblScore.Text = "No score found!";
            }
        }
        private Boolean HasMoreThanOneCapitalLetter(string st)
        {
            for (int i = 1; i < st.Length; i++)
            {
                if (st[i] >= 'A' && st[i] <= 'Z')
                {
                   //alway true because in the game table i use Capital Letters insted of space 
                        return true;
                }

            }
            return false;
        }
        private string SplitStToWords(string st)
        {
            if (!HasMoreThanOneCapitalLetter(st))
                return st;//do nothing if there is only one capital letter

            string result = "";
            for (int i = 0; i < st.Length; i++)
            {
                if (st[i] >= 'A' && st[i] <= 'Z' && i != 0)
                {
                    result += " ";
                }
                result += st[i];
            }
            return result;
        }

    }
    
    
}