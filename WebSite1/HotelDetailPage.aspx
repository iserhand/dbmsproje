<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HotelDetailPage.aspx.cs" Inherits="HotelDetailPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hotel Details</title>
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

    <form id="form1" runat="server" class=" p-5 mt-3">
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
                                <asp:Label ID="LoginLinkLabel" runat="server" Text=""> <img src="img/login.png" alt="" > Login </asp:Label>
                            </a>
                        </li>
                        <li class="nav-item">
                            <div id="registerDiv" runat="server">
                                <a href="/Register.aspx" class="nav-link">
                                    <asp:Label ID="RegisterLinkLabel" runat="server" Text=""> <img src="img/signup.png" alt=""> Sign Up </asp:Label>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <asp:Label ID="lblEmptyLabel" runat="server"> <img src="img/logout.png" alt=""> </asp:Label>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <asp:Button ID="LogOutButton" runat="server" Style="outline: none; border: none; background: none; color: gray" OnClick="LogOutButton_Click" Text="Log Out" />
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <asp:Label ID="usernameLabel" runat="server"> </asp:Label>
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
        <section>
            <div class="container text-center" style="width: 50%;">
                <div class="row">
                    <asp:Label runat="server">
                        <div class="col" style="width: auto">
                            <asp:Image ID="hotelImg" runat="server" ImageUrl="~//images//luxhotel.png" />
                        </div>
                    </asp:Label>
                    <div class="col justify-content-center mt-4" style="width: auto">
                        <asp:Label ID="Label1" runat="server" Text="Hotel Name:"></asp:Label>
                        <asp:Label ID="lblHotelName" runat="server" Font-Bold="true"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="txtHotelInfo" runat="server" placeholder="Hotel Info" TextMode="MultiLine" Height="100%" Width="396px"></asp:TextBox>
                    </div>
                </div>
                <div class="row" style="width: auto">
                    <asp:Label runat="server">
                    </asp:Label>
                    <div class="col mt-4" style="width: auto">
                        <asp:Label ID="Label2" runat="server" Text="Hotel Rating:"></asp:Label>
                        <asp:Label ID="lblHotelRating" runat="server"></asp:Label>
                    </div>
                    <div class="col mt-4" style="width: auto">
                        <asp:Label ID="Label3" runat="server" Text="Hotel Star:"></asp:Label>
                        <asp:Label ID="lblHotelStar" runat="server"></asp:Label>
                    </div>
                </div>
                <div>
                    <asp:Button ID="btnMakeReservation" runat="server" Text="Button" Width="25%" />
                </div>
            </div>
        </section>

        <div class="mt-2" style="width: 250px">
            <asp:TextBox ID="txtComment" runat="server" placeholder="Comment" Height="121px" Width="291px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="mt-2">
            <asp:TextBox ID="txtRating" runat="server" placeholder="Rating(1-5)"></asp:TextBox>
            <asp:Button ID="btnAddComment" runat="server" Text="Add Review" OnClick="btnAddComment_Click" />
        </div>

        <section>
            <table class="table table-dark table-striped mt-5">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Comment</th>
                        <th scope="col">Rating</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>
                            <asp:Label ID="Label11" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label12" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label13" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>
                            <asp:Label ID="Label21" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label22" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label23" runat="server"></asp:Label></td>


                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>
                            <asp:Label ID="Label31" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label32" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label33" runat="server"></asp:Label></td>

                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>
                            <asp:Label ID="Label41" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label42" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label43" runat="server"></asp:Label></td>


                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>
                            <asp:Label ID="Label51" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label52" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label53" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
        </section>
        <div class="row justify-content-center">
            <div class="col-1">
                <asp:Button ID="btnPrev" runat="server" Text="Prev" Style="outline: none; border: none; background: none; color: white;" OnClick="btnPrev_Click" />
                <asp:Button ID="btnNext" runat="server" Text="Next" Style="border-style: none; border-color: inherit; border-width: medium; outline: none; background: none; color: white;" OnClick="btnNext_Click" />
            </div>

        </div>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>
