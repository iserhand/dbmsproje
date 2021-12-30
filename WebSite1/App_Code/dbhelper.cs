using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

public class Dbhelper
{
    private SqlConnection conn = null;
    public SqlConnection connect()
    {
        
        conn = new SqlConnection(@"Server=localhost\SQLEXPRESS01;Database=HotelDatabase;Trusted_Connection=True;");
        conn.Open();
        return conn;
    }
    public void close()
    {
        conn.Close();
    }
}