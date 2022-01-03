<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admPanel.aspx.cs" Inherits="admPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin Panel</title>
    <link rel="shortcut icon" type="image/jpg" href="/favicon.png"/>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 277px">

            <asp:Button ID="btnManageHotels" runat="server" Text="Manage Hotels" OnClick="btnManageHotels_Click" />
            <asp:Button ID="btnManageAdmins" runat="server" Text="Manage Admins" OnClick="btnManageAdmins_Click" />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True">
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
                            <asp:Button runat="server" ID="btnSave" Text="Add New Hotel" CssClass="Gridbutton" CommandName="Footer" OnClick="btnSave_Click2"  />
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>


            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView2_RowCancelingEdit"
                OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" ShowFooter="True">
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
                            <asp:Button runat="server" ID="btnSave2" Text="Add New Admin/User" CssClass="Gridbutton" CommandName="Footer" OnClick="btnSave_Click"  />
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
