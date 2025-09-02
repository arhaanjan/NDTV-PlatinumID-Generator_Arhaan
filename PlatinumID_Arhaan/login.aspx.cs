using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace PlatinumID_Arhaan
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["FormDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            if (username == "" || password == "")
            {
                Response.Write("<script>alert('Insert all Fields')</script>");
            }
            else
            {
                
                SqlCommand cmd = new SqlCommand("select * from accounts where username=@username and password=@password", conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                conn.Close();

                if (dt.Rows.Count > 0)
                {
                    Session["UserName"] = txtUsername.Text;
                    Session["Pwd"] = txtPassword.Text;
                    conn.Open();
                    SqlCommand cmd3 = new SqlCommand("select Role from accounts where username=@username and password=@password", conn);
                    cmd3.Parameters.AddWithValue("@username", username);
                    cmd3.Parameters.AddWithValue("@password", password);
                    string role = Convert.ToString(cmd3.ExecuteScalar());
                    Session["Role"]= role;
                    conn.Close() ;

                    Response.Redirect("default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Username and Password is incorrect')</script>");


                }

            }
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        
    }
}