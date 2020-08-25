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
    public partial class Homepage : System.Web.UI.Page
    {
        static int total_score;
        string resultdata = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            SqlConnection connect = new SqlConnection(constring);
            if (!IsPostBack)
            {
                total_score = 0;
                MultiView1.ActiveViewIndex = 0;
                if (connect.State == ConnectionState.Open)
                {
                    connect.Close();
                }
                connect.Open();
            }

        }

        protected void step1next_Click(object sender, EventArgs e)
        {
            if (age.Text != "" && temperature.Text != "" && sex.SelectedValue != "0")
            {
                message.Visible = false;
                bool strfound = false;
                int dot = 0;

                foreach (char ch in temperature.Text)
                {
                    //Response.Write(ch);
                    if (Char.IsDigit(ch) || ch == '.')
                    {
                        //Response.Write(ch);
                        if (ch == '.')
                        {
                            dot++;
                        }
                    }
                    else
                    {
                        strfound = true;
                        break;
                    }
                }

                if (strfound || dot > 1)
                {
                    message.Text = "Invalid Input!";
                    message.Visible = true;
                }
                else
                {
                    if (double.Parse(temperature.Text) > 99.5 || double.Parse(temperature.Text) > 100.9)
                    {
                        total_score = total_score + 2;
                    }
                    MultiView1.ActiveViewIndex = 1;
                    //Response.Write(total_score);
                }
            }
            else
            {
                message.Text = "*Please fill up all the field!";
                message.Visible = true;
            }
        }

        protected void step2prev_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void step2next_Click(object sender, EventArgs e)
        {

            int count_selection = 0;

            foreach (ListItem li in symptom_checkbox.Items)
            {
                if (li.Selected)
                {
                    count_selection = count_selection + 1;
                }
            }
            if (count_selection != 0)
            {
                total_score = total_score + count_selection + 2;
            }
            MultiView1.ActiveViewIndex = 2;
            //Response.Write(total_score);
        }

        protected void step3prev_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            int count_selection = 0;
            foreach (ListItem li in add_symptom_checkbox.Items)
            {
                if (li.Selected)
                {  
                    count_selection = count_selection + 1;
                }
            }
            if (count_selection != 0)
            {
                total_score = total_score + count_selection * 2;
            }
            MultiView1.ActiveViewIndex = 3;
            //Response.Write(total_score);

            ageLiteral.Text = age.Text;
            tempLiteral.Text = temperature.Text;
            sexLiteral.Text = sex.SelectedItem.Text;

            if (total_score < 5)
            {
                advicelbl.Text = "Don't worry! You merely have chance to get affected by COVID-19.Keep yourself in isolation and contact doctor and follow advice.";
                resultLiteral.Text = "<b><font color='green'>Negative</font></b>";
                resultdata = "Negative";
            }
            if (total_score == 5)
            {
                advicelbl.Text = "Don't worry!You're possibly suspected for COVID 19 affected.Keep yourself in isolation and contact doctor and follow advice.";
                resultLiteral.Text = "<b><font color='red'>Positive</font></b>";
                resultdata = "Postive";
            }
            if (total_score > 5 && total_score < 7)
            {
                advicelbl.Text = "You've a highly chance of COVID 19 affected.Keep yourself in isolation and contact doctor immediately and follow advice.Here is some emergency contact number.";
                resultLiteral.Text = "<b><font color='red'>Positive</font></b>";
                contactnumber.Visible = true;
                resultdata = "Postive";
            }
            if (total_score >= 7)
            {
                advicelbl.Text = "Almost confirmed case of COVID 19 positive.Keep yourself in isolation and contact doctor immediately and follow advice. Highly recommendation to be hospitalized.Here is some emergency contact number.";
                resultLiteral.Text = "<b><font color='red'>Positive</font></b>";
                contactnumber.Visible = true;
                resultdata = "Postive";
            }

            string constring = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            SqlConnection connect = new SqlConnection(constring);
            if (connect.State == ConnectionState.Open)
            {
                connect.Close();
            }
            connect.Open();

            SqlCommand cmd = connect.CreateCommand();
            cmd.CommandType = CommandType.Text;

            int agedata = int.Parse(age.Text);
            string sexdata = sex.SelectedItem.Text;
            float temperaturedata = float.Parse(temperature.Text);
            string dtime = DateTime.Now.ToString();


            cmd.CommandText = "insert into [dbo].[covidrecords] values (" + agedata + ",'" + sexdata + "'," + temperaturedata + ",'" + dtime + "'," + total_score + ",'" + resultdata + "')";
            if (connect.State == ConnectionState.Open)
            {
                connect.Close();
            }
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        protected void finalprevious_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void done_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            age.Text = "";
            temperature.Text = "";
            sex.SelectedValue = "0";
            message.Visible = false;
            foreach (ListItem li in symptom_checkbox.Items)
            {
                if (li.Selected)
                {
                    li.Selected = false;
                }
            }
            foreach (ListItem li in add_symptom_checkbox.Items)
            {
                if (li.Selected)
                {
                    li.Selected = false;
                }
            }
            total_score = 0;
            advicelbl.Text = "";
            contactnumber.Visible = false;
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

    }
}