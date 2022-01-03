using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Add("PageLoad", 1);
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
        object usertype = Session["usertype"];
        if (usertype == null)
        {
            //Acces denied
            //Response.redirect(Accesdenied.aspx);
        }
        else
        {
            if ((int)usertype == 1)
            {
                //Access

            }
            else
            {
                //Access denied
                //Response.redirect(Accesdenied.aspx);
            }
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
    private void populateHotelTable()
    {
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("SELECT [ID] ,[Hotel_Name],[Hotel_Location],[Hotel_RoomsCount],[Hotel_Rating],[Hotel_Star] from [hotels]", helper.connect()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Hotel Details");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView2.Visible = false;
            GridView1.Visible = true;
            helper.close();

        }
    }
    private void populateAdminTable()
    {
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("SELECT * from [user] WHERE [usertype]!= 0", helper.connect()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Admin details");
            GridView2.DataSource = ds;
            GridView2.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = true;
            helper.close();


        }
    }

    protected void btnManageHotels_Click(object sender, EventArgs e)
    {
        GridView2.Visible = false;
        GridView1.Visible = true;
        populateHotelTable();
    }

    protected void btnManageAdmins_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = true;
        populateAdminTable();
    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        GridView1.EditIndex = e.NewEditIndex;
        populateHotelTable();

    }
    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {


        Dbhelper helper = new Dbhelper();
        Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        TextBox name = GridView1.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
        TextBox location = GridView1.Rows[e.RowIndex].FindControl("txt_City") as TextBox;
        TextBox rooms = GridView1.Rows[e.RowIndex].FindControl("txt_Rooms") as TextBox;
        TextBox rating = GridView1.Rows[e.RowIndex].FindControl("txt_Rating") as TextBox;
        TextBox star = GridView1.Rows[e.RowIndex].FindControl("txt_Star") as TextBox;

        using (SqlCommand cmd = new SqlCommand("Update hotels set Hotel_Name='" + name.Text + "',Hotel_Location='" + location.Text + "',Hotel_RoomsCount='"
            + Convert.ToInt32(rooms.Text) + "',Hotel_Rating='" + Convert.ToDouble(rating.Text) + "',Hotel_Star='" + Convert.ToDouble(star.Text) + "'where ID=" + Convert.ToInt32(id.Text), helper.connect()))
        {
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            populateHotelTable();
            helper.close();

        }
    }
    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        populateHotelTable();
    }
    protected void GridView2_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e2)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        GridView2.EditIndex = e2.NewEditIndex;
        GridView2.Visible = false;
        populateAdminTable();

    }
    protected void GridView2_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e2)
    {
        Dbhelper helper = new Dbhelper();
        Label id = GridView2.Rows[e2.RowIndex].FindControl("lbl_ID") as Label;
        TextBox name = GridView2.Rows[e2.RowIndex].FindControl("txt_Name") as TextBox;
        TextBox location = GridView2.Rows[e2.RowIndex].FindControl("txt_password") as TextBox;
        TextBox rooms = GridView2.Rows[e2.RowIndex].FindControl("txt_email") as TextBox;
        TextBox rating = GridView2.Rows[e2.RowIndex].FindControl("txt_date") as TextBox;
        TextBox star = GridView2.Rows[e2.RowIndex].FindControl("txt_usertype") as TextBox;

        using (SqlCommand cmd = new SqlCommand("Update [user] set username='" + name.Text + "',password='" + location.Text + "',email='"
            + rooms.Text + "',date_registered='" + rating.Text + "',usertype='" + star.Text + "'where ID=" + Convert.ToInt32(id.Text), helper.connect()))
        {
            cmd.ExecuteNonQuery();
            GridView2.EditIndex = -1;
            populateAdminTable();
            helper.close();

        }
    }
    protected void GridView2_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e2)
    {
        GridView2.EditIndex = -1;
        populateAdminTable();
    }
    public void btnSave_Click(object sender, EventArgs e)
    {
        Dbhelper helper = new Dbhelper();
        Button btn = (Button)sender;
        GridViewRow GrdRow = (GridViewRow)btn.Parent.Parent;

        TextBox name = GrdRow.Cells[0].FindControl("txt_Namein") as TextBox;
        TextBox location = GrdRow.Cells[0].FindControl("txt_passwordin") as TextBox;
        TextBox rooms = GrdRow.Cells[0].FindControl("txt_emailin") as TextBox;
        TextBox star = GrdRow.Cells[0].FindControl("txt_usertypein") as TextBox;
        GridView2.DataSource = null;
        GridView2.DataBind();
        using (SqlCommand cmd = new SqlCommand("INSERT INTO [user] (username,email,password,usertype) values (@username,@email,@password,@usertype)", helper.connect()))
        {
            cmd.Parameters.AddWithValue("@username", name.Text);
            cmd.Parameters.AddWithValue("@email", rooms.Text);
            cmd.Parameters.AddWithValue("@password", location.Text);
            cmd.Parameters.AddWithValue("@usertype", star.Text);
            cmd.ExecuteNonQuery();
            helper.close();
        }

        populateAdminTable();
        Response.Redirect(Request.RawUrl);
    }
    public void btnSave_Click2(object sender, EventArgs e)
    {

        Dbhelper helper = new Dbhelper();
        Button btn = (Button)sender;
        GridViewRow GrdRow = (GridViewRow)btn.Parent.Parent;

        TextBox name = GrdRow.Cells[0].FindControl("txt_Namein") as TextBox;
        TextBox location = GrdRow.Cells[0].FindControl("txt_Cityin") as TextBox;
        TextBox rooms = GrdRow.Cells[0].FindControl("txt_Roomsin") as TextBox;
        TextBox star = GrdRow.Cells[0].FindControl("txt_Starin") as TextBox;
        GridView2.DataSource = null;
        GridView2.DataBind();

        using (SqlCommand cmd = new SqlCommand("INSERT INTO [hotels] (Hotel_Name,Hotel_Location,Hotel_RoomsCount,Hotel_Star) values (@username,@email,@password,@usertype)", helper.connect()))
        {
            cmd.Parameters.AddWithValue("@username", name.Text);
            cmd.Parameters.AddWithValue("@email", location.Text);
            cmd.Parameters.AddWithValue("@password", rooms.Text);
            cmd.Parameters.AddWithValue("@usertype", star.Text);
            cmd.ExecuteNonQuery();
            helper.close();


        }

        populateHotelTable();
        Response.Redirect(Request.RawUrl);
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");
    }
}