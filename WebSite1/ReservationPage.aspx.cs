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
            txtName.Text = "This field is required.";
        }
        else if(txtSurname.Text.Length <= 0)
        {
            // The surname space must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;
            txtName.Text = "This field is required.";
        }
        else if(txtEmail.Text.Length <= 0)
        {
            // The email space must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;
            txtName.Text = "This field is required.";
        }
        else if (txtArrDate.Text.Length <= 0)
        {
            // The email space must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;
            txtName.Text = "This field is required.";
        }
        else if (txtDepDate.Text.Length <= 0)
        {
            // The email space must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;
            txtName.Text = "This field is required.";
        }
        else if (txtRoom.Text.Length <= 0)
        {
            // The email space must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;
            txtName.Text = "This field is required.";
        }
        else if (txtNum.Text.Length <= 0)
        {
            // The email space must be filled.
            txtName.BorderColor = System.Drawing.Color.Red;
            txtName.Text = "This field is required.";
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

            Dbhelper helper = new Dbhelper();
            using (SqlCommand cmd = new SqlCommand("Select [Reservation_Name], [Reservation_Surname], [Reservation_Email], [Reservation_ArrDate], [Reservation_DepDate], [Reservation_Room], [Reservation_Count] FROM [reservation]", helper.connect()))
            {
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        names.Add(reader.GetString(0));
                        surnames.Add(reader.GetString(1));
                        emails.Add(reader.GetString(2));
                        arrivalDates.Add(reader.GetString(3));
                        depatureDates.Add(reader.GetString(4));
                        roomNumbers.Add(reader.GetString(5));
                        questNumbers.Add(reader.GetString(6));
                    }

                    using (SqlCommand cmd2 = new SqlCommand("INSERT INTO [reservation] (Reservation_Name, Reservation_Surname, Reservation_Email, Reservation_ArrDate, Reservation_DepDate, Reservation_Room, Reservation_Count) " +
                               "values (@Name, @Surname, @Email, @ArrivalDateTime, @DepatureDateTime, @Room, @NumberOfPeople)"
                               , helper.connect()))
                    {
                        cmd2.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd2.Parameters.AddWithValue("@Surname", txtSurname.Text);
                        cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd2.Parameters.AddWithValue("@ArrivalDateTime", txtArrDate.Text);
                        cmd2.Parameters.AddWithValue("@DepatureDateTime", txtDepDate.Text);
                        cmd2.Parameters.AddWithValue("@Room", txtRoom.Text);
                        cmd2.Parameters.AddWithValue("@NumberOfPeople", txtNum.Text);
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
                }
            }
            helper.close();
        }

    }
}