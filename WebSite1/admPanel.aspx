<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admPanel.aspx.cs" Inherits="admPanel" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin Panel</title>
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
                    <li class="nav-item">
                        <a href="#" class="nav-link"></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div style="height: 277px">

            <asp:Button ID="btnManageHotels" runat="server" Text="Manage Hotels" OnClick="btnManageHotels_Click" />
            <asp:Button ID="btnManageAdmins" runat="server" Text="Manage Admins" OnClick="btnManageAdmins_Click" />

            <asp:GridView CssClass="table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Hotel_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Namein" runat="server" Text='<%#Eval("Hotel_Name") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Hotel_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lbl_City" runat="server" Text='<%#Eval("Hotel_Location") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Cityin" runat="server" Text='<%#Eval("Hotel_Location") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_City" runat="server" Text='<%#Eval("Hotel_Location") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rooms">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Rooms" runat="server" Text='<%#Eval("Hotel_RoomsCount") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Roomsin" runat="server" Text='<%#Eval("Hotel_RoomsCount") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Rooms" runat="server" Text='<%#Eval("Hotel_RoomsCount") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rating">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Rating" runat="server" Text='<%#Eval("Hotel_Rating") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Rating" runat="server" Text='<%#Eval("Hotel_Rating") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Star">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Star" runat="server" Text='<%#Eval("Hotel_Star") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Starin" runat="server" Text='<%#Eval("Hotel_Star") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Star" runat="server" Text='<%#Eval("Hotel_Star") %>'></asp:TextBox>
                        </EditItemTemplate>


                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate></ItemTemplate>
                        <FooterTemplate>
                            <asp:Button runat="server" ID="btnSave" Text="Add New Hotel" CssClass="Gridbutton" CommandName="Footer" OnClick="btnSave_Click2" />
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>


            <asp:GridView  ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView2_RowCancelingEdit"
                OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" ShowFooter="True" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Namein" runat="server" Text='<%#Eval("username") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("username") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lbl_password" runat="server" Text='<%#Eval("password") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_passwordin" runat="server" Text='<%#Eval("password") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_password" runat="server" Text='<%#Eval("password") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="E-Mail">
                        <ItemTemplate>
                            <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_emailin" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_email" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Registered">
                        <ItemTemplate>
                            <asp:Label ID="lbl_date" runat="server" Text='<%#Eval("date_registered") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_date" runat="server" Text='<%#Eval("date_registered") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User type(Hotel ID for hotel admin.)">
                        <ItemTemplate>
                            <asp:Label ID="lbl_usertype" runat="server" Text='<%#Eval("usertype") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_usertypein" runat="server" Text='<%#Eval("usertype") %>'></asp:TextBox>
                        </FooterTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_usertype" runat="server" Text='<%#Eval("usertype") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate></ItemTemplate>
                        <FooterTemplate>
                            <asp:Button runat="server" ID="btnSave2" Text="Add New Admin/User" CssClass="Gridbutton" CommandName="Footer" OnClick="btnSave_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Password</th>
                        <th>E-mail</th>
                        <th>Date Registered</th>
                        <th>User type</th>
                        <th></th>
                    </tr>

                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="txtID" CssClass="text"></asp:TextBox></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtName" CssClass="text"></asp:TextBox></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="text"></asp:TextBox></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="text"></asp:TextBox></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtDate" CssClass="text"></asp:TextBox></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtUsertype" CssClass="text"></asp:TextBox></td>
                        <td></td>
                    </tr>

                </EmptyDataTemplate>

            </asp:GridView>


        </div>

    </form>
</body>
</html>
