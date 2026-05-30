using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class GameResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Score"] != null)
            {
                int score = Convert.ToInt32(Session["Score"]);
                string game = Session["GameName"] != null
                    ? Session["GameName"].ToString()
                    : "Game";

                lblScore.Text = score + " / 5";
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
                lblScore.Text = "No score found";
            }
        }

    }
}