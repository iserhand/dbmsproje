using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HotelDetailPage : System.Web.UI.Page
{
    public int size = 5;
    List<int> idlist = new List<int>();
    List<String> namelist = new List<string>();
    List<String> comments = new List<String>();
    List<String> rating = new List<string>();
    List<String> usernames = new List<String>();
    protected void Page_Load(object sender, EventArgs e)
    {
        object sessiontxt = Session["usersession"];
        if (sessiontxt == null)
        {
            //User is not logged in 
            RegisterLinkLabel.Visible = true;
            LoginLinkLabel.Visible = true;
            LogOutButton.Visible = false;
            usernameLabel.Visible = false;
            lblEmptyLabel.Visible = false;
            Response.Redirect("Login.aspx");
        }
        else
        {
            //User is logged in
            RegisterLinkLabel.Visible = false;
            LoginLinkLabel.Visible = false;
            LogOutButton.Visible = true;
            usernameLabel.Visible = true;
            usernameLabel.Text = sessiontxt.ToString();
            lblEmptyLabel.Visible = true;
        }


        if (!IsPostBack)
        {
            Session.Add("detailindex", 1);
        }
        int index = Convert.ToInt32(Session["detailindex"]);
        populateCommentTable();
        showComments();
        btnPrev.Enabled = (index > 1);
        if (!btnPrev.Enabled)
        {
            btnPrev.Style.Add("color", "gray");
        }
        btnNext.Enabled = index < Math.Ceiling((Convert.ToInt32(namelist.Count) / (decimal)size));
        if (!btnNext.Enabled)
        {
            btnNext.Style.Add("color", "gray");
        }

        show_details();
    }


    public void show_details()
    {
        Dbhelper helper = new Dbhelper();
        Object hotelID = Session["hotelid"];
        using (SqlCommand cmd = new SqlCommand("Select  * FROM [hotels] WHERE ID = " + Convert.ToInt32(hotelID), helper.connect()))
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                reader.Read();
                String hotelName = " ";
                String hotelLocation = " ";
                String roomCount = " ";
                String hotelRating = " ";
                String ratingStar = " ";
                String hotelInfo = "";
                try
                {
                    hotelInfo = (reader.GetString(6));
                    hotelName = (reader.GetString(1));
                    hotelLocation = (reader.GetString(2));
                    roomCount = (reader.GetString(3));
                    hotelRating = (reader.GetString(4));
                    ratingStar = (reader.GetString(5));
                }
                catch (Exception ex)
                {

                }
                lblHotelName.Text = hotelName;
                lblHotelStar.Text = ratingStar;
                txtHotelInfo.Text = hotelInfo;
                lblHotelRating.Text = hotelRating;
                reader.Close();
            }
        }

        helper.close();
    }

    protected void populateCommentTable()
    {
        Object hotelID = Session["hotelid"];
        int index = Convert.ToInt32(Session["detailindex"]);
        Dbhelper helper = new Dbhelper();
        Dbhelper helper2 = new Dbhelper();
        namelist.Clear();
        idlist.Clear();
        rating.Clear();
        usernames.Clear();
        try
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM [comments] WHERE [hotel_id]='" + Convert.ToInt32(hotelID) + "'", helper.connect()))
            {
                using (SqlDataReader reader = cmd.ExecuteReader())
                {

                    while (reader.Read())
                    {
                        String temp = reader.GetString(1);
                        int id = Convert.ToInt32(temp);
                        using (SqlCommand cmd2 = new SqlCommand("SELECT [username] FROM [user] WHERE [ID]=" + id, helper2.connect()))
                        {
                            using (SqlDataReader reader2 = cmd2.ExecuteReader())
                            {
                                while (reader2.Read())
                                {
                                    usernames.Add(reader2.GetString(0));
                                }
                            }
                        }
                        namelist.Add(temp);
                        comments.Add(reader.GetString(2));
                        rating.Add(reader.GetString(4));
                    }
                }
            }
        }
        catch (Exception ex) { }
        helper.close();
        helper2.close();
        btnNext.Enabled = index < (Math.Ceiling((Convert.ToInt32(namelist.Count) / (decimal)size)));
        btnPrev.Enabled = index > 1;
        if (!btnNext.Enabled)
        {
            btnNext.Style.Add("color", "gray");
        }
        else
        {
            btnNext.Style.Add("color", "white");
        }
        if (!btnPrev.Enabled)
        {
            btnPrev.Style.Add("color", "gray");
        }
        else
        {
            btnPrev.Style.Add("color", "white");
        }
    }
    protected void showComments()
    {
        int index = Convert.ToInt32(Session["index"]);
        int tour = 0;
        int loopsize = index * size;
        if (index * size > namelist.Count)
            loopsize = namelist.Count;
        for (int i = ((index * size) - 5); i < (loopsize); i++)
        {
            switch (tour)
            {
                case 0:
                    Label11.Text = usernames[i];
                    Label12.Text = comments[i];
                    Label13.Text = rating[i];
                    break;
                case 1:
                    Label21.Text = usernames[i];
                    Label22.Text = comments[i];
                    Label23.Text = rating[i];
                    break;
                case 2:
                    Label31.Text = usernames[i];
                    Label32.Text = comments[i];
                    Label33.Text = rating[i];
                    break;
                case 3:
                    Label41.Text = usernames[i];
                    Label42.Text = comments[i];
                    Label43.Text = rating[i];
                    break;
                case 4:
                    Label51.Text = usernames[i];
                    Label52.Text = comments[i];
                    Label53.Text = rating[i];
                    break;
            }
            tour++;

        }
        while (tour < index * size)
        {
            switch (tour)
            {
                case 0:
                    Label11.Text = " ";
                    Label12.Text = " ";
                    Label13.Text = " ";
                    break;
                case 1:
                    Label21.Text = " ";
                    Label22.Text = " ";
                    Label23.Text = " ";
                    break;
                case 2:
                    Label31.Text = " ";
                    Label32.Text = " ";
                    Label33.Text = " ";
                    break;
                case 3:
                    Label41.Text = " ";
                    Label42.Text = " ";
                    Label43.Text = " ";
                    break;
                case 4:
                    Label51.Text = " ";
                    Label52.Text = " ";
                    Label53.Text = " ";
                    break;
            }
            tour++;
        }
        btnNext.Enabled = index < (Math.Ceiling((Convert.ToInt32(namelist.Count) / (decimal)size)));
        btnPrev.Enabled = index > 1;
        if (!btnNext.Enabled)
        {
            btnNext.Style.Add("color", "gray");
        }
        else
        {
            btnNext.Style.Add("color", "white");
        }
        if (!btnPrev.Enabled)
        {
            btnPrev.Style.Add("color", "gray");
        }
        else
        {
            btnPrev.Style.Add("color", "white");
        }
        populateCommentTable();
    }
    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");

    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        if (!btnPrev.Enabled)
            return;
        int index = Convert.ToInt32(Session["detailindex"]);
        index = index - 1;
        btnNext.Enabled = index < (Math.Ceiling((Convert.ToInt32(namelist.Count) / (decimal)size)));
        btnPrev.Enabled = index > 1;
        if (!btnNext.Enabled)
        {
            btnNext.Style.Add("color", "gray");
        }
        else
        {
            btnNext.Style.Add("color", "white");
        }
        if (!btnPrev.Enabled)
        {
            btnPrev.Style.Add("color", "gray");
        }
        else
        {
            btnPrev.Style.Add("color", "white");
        }
        Session["detailindex"] = index;
        populateCommentTable();
        showComments();
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!btnNext.Enabled)
            return;
        int index = Convert.ToInt32(Session["detailindex"]);
        index = index + 1;
        btnPrev.Enabled = (index > 1);
        btnNext.Enabled = index < (Math.Ceiling((Convert.ToInt32(namelist.Count) / (decimal)size)));
        if (!btnPrev.Enabled)
        {
            btnPrev.Style.Add("color", "gray");
        }
        else
        {
            btnPrev.Style.Add("color", "white");
        }
        if (!btnNext.Enabled)
        {
            btnNext.Style.Add("color", "gray");
        }
        else
        {
            btnNext.Style.Add("color", "white");
        }
        Session["detailindex"] = index;
        populateCommentTable();
        showComments();
    }

    protected void btnAddComment_Click(object sender, EventArgs e)
    {
        int hotelid = Convert.ToInt32(Session["hotelid"]);
        int userid = Convert.ToInt32(Session["userid"]);

        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("INSERT INTO [comments] (user_id,comment,hotel_id,rating) VALUES (@userid,@comment,@hotelid,@rating)", helper.connect()))
        {
            try
            {
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@comment", txtComment.Text);
                cmd.Parameters.AddWithValue("@hotelid", hotelid);
                cmd.Parameters.AddWithValue("@rating", txtRating.Text);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
        }
        helper.close();
        populateCommentTable();
        showComments();
    }

}