<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Register</title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body style="background:aqua">
    <form id="registerform" runat="server">

        <div style="height: auto; width:657px; margin-left: 343px; margin-top: 165px; background-color: #FF6666">
            &nbsp;<asp:Label ID="Label3" runat="server" Text="User name" CssClass="RegisterLabels"></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server" Style="margin-left: 45px; margin-top: 8px;" Width="163px"></asp:TextBox>
            <asp:Label ID="usernameError" runat="server"  Text="" CssClass="RegisterLabels" ></asp:Label>
            <p></p>
            <asp:Label ID="Label1" runat="server" Text="e-Mail" CssClass="RegisterLabels"></asp:Label>
            <asp:TextBox ID="txtMail" runat="server" Style="margin-left: 73px; margin-top: 0px; margin-bottom: 0px;" Width="163px"></asp:TextBox>

            <asp:Label ID="mailError" runat="server"  Text=" " CssClass="RegisterLabels" ></asp:Label>
            <p></p>
            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="RegisterLabels"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" Style="margin-left: 53px; margin-top: 0px;" Width="164px" TextMode="Password"></asp:TextBox>
            <asp:Label ID="passwordError" runat="server"  Text=" " CssClass="RegisterLabels" ></asp:Label>
            <p></p>
            <asp:Button ID="Button1" runat="server" Style="margin-left: 120px; margin-bottom: 33px;" Text="Register" OnClick="Button1_Click" CssClass="RegisterBtn" Width="247px" />
        </div>

    </form>
</body>
</html>
