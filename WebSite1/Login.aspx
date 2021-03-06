<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Licorice&family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <title>Sign In</title>
    <link rel="shortcut icon" type="image/jpg" href="/favicon.png"/>
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
                        <a href="/Default.aspx" class="nav-link">
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
                        <img src="img/locked.png" alt="">
                        <h4 style="font-family: 'Montserrat', sans-serif;" class="mt-4">Please Sign In</h4>
                    </div>
                </div>
                <div class="row justify-content-center mt-4">
                    <div class="col-3">
                        <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                        <asp:Label ID="usernameError" runat="server" Text="" CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row justify-content-center mt-2">
                    <div class="col-3">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                        <asp:Label ID="passwordError" runat="server" Text=" " CssClass="RegisterLabels"></asp:Label>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <asp:Button ID="Button1" runat="server" Text="Log-in" OnClick="Button1_Click" Style="width: 15%; font-family: 'Montserrat', sans-serif;"
                            class="btn btn-primary text-dark rounded-pill" />
                    </div>
                </div>

            </div>
        </section>
        <script src="js/bootstrap.js"></script>
    </form>
</body>
</html>
