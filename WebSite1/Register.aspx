<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:TextBox ID="txtMail" runat="server" Style="margin-left: 92px" Width="360px"></asp:TextBox>
        </p>
        <asp:TextBox ID="txtPassword" runat="server" Style="margin-left: 92px" Width="360px" TextMode="Password" ></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" Style="margin-left: 237px" Text="Register" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
