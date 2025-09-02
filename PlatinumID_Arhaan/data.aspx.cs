using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace PlatinumID_Arhaan
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["FormDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                
                    LoadData();
                
            }
        }

        private void LoadData()
        {
            SqlConnection conn = new SqlConnection(connStr);
            {
                SqlDataAdapter adapter = new SqlDataAdapter(
                "SELECT * FROM data", conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            GridView1.DataBind();
            LoadData();
            
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            int sno = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            int rowIndex = Convert.ToInt32(e.RowIndex);
            GridViewRow row = GridView1.Rows[rowIndex];
            TextBox txtbox = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("editName"));
            string name = txtbox.Text.Trim();

            //DropDownList editDdState = GridView1.Rows[e.RowIndex].FindControl("ddeditState") as DropDownList;
            //string state = editDdState.SelectedValue.ToString();
            //DropDownList editDdType = GridView1.Rows[e.RowIndex].FindControl("ddeditType") as DropDownList;
            //string type = editDdType.SelectedValue.ToString();
            DropDownList editDdStatus = GridView1.Rows[e.RowIndex].FindControl("ddeditStatus") as DropDownList;
            string status = editDdStatus.SelectedValue.ToString();
            if (status == "0" || name == "")
            {
                GridView1.EditIndex = -1;
                GridView1.DataBind();
                LoadData();
                Response.Write("<script>alert('Insert all Fields')</script>");
            }
            else
            {
                string updateQuery = "UPDATE data SET Sname=@sname ,Status=@status WHERE Sno = @sno";
                SqlCommand cmd1 = new SqlCommand(updateQuery, conn);
                cmd1.Parameters.AddWithValue("@sname", name);
                //cmd1.Parameters.AddWithValue("@state", state);
                //cmd1.Parameters.AddWithValue("@type", type);
                cmd1.Parameters.AddWithValue("@status", status);
                cmd1.Parameters.AddWithValue("@sno", sno);

                try
                {
                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('UPDATED')</script>");
                }
                catch (Exception ex)
                {
                    lblstatus.Text = "DB error" + ex.Message;
                    lblstatus.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {
                    conn.Close();
                    GridView1.EditIndex = -1;
                    LoadData();
                    
                }
            }
        }

        protected void GenButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = DataBinder.Eval(e.Row.DataItem, "Status")?.ToString();
                if(status == "Active")
                {
                    e.Row.CssClass = "activeRow";
                }

                if (Session["Role"] != null)
                {
                    string role = Session["Role"].ToString();

                    if (role == "user")
                    {
                        foreach (Control c in e.Row.Cells[6].Controls)
                        {
                            if (c is Button)
                            {
                                Button b = (Button)c;
                                if (b.Text == "Edit")
                                {
                                    b.Visible = false;
                                }
                            }
                        }
                    }
                }











                }
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            string stateFilter = ddStateFilter.Text;
            string typeFilter= ddTypeFilter.Text;
            string statusFilter= ddStatusFilter.Text;
            string stateQuery = "a";
            string typeQuery="b";
            string statusQuery = "c";
            if(stateFilter == "0")
            {
                stateQuery = "State=State";
            }
            else
            {
                stateQuery = "State= @State";
            }
            if(typeFilter == "0")
            {
                typeQuery = "Type=Type";
            }
            else
            {
                typeQuery = "Type= @Type";
            }
            if(statusFilter == "0")
            {
                statusQuery = "Status=Status";
            }
            else
            {
                statusQuery = "Status= @Status";
            }
            string query = "SELECT * FROM data WHERE " + stateQuery + " AND " + typeQuery + " AND " + statusQuery;
            



            SqlConnection conn = new SqlConnection(connStr);
            {
                SqlCommand cmd3 = new SqlCommand(query, conn);
                cmd3.Parameters.AddWithValue("@Status", statusFilter);
                cmd3.Parameters.AddWithValue("@State", stateFilter);
                cmd3.Parameters.AddWithValue("@Type", typeFilter);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd3);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
        }
    }
}