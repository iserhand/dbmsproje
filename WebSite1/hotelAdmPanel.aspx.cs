using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class hotelAdmPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object usertype = Session["usertype"];
        if (usertype == null)
        {
            //Acces denied
            //Response.redirect(Accesdenied.aspx);
        }
        else
        {
            if ((int)usertype == 0)
            {
                //Access denied
                //Response.redirect(Accesdenied.aspx);
            }
            else
            {
                //Access granted

            }
        }

        if (!IsPostBack)
        {
            populateDropdownImages();
            

        }
    }
    protected void showHotelInfo()
    {
        object hotel = Session["usertype"];
        int hotelid = Convert.ToInt32(hotel);
        Dbhelper helper = new Dbhelper();
        using (SqlCommand cmd = new SqlCommand("SELECT * from [hotels] WHERE ID=", helper.connect()))
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    reader.GetString(0);
                    txtHotelName.Text = reader.GetString(1);
                    txtLocation.Text = reader.GetString(2);
                    txtRoomsCount.Text = reader.GetString(3);
                    lblRating.Text = reader.GetString(4);
                    lblStar.Text = reader.GetString(5);
                    txtInfo.Text = reader.GetString(6);
                }
            }
            helper.close();
        }


    }
    protected void populateDropdownImages()
    {
        Dbhelper helper = new Dbhelper();
        object hotel = Session["usertype"];
        int hotelid = Convert.ToInt32(hotel);
        using (SqlCommand cmd = new SqlCommand("SELECT [ID],[imgName] from [images] WHERE [hotelID]=" + hotelid, helper.connect()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "imgName";
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataBind();
            helper.close();
        }
    }
    protected void btnSaveImg_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        object hotel = Session["usertype"];
        int hotelid = Convert.ToInt32(hotel);
        Dbhelper dbhelper = new Dbhelper();
        if (FileUpload1.HasFile)
        {
            try
            {
                sb.AppendFormat(" Uploading file: {0}", hotelid + "_" + FileUpload1.FileName);

                //saving the file
                string strFileName;
                string strFilePath;
                string strFolder;
                strFolder = Server.MapPath("images//");

                strFileName = FileUpload1.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                strFilePath = strFolder + strFileName;

                if (File.Exists(strFilePath))
                {
                    //File already exist
                    sb.Clear();
                    sb.Append("File already exist");
                }
                else
                {
                    FileUpload1.PostedFile.SaveAs(strFilePath);
                    SqlCommand cmd = new SqlCommand("INSERT INTO [images] (imgName,hotelID) values (@imgName,@hotelID)", dbhelper.connect());
                    cmd.Parameters.AddWithValue("@imgName", strFileName);
                    cmd.Parameters.AddWithValue("@hotelID", hotelid);
                    cmd.ExecuteNonQuery();
                    dbhelper.close();
                    //Showing the file information
                    sb.AppendFormat("<br/> Save As: {0}", FileUpload1.PostedFile.FileName);
                    sb.AppendFormat("<br/> File type: {0}", FileUpload1.PostedFile.ContentType);
                    sb.AppendFormat("<br/> File length: {0}", FileUpload1.PostedFile.ContentLength);
                    sb.AppendFormat("<br/> File name: {0}", FileUpload1.PostedFile.FileName);
                }

            }
            catch (Exception ex)
            {
                sb.Append("<br/> Error <br/>");
                sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
            }
        }
        else
        {
            lblmessage.Text = sb.ToString();
        }
        lblmessage.Text = sb.ToString();
        populateDropdownImages();
    }


    protected void btnDeleteImg_Click(object sender, EventArgs e)
    {

        String strFileName = DropDownList1.SelectedItem.ToString();
        String png_id = DropDownList1.SelectedValue;
        FileInfo file = new FileInfo(Server.MapPath("images//") + strFileName);
        Dbhelper dbhelper = new Dbhelper();
        if (file.Exists)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [images] WHERE ID= '" + Convert.ToInt32(png_id) + "'", dbhelper.connect());
                file.Delete();
                lblmessage.Text = "Deleted " + strFileName;
                cmd.ExecuteNonQuery();
                dbhelper.close();
            }
            catch (Exception ex)
            {
                lblmessage.Text = ex.Message;
            }
        }
        else
        {
            lblmessage.Text = "Error deleting the file";
        }
        populateDropdownImages();
    }


    protected void btnImgView_Click(object sender, EventArgs e)
    {
        String strFileName = DropDownList1.SelectedItem.ToString();
        imgPreview.ImageUrl = "~//images//" + strFileName;
        imgPreview.Width = 450;


    }





    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}