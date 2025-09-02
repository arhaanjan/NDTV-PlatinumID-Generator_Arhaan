<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="data.aspx.cs" Inherits="PlatinumID_Arhaan.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DATA</title>
     <style>
        body {
           background-color: dimgray;
        }
        
        .lbl {
            color: #FAFAFA;
            text-align: center;
        }
        .ls{
            color:green
        }
         h1 {
            background-color: #000;
            color: #FAFAFA;
            font-size: 32pt;
            font-weight: bold;
            height:60px;
            padding: 20px;
            margin-bottom: 0em;
            border: 40px;
            
            
        }
       
        .lblstatus{
            background-color: #FAFAFA;
            color: #FAFAFA;
            font-size: 16pt;
            font-weight: bold;
        }

        
        
        
        .myGridClass {
            width: 100%;
            /*this will be the color of the odd row*/
            background-color: #fff;
            margin: 10px 0 20px 0;
            border: solid 20px #525252;
            border-collapse: collapse;
            font-size: 1.3em;
            
        }

            /*data elements*/
            .myGridClass td {
                padding: 2px;
                border: solid 1px #c1c1c1;
                color: #717171;
            }

            /*header elements*/
            .myGridClass th {
                padding: 4px 2px;
                color: #fff;
                background: #424242;
                border-left: solid 1px #525252;
                font-size: 0.9em;
            }

            /*his will be the color of even row*/
            .myGridClass .myAltRowClass {
                background: #fff  repeat-x top;
               
                
                
                
            }
            
            .activeRow{
                 background: #c1c1c1 !important;
                
            }
            .activeRow td{
                color: black !important
            }

            /*and finally, we style the pager on the bottom*/
            .myGridClass .myPagerClass {
                background: #424242;
            }

                .myGridClass .myPagerClass table {
                    margin: 5px 0;
                }

                .myGridClass .myPagerClass td {
                    border-width: 0;
                    padding: 0 6px;
                    border-left: solid 1px #666;
                    font-weight: bold;
                    color: #fff;
                    line-height: 12px;
                }

                .myGridClass .myPagerClass a {
                    color: #666;
                    text-decoration: none;
                }

                    .myGridClass .myPagerClass a:hover {
                        color: #000;
                        text-decoration: none;
                    }
                    .margindd{
                        border-radius: 8px;
                        cursor:pointer;
                        
                    }
                    .edtBtn{
                        border-radius: 8px;
                        cursor:pointer;
                        height:44px;
                        width:80px;
                        
                    }
                    .label{
                        background-color:#444;
                        
                        
                    }
                    .filter{
                       
                    }
                    
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
                     <div align="center">
                         <h1>SPONSOR LIST</h1>
                       
                       <div align="left" class="label">
                            <asp:DropDownList ID="ddStateFilter" runat="server"  CssClass="margindd" Height="35px" Width="178px" >
                            <asp:ListItem Value="0" >-- Select State--</asp:ListItem>
                            <asp:ListItem >Rajasthan</asp:ListItem>
                            <asp:ListItem >Madhya Pradesh</asp:ListItem>
                        </asp:DropDownList>

                            <asp:DropDownList ID="ddTypeFilter" runat="server" Height="35px" CssClass="margindd" Width="237px">
                             <asp:ListItem Value="0" >-- Select Sponsor Type--</asp:ListItem>
                             <asp:ListItem >L-Band</asp:ListItem>
                             <asp:ListItem >Aston</asp:ListItem>
                             <asp:ListItem >1/3 RD</asp:ListItem>
                             <asp:ListItem >Bug</asp:ListItem>
                             <asp:ListItem>Others</asp:ListItem>
                         </asp:DropDownList>

                           <asp:DropDownList ID="ddStatusFilter" runat="server" Height="35px" cssClass="margindd" Width="178px">
                            <asp:ListItem Value="0" >-- Select Status--</asp:ListItem>
                            <asp:ListItem >InActive</asp:ListItem>
                            <asp:ListItem>Active</asp:ListItem>
                        </asp:DropDownList>
        
                           <asp:Button  runat="server" ID="FilterButton" Text="Filter" OnClick="FilterButton_Click" 
           CssClass="margindd" Height="42px" Width="140px" 
           BackColor="White" ForeColor="Black" Font-Bold="true" />
                          
                           
                           <asp:Button  runat="server" ID="Button1" Text="GENERATE NEW ID"
                               OnClick="GenButton_Click" CssClass="margindd" Height="42px" Width="140px" 
 BackColor="White" ForeColor="Black" Font-Bold="true" Style="float:right" />















                       </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                
                CssClass="myGridClass"
                AlternatingRowStyle-CssClass="myAltRowClass"
                PagerStyle-CssClass="myPagerClass"  DataKeyNames="Sno,Sname,State,Type,Status"
                OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating"
                emptydatatext="No ID generated yet."
                OnRowDataBound="GridView1_RowDataBound"


                >
                <emptydatarowstyle backcolor="LightBlue"
                 ForeColor="DarkRed" Font-Bold="false" Font-Size="32px"/>
                

                <Columns>
                    
                    <asp:TemplateField HeaderText="Sponsor Name">
                        <ItemTemplate>
                            <%# Eval("Sname") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="editName"
                                runat="server"
                                Text='<%# Bind("Sname") %>'
                               />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <%# Eval("State") %>
                        </ItemTemplate>
                       <%-- <EditItemTemplate>

                            <asp:DropDownList ID="ddeditState"
                                runat="server"
                                SelectedValue='<%# Bind("State") %>'>
                                <asp:ListItem Value="0">-- Select Status--</asp:ListItem>
                                <asp:ListItem>Rajasthan</asp:ListItem>
                                <asp:ListItem>Madhya Pradesh</asp:ListItem>
                            </asp:DropDownList>

                        </EditItemTemplate>--%>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Sponsor Type">
                        <ItemTemplate>
                            <%# Eval("Type") %>
                        </ItemTemplate>
                       <%-- <EditItemTemplate>

                            <asp:DropDownList ID="ddeditType"
                                runat="server"
                                SelectedValue='<%# Bind("Type") %>'>
                                <asp:ListItem Value="0" >-- Select Sponsor Type--</asp:ListItem>
                                         <asp:ListItem >L-Band</asp:ListItem>
                                         <asp:ListItem >Aston</asp:ListItem>
                                         <asp:ListItem >1/3 RD</asp:ListItem>
                                         <asp:ListItem >Bug</asp:ListItem>
                            </asp:DropDownList>
                                </EditItemTemplate>--%>
                               </asp:TemplateField>
                   
                    
                            <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%# Eval("Status") %>
                        </ItemTemplate>
                        <EditItemTemplate>

                            <asp:DropDownList ID="ddeditStatus"
                                runat="server"
                                SelectedValue='<%# Bind("Status") %>'>
                                <asp:ListItem Value="0">-- Select Status--</asp:ListItem>
                                <asp:ListItem>InActive</asp:ListItem>
                                <asp:ListItem>Active</asp:ListItem>
                            </asp:DropDownList>

                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="GenAT" HeaderText="Generated AT" ReadOnly="true" />
                    <asp:BoundField DataField="PlatID" HeaderText="Platinum ID" ReadOnly="true" />
                   

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat="server" ButtonType="Link" Text="Edit" CommandName="Edit" CssClass="edtBtn" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" cssClass="edtBtn"/>
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"  CssClass="edtBtn"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
                    
                
            </asp:GridView>
                         </div>
       
        <asp:Label ID="lblstatus" runat="server" ForeColor="Red" />
                        
    </form>
</body>
</html>
