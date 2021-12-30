using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object sessiontxt = Session["usersession"];
        if (sessiontxt == null)
        {
            //User is not logged in 
            RegisterLinkLabel.Visible = true;
            LoginLinkLabel.Visible = true;
            LogOutButton.Visible = false;
        }
        else
        {
            //User is logged in
            RegisterLinkLabel.Visible = false;
            LoginLinkLabel.Visible = false;
            LogOutButton.Visible = true;
            usernameLabel.Visible = true;
            usernameLabel.Text=sessiontxt.ToString();
        }
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");
    }
}
