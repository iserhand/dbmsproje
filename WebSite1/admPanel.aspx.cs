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
            GridView1.Visible = true;
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


    }
    private void populateHotelTable()
    {
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("SELECT * from [hotels]", helper.connect()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Hotel Details");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
            helper.close();

        }
    }
    private void populateAdminTable()
    {
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("SELECT [username],[password],[email],[date_registered],[usertype] from [user] WHERE [usertype]!= 0", helper.connect()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Admin details");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
            helper.close();
            

        }
    }

    protected void btnManageHotels_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        populateHotelTable();
    }

    protected void btnManageAdmins_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
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


        /* {
             String id = GridView1.Rows[e.RowIndex].Cells[0].Text;
             String name = GridView1.Rows[e.RowIndex].Cells[1].Text;
             String password = GridView1.Rows[e.RowIndex].Cells[2].Text;
             String email = GridView1.Rows[e.RowIndex].Cells[3].Text;
             String usertype = GridView1.Rows[e.RowIndex].Cells[4].Text;

             using (SqlCommand cmd = new SqlCommand("Update user set username='" + name + "',password='" + password + "',email='" +
                 email + "'usertype='" + usertype + "'where ID=" + id, helper.connect()))
             {
                 cmd.ExecuteNonQuery();
                 populateAdminTable();
                 GridView1.EditIndex = -1;
             }

         }
        */
        //updating the record  
        /*SqlCommand cmd = new SqlCommand("Update tbl_Employee set Name='" + name.Text + "',City='" + city.Text + "' where ID=" + Convert.ToInt32(id.Text), con);
        cmd.ExecuteNonQuery();
        con.Close();
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView1.EditIndex = -1;
        //Call ShowData method for displaying updated data  
        ShowData();
        */
    }
    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView1.EditIndex = -1;
        populateHotelTable();
    }
}