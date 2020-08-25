using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace COVID_19_Self_Assessment_System
{
    public partial class admin_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            SqlConnection connect = new SqlConnection(constring);
            if (!IsPostBack)
            {
                if (connect.State == ConnectionState.Open)
                {
                    connect.Close();
                }
                connect.Open();
            }
            display();
            connect.Close();
        }

        protected void display()
        {
            string constring = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            SqlConnection connect = new SqlConnection(constring);

            if (connect.State == ConnectionState.Open)
            {
                connect.Close();
            }
            connect.Open();

            SqlCommand cmd = connect.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from [dbo].[covidrecords]";
            if (connect.State == ConnectionState.Open)
            {
                connect.Close();
            }
            connect.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connect.Close();

        }

        protected void homepage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}