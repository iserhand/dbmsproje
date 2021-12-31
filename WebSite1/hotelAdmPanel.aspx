<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelAdmPanel.aspx.cs" Inherits="hotelAdmPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 406px">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            
            <br />
            <asp:Button ID="btnSaveImg" runat="server" Text="Add Image" OnClick="btnSaveImg_Click" />
            
            <br />
            <asp:Label ID="lblmessage" runat="server" />
        </div>
    </form>
</body>
</html>
