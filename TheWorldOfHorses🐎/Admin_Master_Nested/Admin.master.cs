using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__.Admin_Master_Nested_
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // בדיקה שהמשתמש מחובר והוא מנהל


            if ((Session["id"] == null) || (Session["IsAdmin"] == null) || (Session["IsAdmin"] as bool? != true))
            {
                Response.Redirect("~/HomePage.aspx");
            }


        }
    }
}