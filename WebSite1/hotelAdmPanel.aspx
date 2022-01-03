<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelAdmPanel.aspx.cs" Inherits="hotelAdmPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hotel Admin Panel</title>
    <link rel="shortcut icon" type="image/jpg" href="/favicon.png"/>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 100%; width: 100%; overflow: hidden;">
            <div style="height: 476px; width: 453px; float: left;">
                <div>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div>
                    <asp:Button ID="btnSaveImg" runat="server" Text="Add Image" OnClick="btnSaveImg_Click" />
                </div>


                <div>
                    <asp:Label ID="lblmessage" runat="server" />
                </div>

                <div>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Button ID="btnImgView" runat="server" Height="23px" Text="View image" Width="102px" OnClick="btnImgView_Click" />
                </div>


                <div>
                    <asp:Image ID="imgPreview" runat="server" />
                </div>

                <div>
                    <asp:Button ID="btnDeleteImg" runat="server" Text="Delete this image" OnClick="btnDeleteImg_Click" />
                </div>
            </div>
            <div style="height: 420px; width: 1128px;">
                <div style="float: left; width: 276px;">
                    <asp:TextBox ID="txtLocation" runat="server" Style="text-align: left; margin-top: 3px;" Width="251px"></asp:TextBox>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Location"></asp:Label>
                        <br />
                    </div>
                    <div>
                        <asp:TextBox ID="txtRoomsCount" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Room Count"></asp:Label>
                        <br />
                        <br />
                        Star:
                        
                        <asp:Label ID="lblStar" runat="server" Text=""></asp:Label>
                        
                    </div>
                    <div>
                        <br />
                        Rating:
                         <asp:Label ID="lblRating" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <div style="width: 375px:">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtHotelName" runat="server" Height="32px" style="margin-left: 0px" Width="350px"></asp:TextBox>

                    <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Hotel Name"></asp:Label>

                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtInfo" runat="server" Height="59px" Width="368px" Style="text-align: left" TextMode="MultiLine"></asp:TextBox>

                    <br />
                        <asp:Label ID="Label2" runat="server" Text="Hotel Info" style="margin-left: 25px;"></asp:Label>

                    <br />

                    <div >
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </div>
                </div>
                <div style="float: left">
                </div>
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" style="margin-left:211px;" Width="241px" OnClick="btnSave_Click"/>
            </div>

        </div>
    </form>
</body>
</html>
