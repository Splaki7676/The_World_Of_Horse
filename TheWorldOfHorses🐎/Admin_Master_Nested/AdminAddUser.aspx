<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_Nested/Admin.master" AutoEventWireup="true" CodeBehind="AdminAddUser.aspx.cs" Inherits="TheWorldOfHorses__.Admin_Master_Nested.AdminAddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">


    <h2>➕ Add New User</h2>

    <asp:Label ID="lblMessage" runat="server" Visible="false"
        Style="display:block; margin-bottom:16px; padding:10px 16px; border-radius:8px; font-size:14px;" />

    <div class="form-card">

        <div class="form-row">
            <div class="form-group">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" placeholder="4–9 characters" />
                <asp:Label ID="lblErrUsername" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtMail" runat="server" CssClass="form-input" placeholder="Enter email" />
                <asp:Label ID="lblErrMail" runat="server" Visible="false" CssClass="field-error" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Min 6 chars, 1 number, 3 letters" />
                <asp:Label ID="lblErrPassword" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-input" TextMode="Password" />
                <asp:Label ID="lblErrPassword2" runat="server" Visible="false" CssClass="field-error" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-input">
                    <asp:ListItem Value="" Text="-- Select --" />
                    <asp:ListItem Value="Male" Text="Male" />
                    <asp:ListItem Value="Female" Text="Female" />
                    <asp:ListItem Value="Other" Text="Other" />
                </asp:DropDownList>
                <asp:Label ID="lblErrGender" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <div class="form-group">
                <label>Date of Birth</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-input" TextMode="Date" />
                <asp:Label ID="lblErrDate" runat="server" Visible="false" CssClass="field-error" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Favorite Breed</label>
                <asp:TextBox ID="txtFavoriteBreed" runat="server" CssClass="form-input" placeholder="e.g. Arabian" />
                <asp:Label ID="lblErrFavoriteBreed" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <div class="form-group">
                <label>New Horse Lover?</label>
                <asp:DropDownList ID="ddlNewLover" runat="server" CssClass="form-input">
                    <asp:ListItem Value="" Text="-- Select --" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Old Horse Lover?</label>
                <asp:DropDownList ID="ddlOldLover" runat="server" CssClass="form-input">
                    <asp:ListItem Value="" Text="-- Select --" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                </asp:DropDownList>
                <asp:Label ID="lblErrLovers" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <div class="form-group" style="display:flex; align-items:center; gap:10px; padding-top:28px;">
                <asp:CheckBox ID="chkIsAdmin" runat="server" />
                <label style="margin:0; font-weight:500;">Is Admin</label>
            </div>
        </div>

        <div class="form-actions">
            <asp:Button ID="btnAdd" runat="server" Text="➕ Add User" CssClass="btn-primary" OnClick="btnAdd_Click" CausesValidation="false" />
            <asp:Button ID="btnClear" runat="server" Text="🔄 Clear" CssClass="btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
        </div>

    </div>

    <style>
        .form-card { background:white; border-radius:12px; padding:30px; box-shadow:0 2px 8px rgba(0,0,0,0.1); max-width:860px; }
        .form-row { display:flex; gap:24px; margin-bottom:20px; }
        .form-group { flex:1; display:flex; flex-direction:column; gap:6px; }
        .form-group label { font-size:13px; font-weight:600; color:#555; }
        .form-input { padding:9px 12px; border:1px solid #ddd; border-radius:7px; font-size:14px; width:100%; box-sizing:border-box; transition:border-color 0.2s; }
        .form-input:focus { outline:none; border-color:coral; }
        select.form-input { background:white; }
        .field-error { color:#e53e3e; font-size:12px; }
        .form-actions { display:flex; gap:12px; margin-top:10px; }
        .btn-primary { background-color:coral; color:white; border:none; padding:10px 24px; border-radius:8px; font-size:14px; cursor:pointer; font-weight:600; }
        .btn-primary:hover { background-color:#e8623a; }
        .btn-secondary { background-color:#f0f0f0; color:#333; border:1px solid #ddd; padding:10px 24px; border-radius:8px; font-size:14px; cursor:pointer; }
        .btn-secondary:hover { background-color:#e0e0e0; }
    </style>


</asp:Content>
