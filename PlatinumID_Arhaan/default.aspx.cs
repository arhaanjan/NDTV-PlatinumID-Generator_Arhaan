using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlatinumID_Arhaan
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["FormDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            string name = txttext.Text.Trim();
            string state = DropDownList1.Text.Trim();
            string type = DropDownList2.Text.Trim();
            string status = DropDownList3.Text.Trim();
            if (status == "0" || name == "" || state == "0" || type == "0")
            {
                Response.Write("<script>alert('Insert all Fields')</script>");
            }
            else
            {

                int stateIn = DropDownList1.SelectedIndex;
                int typeIn = DropDownList2.SelectedIndex;
                int statusIn = DropDownList3.SelectedIndex;
                string stateID = "c"; string typeID = "b";
                switch (stateIn)
                {
                    case 1:
                        stateID = "RJ";
                        break;
                        case 2:
                        stateID = "MP";
                        break;
                }
                switch (typeIn)
                {
                    case 1:
                        typeID = "LBD";
                        break;
                        case 2:
                        typeID = "AST";
                        break;
                        case 3:
                        typeID = "TRT";
                        break;
                        case 4: 
                        typeID = "BUG";
                        break;
                        
                        case 5: 
                        typeID = "OTH";
                        break;
                  
                }
                
                
                string query = "INSERT INTO data (Sname,State,Type,Status,PlatID) VALUES (@sname,@st,@type,@status,@platID)";
                SqlCommand cmd1 = new SqlCommand(query, conn);
                cmd1.Parameters.AddWithValue("@sname", name);
                cmd1.Parameters.AddWithValue("@st", state);
                cmd1.Parameters.AddWithValue("@type", type);
                cmd1.Parameters.AddWithValue("@status", status);
                cmd1.Parameters.AddWithValue("@platID", "420");

                string snoQuery = "SELECT Sno FROM data WHERE PlatID = @platID";
                SqlCommand cmd2 = new SqlCommand(snoQuery, conn);
                cmd2.Parameters.AddWithValue("@platID", "420");

                try
                {
                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    string sno = Convert.ToString(cmd2.ExecuteScalar());
                    string snoPad = sno.PadLeft(6, '0');
                    string platID = stateID + typeID + snoPad;
                    

                    try
                    {
                        
                        string updateQuery = "UPDATE data SET PlatID = @platID WHERE PlatID = @x";
                        SqlCommand cmd3 = new SqlCommand(updateQuery, conn);
                        cmd3.Parameters.AddWithValue("@platID", platID);
                        cmd3.Parameters.AddWithValue("@x", "420");
                        cmd3.ExecuteNonQuery();
                        
                    }
                    catch (Exception ex)
                    {
                        lblstatus.Text = "DB error" + ex.Message;
                        lblstatus.ForeColor = System.Drawing.Color.Red;
                    }
                    finally { txtplat.Text = platID; }




                    Response.Write("<script>alert('GENERATED')</script>");
                    
                }
                catch (Exception ex)
                {
                    lblstatus.Text = "DB error" + ex.Message;
                    lblstatus.ForeColor = System.Drawing.Color.Red;
                }
                finally { conn.Close(); }
            }


        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("data.aspx");
        }
    }
}