using System;
using System.Web;
using System.Web.SessionState;

namespace TheWorldOfHorses__
{
    public class ShowPic : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            if (context.Session["ProfilePic"] != null)
            {


                byte[] pic = (byte[])context.Session["ProfilePic"];
                context.Response.ContentType = "image/jpeg";
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);

                context.Response.BinaryWrite(pic);
            }
            else
            {
                context.Response.StatusCode = 404;
            }
        }

        public bool IsReusable
        {
            get { return true; }
        }
    }
}