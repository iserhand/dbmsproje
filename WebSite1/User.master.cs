using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
    public int size = 5;
    List<int> idlist = new List<int>();
    List<String> namelist = new List<string>();
    List<String> locations = new List<String>();
    List<String> rating = new List<string>();
    List<String> stars = new List<String>();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Session.Add("city", "");
            Session.Add("index", 1);
            Session.Add("hotelid", 0);

        }
        int index = Convert.ToInt32(Session["index"]);
        populateHotelList();
        loadHotelList();
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
        object sessiontxt = Session["usersession"];
        if (sessiontxt == null)
        {
            //User is not logged in 
            RegisterLinkLabel.Visible = true;
            LoginLinkLabel.Visible = true;
            LogOutButton.Visible = false;
            usernameLabel.Visible = false;
            lblEmptyLabel.Visible = false;
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
    }
    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");
    }

    protected void populateHotelList()
    {

        int index = Convert.ToInt32(Session["index"]);
        String city = Convert.ToString(Session["city"]);
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("SELECT [ID] ,[Hotel_Name],[Hotel_Location],[Hotel_Rating],[Hotel_Star] from [hotels] WHERE [Hotel_Location] LIKE '%" + city + "%'ORDER BY [Hotel_Rating] DESC", helper.connect()))
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                namelist.Clear();
                idlist.Clear();
                locations.Clear();
                rating.Clear();
                stars.Clear();
                while (reader.Read())
                {
                    idlist.Add(reader.GetInt32(0));
                    namelist.Add(reader.GetString(1));
                    locations.Add(reader.GetString(2));
                    rating.Add(reader.GetString(3));
                    stars.Add(reader.GetString(4));
                }
            }
        }
        helper.close();
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
    protected void loadHotelList()
    {
        btnSelectHotel1.Visible = true;
        btnSelectHotel2.Visible = true;
        btnSelectHotel3.Visible = true;
        btnSelectHotel4.Visible = true;
        btnSelectHotel5.Visible = true;

        int index = Convert.ToInt32(Session["index"]);
        int tour = 0;
        int loopsize = index * size;
        if (index * size > idlist.Count)
            loopsize = idlist.Count;
        for (int i = ((index * size) - 5); i < (loopsize); i++)
        {
            switch (tour)
            {
                case 0:
                    Label11.Text = namelist[i];
                    Label12.Text = locations[i];
                    Label14.Text = stars[i];
                    Label13.Text = rating[i];
                    break;
                case 1:
                    Label21.Text = namelist[i];
                    Label22.Text = locations[i];
                    Label24.Text = stars[i];
                    Label23.Text = rating[i];
                    break;
                case 2:
                    Label31.Text = namelist[i];
                    Label32.Text = locations[i];
                    Label34.Text = stars[i];
                    Label33.Text = rating[i];
                    break;
                case 3:
                    Label41.Text = namelist[i];
                    Label42.Text = locations[i];
                    Label44.Text = stars[i];
                    Label43.Text = rating[i];
                    break;
                case 4:
                    Label51.Text = namelist[i];
                    Label52.Text = locations[i];
                    Label54.Text = stars[i];
                    Label53.Text = rating[i];
                    break;
            }
            tour++;

        }
        while (tour < index*size)
        {
            switch (tour)
            {
                case 0:
                    Label11.Text = " ";
                    Label12.Text = " ";
                    Label13.Text = " ";
                    Label14.Text = " ";
                    btnSelectHotel1.Visible = false;
                    break;
                case 1:
                    Label21.Text = " ";
                    Label22.Text = " ";
                    Label23.Text = " ";
                    Label24.Text = " ";
                    btnSelectHotel2.Visible = false;
                    break;
                case 2:
                    Label31.Text = " ";
                    Label32.Text = " ";
                    Label33.Text = " ";
                    Label34.Text = " ";
                    btnSelectHotel3.Visible = false;
                    break;
                case 3:
                    Label41.Text = " ";
                    Label42.Text = " ";
                    Label43.Text = " ";
                    Label44.Text = " ";
                    btnSelectHotel4.Visible = false;
                    break;
                case 4:
                    Label51.Text = " ";
                    Label52.Text = " ";
                    Label53.Text = " ";
                    Label54.Text = " ";
                    btnSelectHotel5.Visible = false;
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
        populateHotelList();
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        if (!btnPrev.Enabled)
            return;
        int index = Convert.ToInt32(Session["index"]);
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
        Session["index"] = index;
        populateHotelList();
        loadHotelList();
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!btnNext.Enabled)
            return;
        int index = Convert.ToInt32(Session["index"]);
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
        Session["index"] = index;
        populateHotelList();
        loadHotelList();

    }

    protected void btnSelectHotel1_Click(object sender, EventArgs e)
    {
        int index = Convert.ToInt32(Session["index"]);
        Session["hotelid"] = idlist[(index * size) - 5];
        Response.Redirect("HotelDetailPage.aspx");
    }

    protected void btnSelectHotel2_Click(object sender, EventArgs e)
    {
        int index = Convert.ToInt32(Session["index"]);
        Session["hotelid"] = idlist[(index * size) - 4];
        Response.Redirect("HotelDetailPage.aspx");
    }

    protected void btnSelectHotel3_Click(object sender, EventArgs e)
    {
        int index = Convert.ToInt32(Session["index"]);
        Session["hotelid"] = idlist[(index * size) - 3];
        Response.Redirect("HotelDetailPage.aspx");
    }

    protected void btnSelectHotel4_Click(object sender, EventArgs e)
    {
        int index = Convert.ToInt32(Session["index"]);
        Session["hotelid"] = idlist[(index * size) - 2];
        Response.Redirect("HotelDetailPage.aspx");
    }

    protected void btnSelectHotel5_Click(object sender, EventArgs e)
    {
        int index = Convert.ToInt32(Session["index"]);
        Session["hotelid"] = idlist[(index * size) - 1];
        Response.Redirect("HotelDetailPage.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["city"] = txtCitySearch.Text;
        populateHotelList();
        loadHotelList();
    }
}
