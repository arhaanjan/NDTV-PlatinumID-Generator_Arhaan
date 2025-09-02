<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PlatinumID_Arhaan.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PLATINUM ID GENERATOR</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
   
    <style>

        .margindd{
            margin-left: 113px;
            color :white;
            font-size: 20px;
             border-radius: 8px;
             cursor:pointer;


        }
        body{
            background-color: #121212;
        }
        h1{
            background-color:#1F1B24;
                color: white;
                font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
                height: 66px;
               font-weight: 700;
               text-emphasis-style: dot;
               text-align:center;
               padding-left: 200px;
              
                
                
               
            
            text-align:center;
        }
        .lbl {
            color: oldlace;
            
            font-weight: 600;
            background-color: #332940;
            padding-top: 10px;
            text-align:center;

            
        }
        .homeBtn{
          
          text-emphasis-style:none;
          margin-left:100px;
          
          
        }
        
    </style>
</head>
   
<body align="center">
    <form id="form1" runat="server">
        
        <div>
            <h1> PLATINUM ID GENERATOR <asp:LinkButton runat="server" 
                ID="Button1" Text= "DATA" OnClick="Button1_Click" CssClass="homeBtn" Style="float:right" 
                Height="36px" Width="50px" 
                BackColor="aqua" ForeColor="Black" Font-Bold="true"><i class="fa fa-folder"></i> </asp:LinkButton>
                 </h1> 
              <asp:Label cssClass="lbl" runat="server" Text="Sponsor Name:" Font-Bold="true"/>
             <asp:TextBox ID="txttext" runat="server" 
                 BackColor="#3b3b3b" BorderStyle="Ridge" BorderColor="White" Height="25px" Width="306px" ForeColor="White"
                 Font-Size="25px"
                 
                 />
            <br />
            <br />
          
             <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#3b3b3b" CssClass="margindd" Height="35px" Width="178px" >
                <asp:ListItem Value="0" >-- Select State--</asp:ListItem>
                <asp:ListItem >Rajasthan</asp:ListItem>
                <asp:ListItem >Madhya Pradesh</asp:ListItem>
            </asp:DropDownList>
           
            <br />
           
            <asp:DropDownList ID="DropDownList2" runat="server" BackColor="	#3b3b3b" Height="35px" CssClass="margindd" Width="237px">
                <asp:ListItem Value="0" >-- Select Sponsor Type--</asp:ListItem>
                <asp:ListItem >L-Band</asp:ListItem>
                <asp:ListItem >Aston</asp:ListItem>
                <asp:ListItem >1/3 RD</asp:ListItem>
                <asp:ListItem >Bug</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:DropDownList ID="DropDownList3" runat="server" BackColor="	#3b3b3b" Height="35px" cssClass="margindd" Width="178px">
                <asp:ListItem Value="0" >-- Select Status--</asp:ListItem>
                <asp:ListItem >InActive</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
            </asp:DropDownList>
             <br />
            <br />
            

           <asp:Button  runat="server" ID="btn_submit" Text="GENERATE" OnClick="Btnsubmit_Click" CssClass="margindd" Height="45px" Width="121px" 
               BackColor="#BB86FC" ForeColor="#121212" Font-Bold="true" Font-Size="16px" Font-Names="sans-serif"/>
           <br />
            <br />
            <br />
            
              <asp:Label cssClass="lbl" runat="server" Text="Platinum ID:" Font-Bold="True" Height="29px" />
               <asp:TextBox ID="txtplat" runat="server"
               BackColor="#3b3b3b" BorderStyle="Ridge" BorderColor="White" Width="405px" ForeColor="White"
               Font-Size="25px" ReadOnly="true" Height="30px"></asp:TextBox>
                 


            <br />
            <br />
            
           
            <br />
            <br />
            <asp:Label ID="lblstatus" runat="server" ForeColor="Red" />
            <br />
            
             


        </div>
    </form>
</body>
</html>
