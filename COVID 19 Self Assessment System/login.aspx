<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="COVID_19_Self_Assessment_System.login" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>Login...</title>
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <style type="text/css">
        #form1 {
            width: 277px;
            height: 35px;
        }
    </style>
</head>
<body class="body1">
    <form id="form1" runat="server">
        <div class="login-box">
            <h1>Login here to access</h1>

            <div class="textbox">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <asp:TextBox ID="userbox" placeholder="Username or Email" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            </div>

            <div class="textbox">
                <i class="fa fa-key" aria-hidden="true"></i>
                <asp:TextBox ID="passwordbox" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="loginbutton" class="btn" OnClick="loginbutton_Click" runat="server" Text="Login" />

            <div>
                <asp:CheckBox ID="rememberme" runat="server" />Remember me?
            </div>

            <div>
                <a href="#" style="float: right;">
                    <font size="1"><i>*Forgot password?Click here</i></font>
                </a>
            </div>
            <br />

            <p>
                Not yet registered?Then
                <font><i><b><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#">Sign Up</asp:HyperLink></b></i></font>
                here.
            </p>
        </div>
        <div class="message-box">
            <asp:Label ID="Label1" runat="server" Text="<h2>Incorrect Username Or Password</h2>" ForeColor="Yellow" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
