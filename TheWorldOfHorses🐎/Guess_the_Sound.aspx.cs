using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class Guess_the_Sound : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True";

        static List<string[]> allSounds = new List<string[]>
        {
            new string[] { "neigh",                "Neigh",         "נהירה",      "wav" },
            new string[] { "snort",                "Snort",         "נחירה",      "wav" },
            new string[] { "nicker",               "Nicker",        "גרגור",      "wav" },
            new string[] { "scream",               "Scream",        "צריחה",      "wav" },
            new string[] { "blow",                 "Blow",          "נשיפה",      "wav" },
            new string[] { "snore",                "Snore",         "נחירת שינה", "wav" },
            new string[] { "whinny",               "Whinny",        "ילילה",      "wav" },
            new string[] { "horse_eating_hay",     "Eating hay",    "אכילת שחת",  "wav" },
            new string[] { "horse_drinking_water", "Drinking",      "שתייה",      "wav" },
            new string[] { "horse_tail_swish",     "Tail swish",    "נדנוד זנב",  "m4a" },
            new string[] { "horse_teeth",          "Eating carrot", "אכילת גזר",  "m4a" },
            new string[] { "walk2_fotstepsts",     "Hooves",        "פרסות",      "wav" }
        };
        private List<string[]> Shuffle(List<string[]> list)
        {
            var rnd = new Random();
            var result = new List<string[]>(list);
            for (int i = result.Count - 1; i > 0; i--)
            {
                int j = rnd.Next(0, i + 1);
                var tmp = result[i];
                result[i] = result[j];
                result[j] = tmp;
            }
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "guess-sound-page";
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            var shuffled = Shuffle(allSounds);

            Session["Questions"] = shuffled.GetRange(0, 5);
            Session["CurrentQ"] = 0;
            Session["Score"] = 0;
            Session["GameLog"] = new List<string[]>();

            startScreen.Visible = false;
            gameScreen.Visible = true;

            LoadQuestion();
        }

        protected void btnAnswer_Click(object sender, EventArgs e)
        {
            var questions = (List<string[]>)Session["Questions"];

            if (questions == null)
            {
                Response.Redirect("GameResults.aspx");
                return;
            }

            int currentQ = (int)Session["CurrentQ"];

            if (currentQ >= questions.Count)
            {
                Response.Redirect("GameResults.aspx");
                return;
            }


            var scoreObj = Session["Score"];
            int score = scoreObj != null ? (int)scoreObj : 0;

            var gameLog = Session["GameLog"] as List<string[]>;
            if (gameLog == null)
                gameLog = new List<string[]>();

            var correct = questions[currentQ];
            var clicked = (Button)sender;
            string selected = clicked.CommandArgument;

            bool isRight = selected == correct[0];
            if (isRight) score++;

            gameLog.Add(new string[] {
                correct[1],
                clicked.Text,
                isRight ? "1" : "0"
            });

            Session["Score"] = score;
            Session["CurrentQ"] = currentQ + 1;
            Session["GameLog"] = gameLog;

            if (currentQ + 1 >= questions.Count)
            {
                Session["Score"] = score;
                Session["GameName"] = "Quiz";

                SaveScore(score, questions.Count);

                Response.Redirect("GameResults.aspx");
                return;
            }
            else
            {
                startScreen.Visible = false;
                gameScreen.Visible = true;
                LoadQuestion();
            }
        }

        private void LoadQuestion()
        {
            var questions = (List<string[]>)Session["Questions"];
            int currentQ = (int)Session["CurrentQ"];

            if (questions == null || currentQ >= questions.Count)
            {
                Response.Redirect("GameResults.aspx");
                return;
            }


            int score = (int)Session["Score"];
            var correct = questions[currentQ];

            lblRound.Text = "Round " + (currentQ + 1) + " / 5";
            lblScore.Text = "Score: " + score;

            // במקום gameAudio.Attributes["src"] = ...
            hfAudioSrc.Value = "Sounds/" + correct[0] + "." + correct[3];
            hfAudioType.Value = correct[3] == "m4a" ? "audio/mp4" : "audio/wav";

            // 3 תשובות שגויות
            var others = new List<string[]>(allSounds);
            others.RemoveAll(s => s[0] == correct[0]);
            others = Shuffle(others);

            // 4 אפשרויות מעורבבות
            var options = new List<string[]> { correct, others[0], others[1], others[2] };
            options = Shuffle(options);

            Button[] btns = { btnA, btnB, btnC, btnD };
            for (int i = 0; i < 4; i++)
            {
                btns[i].Text = options[i][1] + " — " + options[i][2];
                btns[i].CommandArgument = options[i][0];
            }
        }
        private void SaveScore(int score, int maxScore)
        {
            if (Session["id"] == null) return;

            int userId = Convert.ToInt32(Session["id"]);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlCommand cmdCheck = new SqlCommand(
                    "SELECT BestScore FROM GameScores WHERE UserId=@UserId AND GameName=@GameName", con);
                cmdCheck.Parameters.AddWithValue("@UserId", userId);
                cmdCheck.Parameters.AddWithValue("@GameName", "GuessSound");

                object existing = cmdCheck.ExecuteScalar();

                if (existing == null)
                {
                    SqlCommand cmdInsert = new SqlCommand(
                        "INSERT INTO GameScores (UserId, GameName, BestScore, FirstScore, MaxScore, Date, Attempts) " +
                        "VALUES (@UserId, @GameName, @Score, @Score, @MaxScore, @Date, 1)", con);
                    cmdInsert.Parameters.AddWithValue("@UserId", userId);
                    cmdInsert.Parameters.AddWithValue("@GameName", "GuessSound");
                    cmdInsert.Parameters.AddWithValue("@Score", score);
                    cmdInsert.Parameters.AddWithValue("@MaxScore", maxScore);
                    cmdInsert.Parameters.AddWithValue("@Date", DateTime.Now);
                    cmdInsert.ExecuteNonQuery();
                }
                else if (score > Convert.ToInt32(existing))
                {
                    SqlCommand cmdUpdate = new SqlCommand(
                        "UPDATE GameScores SET BestScore=@Score, Date=@Date, Attempts=Attempts+1 " +
                        "WHERE UserId=@UserId AND GameName=@GameName", con);
                    cmdUpdate.Parameters.AddWithValue("@Score", score);
                    cmdUpdate.Parameters.AddWithValue("@Date", DateTime.Now);
                    cmdUpdate.Parameters.AddWithValue("@UserId", userId);
                    cmdUpdate.Parameters.AddWithValue("@GameName", "GuessSound");
                    cmdUpdate.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmdAttempt = new SqlCommand(
                        "UPDATE GameScores SET Attempts=Attempts+1 " +
                        "WHERE UserId=@UserId AND GameName=@GameName", con);
                    cmdAttempt.Parameters.AddWithValue("@UserId", userId);
                    cmdAttempt.Parameters.AddWithValue("@GameName", "GuessSound");
                    cmdAttempt.ExecuteNonQuery();
                }
            }
        }
    }
}