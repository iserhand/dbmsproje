<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelAdmPanel.aspx.cs" Inherits="hotelAdmPanel" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hotel Admin Panel</title>
    <link rel="shortcut icon" type="image/jpg" href="/favicon.png" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Licorice&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/jpg" href="/favicon.png" />
</head>
<body class="bg-dark text-light">
    <nav class="navbar navbar-dark bg-dark navbar-expand-md">
        <div class="container">
            <a id="navbarBrand" href="#" class="navbar-brand row">
                <div class="col">
                    <img src="img/booking.png" alt="">
                </div>
                <div class="col my-auto">
                    Booking
                </div>
            </a>

            <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="navbarMenu" class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="/" class="nav-link">
                            <img src="img/home.png" alt="">
                            Home                               
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="/Login.aspx" class="nav-link">
                            <asp:Label ID="LoginLinkLabel" runat="server" Text="">
                                    <img src="img/login.png" alt="" >
                                    Login
                            </asp:Label>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div id="registerDiv" runat="server">
                            <a href="/Register.aspx" class="nav-link">
                                <asp:Label ID="RegisterLinkLabel" runat="server" Text="">
                                    <img src="img/signup.png" alt="">
                                    Sign Up
                                </asp:Label>
                            </a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <asp:Label ID="lblEmptyLabel" runat="server">
                                    <img src="img/logout.png" alt="">
                            </asp:Label>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <asp:Button ID="LogOutButton" runat="server" Style="outline: none; border: none; background: none; color: gray" OnClick="LogOutButton_Click" Text="Log Out" />
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <asp:Label ID="usernameLabel" runat="server">                                    
                            </asp:Label>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link"></a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link"></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div style="height: 100%; width: 100%; overflow: hidden;">
            <div style="height: 476px; width: 453px; float: left;">
                <div class="mt-2">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div class="mt-2">
                    <asp:Button ID="btnSaveImg" runat="server" Text="Add Image" OnClick="btnSaveImg_Click" />
                </div>


                <div class="mt-2">
                    <asp:Label ID="lblmessage" runat="server" />
                </div>

                <div class="mt-2">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="mt-2">
                    <asp:Button ID="btnImgView" runat="server" Text="View image" OnClick="btnImgView_Click" />
                </div>


                <div class="mt-2">
                    <asp:Image ID="imgPreview" runat="server" />
                </div>

                <div class="mt-2">
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
                        <asp:TextBox ID="txtHotelName" runat="server" Height="32px" Style="margin-left: 0px" Width="350px"></asp:TextBox>

                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Hotel Name"></asp:Label>

                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtInfo" runat="server" Height="59px" Width="368px" Style="text-align: left" TextMode="MultiLine"></asp:TextBox>

                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Hotel Info" Style="margin-left: 25px;"></asp:Label>

                    <br />

                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </div>
                </div>
                <div style="float: left">
                </div>
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" Style="margin-left: 211px;" Width="241px" OnClick="btnSave_Click" />
            </div>

        </div>
    </form>
</body>
</html>
