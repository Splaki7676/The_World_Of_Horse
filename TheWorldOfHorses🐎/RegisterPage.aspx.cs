using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TheWorldOfHorses__
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        string Username, password, password2, mail, gender, date, terms, newLover, oldLover, favoriteBreed;

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "register-page"; //משנה שם קלאס לבאדי בדף הרשמה

            if (IsPostBack && Session["Username"] != null)
            {

                //this.GetType() – מזהה את סוג העמוד הנוכחי (RegisterPage).
                //"RestoreFields" – זהו המפתח  הייחודי של הסקריפט. הוא נועד למנוע מצב שבו אותו סקריפט יוזרק פעמיים בטעות לאותו דף.

                /// <summary>
                /// Sends JavaScript to the browser to update form fields using Session values.
                /// </summary>
                /// <remarks>
                /// RegisterStartupScript means:
                /// - Register = add a script to the page
                /// - Startup = run when the page finishes loading
                /// - Script = JavaScript code
                ///
                /// In other words: it injects JavaScript that runs after the page is loaded in the browser.
                /// </remarks>
                /// <param name="__startStep">
                ///Sends a JavaScript flag to indicate the user came from a server action.
                ///This keeps the form on the correct step instead of resetting.
                /// </param>

                Page.ClientScript.RegisterStartupScript(this.GetType(), "RestoreFields",
                    $"document.getElementById('Username').value = '{Session["Username"]}'; " +
                    $"document.getElementById('password').value = '{Session["password"]}'; " +
                    $"document.getElementById('password2').value = '{Session["password2"]}'; " +
                    $"document.getElementById('mail').value = '{Session["mail"] ?? ""}'; " +
                    $"var genderVal = '{Session["gender"] ?? ""}'; " +
                    $"if(genderVal) document.querySelector('input[name=\"gender\"][value=\"' + genderVal + '\"]').checked = true; " +
                    $"document.getElementById('date').value = '{Session["date"] ?? ""}'; ",
                    true);
            }

        }

        //input: field name in the database, value to check
        //output: true if the value is unique (not exists in the database), false if it already exists
        protected bool CheckFieldServer(string fieldName, string fieldValue)
        {

            // בדיקה במסד הנתונים אם כבר קיים
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string query = $"SELECT COUNT(*) FROM Users WHERE {fieldName}=@Value";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Value", fieldValue);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    return false;
                }
            }

            return true;
        }
        /// <summary>
        /// checks if all fields are valid, and can move to step 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNextStep1_Click(object sender, EventArgs e)
        {

            // שמירה ב-sesion
            Session["Username"] = Request.Form["Username"].ToString();
            Session["password"] = Request.Form["password"].ToString();
            Session["password2"] = Request.Form["password2"].ToString();

            string error = "username already exsist";

            Username = Request.Form["Username"].ToString();

            //// בדיקה אם שם המשתמש קיים
            if (!CheckFieldServer("Username", Username))
            {
                UsernameDiv.InnerText = error;

                // כשיש שגיאה — מחזיר ערכים לשדות ✅
                Page.ClientScript.RegisterStartupScript(this.GetType(), "StayStep1",
                    $"var __startStep = true; " +
                    $"document.getElementById('Username').value = '{Session["Username"]}'; " +
                    $"document.getElementById('password').value = '{Session["password"]}'; " +
                    $"document.getElementById('password2').value = '{Session["password2"]}'; " +
                    $"showStep(1);", true);

                return; // אם יש שגיאה – לא ממשיכים
            }


            //// אם הגענו לכאן – הכל תקין, אפשר להמשיך לשלב הבא
            UsernameDiv.InnerText = "";

            // אם הכל בסדר – שולחים JS לעבור לשלב הבא

            Page.ClientScript.RegisterStartupScript(this.GetType(), "NextStep",
   $"var __startStep = true; step1Progress = 100; UsernameFlag = true; passwordFlag = true; password2Flag = true; updateV(1); " +
   $"document.getElementById('Username').value = '{Session["Username"]}'; " +
   $"document.getElementById('password').value = '{Session["password"]}'; " +
   $"document.getElementById('password2').value = '{Session["password2"]}'; " +
   $"showStep(2);", true);


        }
        protected void btnNextStep2_Click(object sender, EventArgs e)
        {

            // שמירה ב-Session
            Session["mail"] = Request.Form["mail"].ToString();
            Session["gender"] = Request.Form["gender"].ToString();
            Session["date"] = Request.Form["date"].ToString();

            string error = "Email already exsist";

            mail = Request.Form["mail"].ToString();

            if (!CheckFieldServer("mail", mail))
            {
                mailDiv.InnerText = error;


                // כשיש שגיאה — מחזיר ערכים לשדות ✅
                Page.ClientScript.RegisterStartupScript(this.GetType(), "StayStep1",
                    $"var __startStep = true; " +
                    $"document.getElementById('mail').value = '{Session["mail"]}'; " +
                    $"var genderVal = '{Session["gender"]}'; " +
                    $"document.querySelector('input[name=\"gender\"][value=\"' + genderVal + '\"]').checked = true; " +
                    $"document.getElementById('date').value = '{Session["date"]}'; " +
                    $"showStep(2);", true);


                return;
            }

            mailDiv.InnerText = "";

            Page.ClientScript.RegisterStartupScript(this.GetType(), "NextStep2",
                $"var __startStep = true; step1Progress = 100; step2Progress = 100; " +
                $"UsernameFlag = true; passwordFlag = true; password2Flag = true; " +
                $"mailFlag = true; genderFlag = true; birthdayFlag = true; " +
                $"document.getElementById('mail').value = '{Session["mail"]}'; " +
                $"var genderVal = '{Session["gender"]}'; " +
                $"document.querySelector('input[name=\"gender\"][value=\"' + genderVal + '\"]').checked = true; " +
                $"document.getElementById('date').value = '{Session["date"]}'; " +
                $"updateV(1); updateV(2); showStep(3);", true);


        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {


            //~~~~~~~~~~~~~~~~~~~~~~~~~~~  *שלב 1* ~~~~~~~~~~~~~~~~~~~~~~~
            Username = Request.Form["Username"].ToString();
            password = Request.Form["password"].ToString();
            password2 = Request.Form["password2"].ToString();
            // ~~~~~~~~~~~~~~~~~~~~~~~~~ *שלב 2* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            mail = Request.Form["mail"].ToString();
            gender = Request.Form["gender"].ToString();
            date = Request.Form["date"].ToString();
            //~~~~~~~~~~~~~~~~~~~~~~~~~~~ *שלב 3*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            terms = Request.Form["terms"].ToString();

            if (Request.Form["newLover"] != null && Request.Form["oldLover"] == null)
                newLover = Request.Form["newLover"].ToString();

            else if (Request.Form["oldLover"] != null && Request.Form["newLover"] == null)
                oldLover = Request.Form["oldLover"].ToString();

            favoriteBreed = Request.Form["favoriteBreed"].ToString();



            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string check = "SELECT COUNT(*) FROM Users WHERE " +
                    "Username=@Username OR mail=@mail ";
                SqlCommand checkCmd = new SqlCommand(check, con);

                checkCmd.Parameters.AddWithValue("@Username", Username);
                checkCmd.Parameters.AddWithValue("@mail", mail);

                int count = (int)checkCmd.ExecuteScalar();
                if (count > 0)
                {
                    UsernameDiv.InnerText = "Username or email already exists!";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "GoStep1",
                     $"var __startStep = true; UsernameFlag = true; passwordFlag = true; password2Flag = true; mailFlag = true; genderFlag = true; birthdayFlag = true; checkBoxFlag = true; selectFlag = true; step1Progress = 100; step2Progress = 100; updateV(1); updateV(2); updateV(3); " +
                     $"document.getElementById('Username').value = '{Session["Username"]}'; " +
                     $"document.getElementById('password').value = '{Session["password"]}'; " +
                     $"document.getElementById('password2').value = '{Session["password2"]}'; " +
                     $"document.getElementById('mail').value = '{Session["mail"]}'; " +
                     $"var genderVal = '{Session["gender"]}'; " +
                     $"document.querySelector('input[name=\"gender\"][value=\"' + genderVal + '\"]').checked = true; " +
                     $"document.getElementById('date').value = '{Session["date"]}'; " +
                     $"showStep(1);", true);


                    return;
                }
                else
                {

                    string s = "insert into Users(Username,password,password2,mail,gender,date,terms,newLover,oldLover,favoriteBreed)" +
                    "values(@Username,@password,@password2,@mail,@gender,@date,@terms,@newLover,@oldLover,@favoriteBreed); " +
                    "SELECT CAST(scope_identity() AS int)";
                    SqlCommand cmd = new SqlCommand(s, con);
                    cmd.Parameters.AddWithValue("@Username", Username);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@password2", password2);
                    cmd.Parameters.AddWithValue("@mail", mail);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@terms", terms);
                    cmd.Parameters.AddWithValue("@newLover", newLover ?? "");
                    cmd.Parameters.AddWithValue("@oldLover", oldLover ?? "");
                    cmd.Parameters.AddWithValue("@favoriteBreed", favoriteBreed ?? "");


                    // מקבל את ה-ID של השורה שהכנסת עכשיו
                    int newUserId = (int)cmd.ExecuteScalar();

                    // שמירה ב-Session
                    Session["Username"] = Username;
                    Session["id"] = newUserId;
                    Session["date"] = date;
                    Session["favoriteBreed"] = favoriteBreed;
                    Session["mail"] = mail;

                    Application.Lock();
                    Application["LoggedInUsers"] =
                        (int)Application["LoggedInUsers"] + 1;
                    Application.UnLock();



                    Response.Redirect("HomePage.aspx");


                }


            }





        }




    }
}