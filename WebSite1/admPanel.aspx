<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admPanel.aspx.cs" Inherits="admPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 277px">

            <asp:Button ID="btnManageHotels" runat="server" Text="Manage Hotels" OnClick="btnManageHotels_Click" />
            <asp:Button ID="btnManageAdmins" runat="server" Text="Manage Admins" OnClick="btnManageAdmins_Click" />
            <asp:Button ID="btnAddAdmin" runat="server" Text="Add Admin" />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
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
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Hotel_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lbl_City" runat="server" Text='<%#Eval("Hotel_Location") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_City" runat="server" Text='<%#Eval("Hotel_Location") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rooms">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Rooms" runat="server" Text='<%#Eval("Hotel_RoomsCount") %>'></asp:Label>
                        </ItemTemplate>
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
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Star" runat="server" Text='<%#Eval("Hotel_Star") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>


        </div>

    </form>
</body>
</html>
