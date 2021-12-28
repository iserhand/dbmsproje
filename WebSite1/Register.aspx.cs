using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text.Length < 6|| txtPassword.Text.Length >18)
        {   
            
            //Password contains less than 6 characters or more than 18 characters.
            txtPassword.BorderColor = System.Drawing.Color.Red;
        }
        else
        {
            
            if (txtPassword.Text.Any(ch => !Char.IsLetterOrDigit(ch)||Char.IsWhiteSpace(ch)))
            {
                //Password has special characters 
                txtPassword.BorderColor = System.Drawing.Color.Red;
            }
            else
            {
                txtPassword.BorderColor = System.Drawing.Color.Empty;
                //Go register
            }
        }

    }
}