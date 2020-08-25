using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security ;

namespace COVID_19_Self_Assessment_System
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Username"] != null && Request.Cookies["Usertype"] != null && Request.Cookies["Password"] != null)
                {
                    userbox.Text = Request.Cookies["Username"].Value;
                    passwordbox.Text = Request.Cookies["Password"].Value;
                }
            }
        }
        protected void loginbutton_Click(object sender, EventArgs e)
        {
            string username = userbox.Text;
            //string mail = email.Text;
            string pass = passwordbox.Text;

            //using session and cookie

            Session["Username"] = username;

            if (rememberme.Checked)
            {
                Response.Cookies["Username"].Value = userbox.Text;
                Response.Cookies["Password"].Value = passwordbox.Text;

                Response.Cookies["Username"].Expires = DateTime.Now.AddMilliseconds(60000);
                Response.Cookies["Password"].Expires = DateTime.Now.AddMilliseconds(60000);
            }
            else
            {
                Response.Cookies["Username"].Expires = DateTime.Now.AddMilliseconds(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddMilliseconds(-1);
            }

            if (pass == "admin" && username == "admin")
            {
                Response.Redirect("admin_page.aspx");
            }
            else
            {
                string script = "<script>alert('Login Failed!'); </Script>";
                Response.Write(script);
                //Label1.Visible = true;
            }
        }
    }
}