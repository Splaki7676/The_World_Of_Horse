using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class quis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int score = 0;

                string q1 = Request.Form["q1"];
                string q2 = Request.Form["q2"];
                string q3 = Request.Form["q3"];
                string q4 = Request.Form["q4"];

                // בדיקה אם המשתמש בכלל בחר תשובה
                if (q1 != null && q1 == "Thoroughbred")
                    score= UpdateScore(score);

                if (q2 != null && q2 == "Pony")
                    score = UpdateScore(score);

                if (q3 != null && q3 == "1")
                    score = UpdateScore(score);

                if (q4 != null && q4 == "Hay")
                    score = UpdateScore(score);

                // הודעה לפי ציון
                if (score == 100)
                    finalScore.InnerHtml = "🔥 Perfect! Your score is: " + score;
                else if (score >= 50)
                    finalScore.InnerHtml = "👍 Good job! Your score is: " + score;
                else
                    finalScore.InnerHtml = "😅 Keep practicing! Your score is: " + score;

            }

          



        }
        public int UpdateScore(int score)
        {
            return score + 25;
        }
    }
}