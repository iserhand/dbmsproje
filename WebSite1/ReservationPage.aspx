<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReservationPage.aspx.cs" Inherits="ReservationPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Reservation</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server" class="text-center p-5 mt-5">
        <section>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <img src="img/luxhotel.png" alt="">
                        <h4 style="font-family: 'Montserrat', sans-serif;" class="mt-4">Reservation Information</h4>
                    </div>
                </div>
                <div class="row justify-content-center mt-3">
                    <div class="col-3">
                        <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                        <asp:Label ID="nameError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtSurname" runat="server" class="form-control" placeholder="Surname"></asp:TextBox>
                        <asp:Label ID="surnameError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>

                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="E-Mail"></asp:TextBox>
                        <asp:Label ID="mailError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtArrDate" runat="server" class="form-control" placeholder="Check-in date"></asp:TextBox>
                        <asp:Label ID="arrivalError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtDepDate" runat="server" class="form-control" placeholder="Check-out date"></asp:TextBox>
                        <asp:Label ID="depatureError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtRoom" runat="server" class="form-control" placeholder="Room Number"></asp:TextBox>
                        <asp:Label ID="roomError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtNum" runat="server" class="form-control" placeholder="Number of quest"></asp:TextBox>
                        <asp:Label ID="questError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <asp:Button ID="Button1" runat="server" Text="Request Booking" OnClick="Button1_Click" Style="width: 15%; font-family: 'Montserrat', sans-serif;"
                            class="btn btn-primary text-dark rounded-pill" />
                    </div>
                </div>

            </div>
        </section>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>
