using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();

            // Redirect to login page
            Response.Redirect("~/Login.aspx");
        }
    }
}