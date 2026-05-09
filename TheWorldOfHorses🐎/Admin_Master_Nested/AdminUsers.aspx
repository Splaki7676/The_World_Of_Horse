<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_Nested/Admin.master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="TheWorldOfHorses__.Admin_Master_Nested_.AdminUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

     <h2>👥 Users</h2>

    <table class="admin-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Favorite Breed</th>
                <th>Best Score</th>
                <th>Attempts</th>
                <th>Actions</th>
                <th>Admin</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptUsers" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Id") %></td>
                        <td><%# Eval("Username") %></td>
                        <td><%# Eval("mail") %></td>
                        <td><%# Eval("gender") %></td>
                        <td><%# Eval("favoriteBreed") %></td>
                        <td><%# Eval("BestScore") ?? "No games" %></td>
                        <td><%# Eval("Attempts") ?? "-" %></td>
                        <td><%# (bool)(Eval("IsAdmin") ?? false) ? "✅ Admin" : "" %></td>
                        <td>
                            <a runat="server" href='<%# "~/Admin_Master_Nested/AdminEditUser.aspx?id=" + Eval("Id") %>'>✏️ Edit</a>
                            <asp:Button runat="server" Text="🚫 Hide" CssClass="btn-hide"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnHide_Click" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>

    <style>
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .admin-table thead {
            background-color: #1a1a1a;
            color: white;
        }

        .admin-table th, .admin-table td {
            padding: 12px 15px;
            text-align: left;
            font-size: 14px;
        }

        .admin-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .admin-table tbody tr:hover {
            background-color: #fff0eb;
        }

        .admin-table a {
            color: coral;
            text-decoration: none;
            margin-right: 8px;
            font-weight: bold;
        }

        .btn-hide {
            background: none;
            border: 1px solid #ccc;
            padding: 4px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
        }

        .btn-hide:hover {
            background-color: #ffe0e0;
            border-color: red;
        }
    </style>

</asp:Content>
