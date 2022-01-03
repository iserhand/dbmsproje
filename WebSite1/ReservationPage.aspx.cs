using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReservationPage : System.Web.UI.Page
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

    public string Name { get; set; }
    [StringLength(100)]

    public string Surname { get; set; }
    [StringLength(100)]

    public string Email { get; set; }
    [StringLength(100)]

    public DateTime ArrivalDateTime { get; set; }
    [StringLength(50)]

    public DateTime DepartureDateTime { get; set; }
    [StringLength(50)]

    public string Room { get; set; }

    public int NumberOfPeople { get; set; }
    [NotMapped]

    public string ArrivalDate => ArrivalDateTime.ToString("yyyy/MM/dd");

    public string DepartureDate => ArrivalDateTime.ToString("yyyy/MM/dd");


    protected void Button1_Click(object sender, EventArgs e)
    {
        txtName.BorderColor = System.Drawing.Color.Empty;
        if (txtName.Text.Length <= 0)
        {
            // The namespace must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;           
            nameError.Text = "This field is required.";
        }
        else if (txtSurname.Text.Length <= 0)
        {
            // The surname space must be filled.
            txtSurname.BorderColor = System.Drawing.Color.Red;
            surnameError.Text = "This field is required";
        }
        else if (txtEmail.Text.Length <= 0)
        {
            // The email space must be filled.
            txtEmail.BorderColor = System.Drawing.Color.Red;
            mailError.Text = "This field is required.";
        }
        else if (txtArrDate.Text.Length <= 0)
        {
            // The email space must be filled.
            txtArrDate.BorderColor = System.Drawing.Color.Red;
            arrivalError.Text = "This field is required.";
        }
        else if (txtDepDate.Text.Length <= 0)
        {
            // The email space must be filled.
            txtDepDate.BorderColor = System.Drawing.Color.Red;
            depatureError.Text = "This field is required.";
        }
        else if (txtRoom.Text.Length <= 0)
        {
            // The email space must be filled.
            txtRoom.BorderColor = System.Drawing.Color.Red;
            roomError.Text = "This field is required.";
        }
        else if (txtNum.Text.Length <= 0)
        {
            // The email space must be filled.
            txtNum.BorderColor = System.Drawing.Color.Red;
            questError.Text = "This field is required.";
        }
        else
        {
            List<string> names = new List<string>();
            List<string> surnames = new List<string>();
            List<string> emails = new List<string>();
            List<string> arrivalDates = new List<string>();
            List<string> depatureDates = new List<string>();
            List<string> roomNumbers = new List<string>();
            List<string> questNumbers = new List<string>();
            int hotelid = Convert.ToInt32(Session["hotelid"]);
            Dbhelper helper = new Dbhelper();
            using (SqlCommand cmd2 = new SqlCommand("INSERT INTO [reservation] (Reservation_Name, Reservation_Surname, Reservation_Email, Reservation_ArrDate, Reservation_DepDate, Reservation_Room, Reservation_Count,Hotel_ID) " +
                       "values (@Name, @Surname, @Email, @ArrivalDateTime, @DepatureDateTime, @Room, @NumberOfPeople,@hotelid)"
                       , helper.connect()))
            {
                cmd2.Parameters.AddWithValue("@Name", txtName.Text);
                cmd2.Parameters.AddWithValue("@Surname", txtSurname.Text);
                cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd2.Parameters.AddWithValue("@ArrivalDateTime", txtArrDate.Text);
                cmd2.Parameters.AddWithValue("@DepatureDateTime", txtDepDate.Text);
                cmd2.Parameters.AddWithValue("@Room", txtRoom.Text);
                cmd2.Parameters.AddWithValue("@NumberOfPeople", txtNum.Text);
                cmd2.Parameters.AddWithValue("@hotelid", hotelid);
                txtName.Text = "";
                txtSurname.Text = "";
                txtEmail.Text = "";
                txtArrDate.Text = "";
                txtDepDate.Text = "";
                txtRoom.Text = "";
                txtNum.Text = "";

                try
                {
                    cmd2.ExecuteNonQuery();

                    Response.Redirect("/default.aspx");

                }
                catch (SqlException ex)
                {
                    //Exception
                }
            }


            helper.close();
        }

    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/Default.aspx");
    }
}