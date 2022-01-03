using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HotelDetailPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Add("hotelID", 1);
        show_details();
    }


    public void show_details()
    {
        Dbhelper helper = new Dbhelper();

        Object hotelID = Session["hotelID"];
        using (SqlCommand cmd = new SqlCommand("Select  * FROM [hotels] WHERE ID = " + Convert.ToInt32(hotelID), helper.connect()))
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                reader.Read();
                String hotelName = (reader.GetString(1));
                String hotelLocation = (reader.GetString(2));
                String roomCount = (reader.GetString(3));
                String hotelRating = (reader.GetString(4));
                String ratingStar = (reader.GetString(5));

                hotelDetails.Text = hotelName + " " + hotelLocation + " " + hotelName + " " + roomCount + " " + hotelRating + " " + ratingStar;

                reader.Close();
            }
        }

        using (SqlCommand cmd2 = new SqlCommand("Select  * FROM [comment] WHERE id = " + Convert.ToInt32(hotelID), helper.connect()))
        {
            using (SqlDataReader reader2 = cmd2.ExecuteReader())
            {
                String id = (reader2.GetString(1));
                String userID = (reader2.GetString(2));
                String comment = (reader2.GetString(3));
                String hotelId = (reader2.GetString(4));

                commentBox.Text = comment;

                reader2.Close();
            }
        }

        helper.close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}