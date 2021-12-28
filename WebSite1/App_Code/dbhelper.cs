using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

public class Dbhelper
{
    public SqlConnection connect()
    {
        SqlConnection conn = null;
        conn = new SqlConnection(@"Server=localhost\SQLEXPRESS01;Database=HotelDatabase;Trusted_Connection=True;");
        conn.Open();
        return conn;
    }
}