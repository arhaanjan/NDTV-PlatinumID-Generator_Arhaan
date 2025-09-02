using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace PlatinumID_Arhaan
{
    public partial class WebForm4 : System.Web.UI.Page
        
    {
        string connStr = ConfigurationManager.ConnectionStrings["FormDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void stL_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            string username = stxtUsername.Text.Trim();
            string password = stxtPassword.Text.Trim();
            string empId = txtEmpId.Text.Trim();
            SqlCommand cmd = new SqlCommand("select * from accounts where username=@username", conn);
            cmd.Parameters.AddWithValue("username", username);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();

            if (username == "" || password == "" || empId== "")
            {
                Response.Write("<script>alert('Insert all Fields')</script>");
            }
            else if(dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Username already exists')</script>)");
               
            }
            else
            {
                conn.Open();
                
                string query = "INSERT INTO Accounts (Username,Password,EmpId,Role) VALUES (@uname,@pwd,@emp,@role)";
                SqlCommand cmd1 = new SqlCommand(query, conn);
                cmd1.Parameters.AddWithValue("@uname", username);
                cmd1.Parameters.AddWithValue("@pwd", password);
                cmd1.Parameters.AddWithValue("@emp", empId);
                cmd1.Parameters.AddWithValue("@role", "user");
                cmd1.ExecuteNonQuery();
                Response.Write("<script>alert('Signed Up')</script>");
                
                
                conn.Close();
            }


        }
    }
}
