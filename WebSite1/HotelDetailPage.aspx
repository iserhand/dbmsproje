<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HotelDetailPage.aspx.cs" Inherits="HotelDetailPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 634px; width: 1468px">
            <asp:Image ID="hotelImg" runat="server" Height="109px" Width="133px" />
            <asp:TextBox ID="hotelDetails" runat="server" Height="99px" style="margin-right: 0px" Width="322px" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Make Reservation" />
            <asp:TextBox ID="commentBox" runat="server" Height="100px" TextMode="MultiLine" Width="340px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
