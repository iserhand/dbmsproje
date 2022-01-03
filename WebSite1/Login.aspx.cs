using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userPass = Request.Form["userPassword"];
        Console.Write(userPass);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        String username =txtUserName.Text;
        usernameError.Text = "";
        passwordError.Text = "";
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("Select [password],[usertype] FROM [user] WHERE [username]='" + username+"'", helper.connect()))
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (!reader.HasRows)
                {
                    //Username does not exist
                    usernameError.Text = "User does not exist";
                    usernameError.Visible = true;
                }
                while (reader.Read())
                {
                    String passw = reader.GetString(0);
                    int usertype = reader.GetInt32(1);

                    if (passw.Equals(txtPassword.Text))
                    {
                        Session.Timeout = 20;
                        Session.Add("usersession", username);
                        Session.Add("usertype", usertype);
                        
                        switch (usertype)
                        {
                            case 0:
                                helper.close();
                                Response.Redirect("/Default.aspx");
                                break;
                            case 1:
                                //System admin
                                Response.Redirect("/admPanel.aspx");
                                break;
                            default:
                                //Hotel admin specified
                                Response.Redirect("/hotelAdmPanel.aspx");
                                break;
                        }

                    }
                    else
                    {
                        //Password is wrong 
                        passwordError.Text = "Wrong password";
                    }
                }

            }
            helper.close();
        }

    }
}