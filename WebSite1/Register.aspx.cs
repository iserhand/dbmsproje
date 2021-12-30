using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    bool logged_in = false;
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtPassword.BorderColor = System.Drawing.Color.Empty;
        if (txtPassword.Text.Length < 6 || txtPassword.Text.Length > 18)
        {

            //Password contains less than 6 characters or more than 18 characters.
            txtPassword.BorderColor = System.Drawing.Color.Red;
            passwordError.Text = "Password Must Be Between at least 6,max 18 characters";
        }
        else
        {

            if (txtPassword.Text.Any(ch => !Char.IsLetterOrDigit(ch) || Char.IsWhiteSpace(ch)))
            {
                //Password has special characters 
                txtPassword.BorderColor = System.Drawing.Color.Red;
                passwordError.Text = "Password cannot contain special characters";
            }
            else
            {
                txtPassword.BorderColor = System.Drawing.Color.Empty;
                List<string> usernames = new List<string>();
                List<string> emails = new List<string>();


                Dbhelper helper = new Dbhelper();
                using (SqlCommand cmd = new SqlCommand("Select [username],[email] FROM [user]", helper.connect()))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            usernames.Add(reader.GetString(0));
                            emails.Add(reader.GetString(1));
                        }
                    }
                    if (usernames.Contains(txtUserName.Text))
                    {
                        usernameError.Text = "Username is already in use";
                        txtUserName.BorderColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        if (emails.Contains(txtMail.Text))
                        {
                            mailError.Text = "Mail is already in use";
                            txtMail.BorderColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            using (SqlCommand cmd2 = new SqlCommand("INSERT INTO [user] (username,email,password) " +
                                "values (@username,@email,@password)"
                                , helper.connect()))
                            {
                                cmd2.Parameters.AddWithValue("@username", txtUserName.Text);
                                cmd2.Parameters.AddWithValue("@email", txtMail.Text);
                                cmd2.Parameters.AddWithValue("@password",txtPassword.Text);
                                txtPassword.Text = "";
                                txtMail.Text = "";
                                txtUserName.Text = "";
                                Session.Timeout = 30;
                                Session.Add("usersession", txtUserName.Text);
                                Session.Add("usertype", 0);
                                helper.close();
                                Response.Redirect("/default.aspx");
                                
                                
                                try
                                {
                                    cmd2.ExecuteNonQuery();
                                }
                                catch (SqlException ex)
                                {
                                    //Exception
                                }
                                

                            }
                        }
                    }

                }



                helper.close();
                //Go register
            }

        }
        
    }
}