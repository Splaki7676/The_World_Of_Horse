using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheWorldOfHorses__
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string BodyCssClass = "home-page"; //הוספת משתנה שיאפשר  שינוי קלאס לבאדי
        protected void Page_Load(object sender, EventArgs e)
        {

        }

  
        

        protected void logOut_Click(object sender, EventArgs e)
        {
                ResetInfo();
            Response.Redirect("HomePage.aspx");

        }
        public void ResetInfo()
        {
            Session.Clear();
            Session.Abandon();
        }
    }
}