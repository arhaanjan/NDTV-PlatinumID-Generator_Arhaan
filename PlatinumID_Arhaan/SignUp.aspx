<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="PlatinumID_Arhaan.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style>
        body{
            margin:0;
            height:100vh;
            background: linear-gradient(to right,black,dimgray);
            display:flex;
            justify-items:center;
            justify-content:center;
            

        }
        .insideCard{
            width:300px;
            height:400px;
            background-color:snow;
            border-radius: 12px;
            text-align:center;
            margin-top:140px;
            

        }
        .img{
            width:60px;
            height:60px;
            object-fit:contain;
            margin-bottom:10px;

           

        }
        .text{
          margin-right:200px;

        }
        .txtbox{
          
            border-radius: 12px;
            border-block-end-color:black;
            width:250px;
            margin-top:7px;

        }

        .loginBtn{
            border-radius: 8px;
            margin-top:27px;
            height:27px;
       

        }
        .textsu{
            
            margin-right:170px;
            /*font-size:13px;*/

        }
















    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="insideCard">
                <img src="https://i.pinimg.com/736x/8b/12/52/8b125232501ef2f169a7085149b14a3b.jpg" class="img"/>
                <br />
                <br />
               
                <asp:Label runat="server"  CssClass="text"><i class="fas fa-user"> Username:</i></asp:Label>
                <asp:TextBox runat="server" ID="stxtUsername" CssClass="txtbox" ></asp:TextBox>
                <asp:Label runat="server"  CssClass="text"><i class="fas fa-key"> Password:</i></asp:Label>
                <asp:TextBox runat="server" ID="stxtPassword" CssClass="txtbox" Type="Password"></asp:TextBox>
                <asp:Label runat="server"  CssClass="textsu" ><i class="fas fa-id-card"> Employee ID:</i></asp:Label>
                <asp:TextBox runat="server" ID="txtEmpId" CssClass="txtbox"></asp:TextBox>
                
               

                <asp:LinkButton runat="server" 
                ID="Button2" Text= "Sign Up"   OnClick="Button2_Click"  CssClass="loginBtn"
                 Width="70px" 
                BackColor="black" ForeColor="white" > </asp:LinkButton>
               <br />
                <br />
                 
                <asp:Label runat="server"  CssClass="">Already have an account?</asp:Label>
                <asp:LinkButton runat="server" 
                ID="stL" Text= "Login"   OnClick="stL_Click" 
                 
               ForeColor="blue" > </asp:LinkButton> 



                 
                

            </div>
            
        </div>
    </form>
</body>
</html>
