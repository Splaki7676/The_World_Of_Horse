using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class myAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site1)Master).BodyCssClass = "account-page";
            if (Session["id"] == null)
              Response.Redirect("LoginPage.aspx");

            if (Session["successMsg"] != null)
            {
                successMsg.InnerText = Session["successMsg"].ToString();
                Session.Remove("successMsg");
            }

        }

       

        protected void delBT_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\aradl\source\repos\TheWorldOfHorses🐎\TheWorldOfHorses🐎\App_Data\Database1.mdf;Integrated Security=True");
                con.Open();
                string s = "delete from Users where id=" + int.Parse(Session["id"].ToString()) + "";
                SqlCommand cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery(); ;

                con.Close();


                Application.Lock();
                Application["LoggedInUsers"] =
                    Math.Max(0, (int)Application["LoggedInUsers"] - 1);
                Application.UnLock();


                Session.Clear();
                Session.Abandon();
                Response.Redirect("RegisterPage.aspx");
            }

        }

        protected void logOF_Click(object sender, EventArgs e)
        {
            ResetInfo();
            Response.Redirect("LoginPage.aspx");
        }

        public void ResetInfo()
        {
            Session.Clear();
            Session.Abandon();
        }


    }
}