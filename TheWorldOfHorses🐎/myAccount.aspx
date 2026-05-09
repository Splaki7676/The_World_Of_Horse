<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="myAccount.aspx.cs" Inherits="TheWorldOfHorses__.myAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/MyAccount.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="account-card">

        <!-- Header -->
        <div class="account-header">
            <!-- 🆕 אם יש תמונה הצג אותה, אחרת הצג את האות -->
            <% if (Session["ProfilePic"] != null)
                { %>
            <img src="ShowPic.ashx" class="account-avatar" style="object-fit: cover;" />
            <% }
                else
                { %>
            <div class="account-avatar">
                <%= Session["Username"] != null ? Session["Username"].ToString()[0].ToString().ToUpper() : "?" %>
            </div>
            <% } %>
            <h2><%= Session["Username"] %></h2>

            <p>Member</p>
            <div id="successMsg" runat="server"></div>

        </div>

        <!-- Details -->
        <div class="detail-row">
            <span class="label">Username</span>
            <span class="value"><%= Session["Username"] %></span>
        </div>

        <div class="detail-row">
            <span class="label">Email</span>
            <span class="value"><%= Session["mail"] %></span>
        </div>

        <div class="detail-row">
            <span class="label">Password</span>
            <span class="value">••••••••</span>
        </div>

        <!-- Actions -->
        <div class="account-actions">
            <a href="EditProfile.aspx" class="btn-primary" style="flex: 1; text-decoration: none; text-align: center; display: flex; align-items: center; justify-content: center;">✏ Edit Profile</a>
            <asp:Button ID="logOF" runat="server" Text="Log Off" OnClick="logOF_Click" CssClass="btn-secondary" />
            <asp:Button ID="delBT" runat="server" Text="Delete" OnClick="delBT_Click" CssClass="btn-danger" />
        </div>

    </div>

    <script>
        const successMsg = document.getElementById("<%=successMsg.ClientID%>");

    </script>

</asp:Content>
