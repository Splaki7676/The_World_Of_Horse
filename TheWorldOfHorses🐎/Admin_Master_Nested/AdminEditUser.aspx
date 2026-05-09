<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_Nested/Admin.master" AutoEventWireup="true" CodeBehind="AdminEditUser.aspx.cs" Inherits="TheWorldOfHorses__.Admin_Master_Nested.AdminEditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">



    <h2>✏️ Edit User</h2>

    <asp:Label ID="lblMessage" runat="server" Visible="false"
        Style="display:block; margin-bottom:16px; padding:10px 16px; border-radius:8px; font-size:14px;" />

    <div class="form-card">

        <%-- Username --%>
        <div class="field-row">
            <span class="field-label">Username</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_username"></span>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" />
                <asp:Label ID="lblErrUsername" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <button type="button" class="edit-btn" id="btn_username"
                onclick="toggleEdit('<%=txtUsername.ClientID%>', 'disp_username', 'btn_username')">✏️</button>
        </div>

        <%-- Email --%>
        <div class="field-row">
            <span class="field-label">Email</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_mail"></span>
                <asp:TextBox ID="txtMail" runat="server" CssClass="form-input" />
                <asp:Label ID="lblErrMail" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <button type="button" class="edit-btn" id="btn_mail"
                onclick="toggleEdit('<%=txtMail.ClientID%>', 'disp_mail', 'btn_mail')">✏️</button>
        </div>

        <%-- Gender --%>
        <div class="field-row">
            <span class="field-label">Gender</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_gender"></span>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-input">
                    <asp:ListItem Value="" Text="-- Select --" />
                    <asp:ListItem Value="Male" Text="Male" />
                    <asp:ListItem Value="Female" Text="Female" />
                    <asp:ListItem Value="Other" Text="Other" />
                </asp:DropDownList>
                <asp:Label ID="lblErrGender" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <button type="button" class="edit-btn" id="btn_gender"
                onclick="toggleEdit('<%=ddlGender.ClientID%>', 'disp_gender', 'btn_gender')">✏️</button>
        </div>

        <%-- Date of Birth --%>
        <div class="field-row">
            <span class="field-label">Date of Birth</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_date"></span>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-input" TextMode="Date" />
                <asp:Label ID="lblErrDate" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <button type="button" class="edit-btn" id="btn_date"
                onclick="toggleEdit('<%=txtDate.ClientID%>', 'disp_date', 'btn_date')">✏️</button>
        </div>

        <%-- Favorite Breed --%>
        <div class="field-row">
            <span class="field-label">Favorite Breed</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_breed"></span>
                <asp:TextBox ID="txtFavoriteBreed" runat="server" CssClass="form-input" />
                <asp:Label ID="lblErrFavoriteBreed" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <button type="button" class="edit-btn" id="btn_breed"
                onclick="toggleEdit('<%=txtFavoriteBreed.ClientID%>', 'disp_breed', 'btn_breed')">✏️</button>
        </div>

        <%-- New Horse Lover --%>
        <div class="field-row">
            <span class="field-label">New Horse Lover?</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_newlover"></span>
                <asp:DropDownList ID="ddlNewLover" runat="server" CssClass="form-input">
                    <asp:ListItem Value="" Text="-- Select --" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                </asp:DropDownList>
            </div>
            <button type="button" class="edit-btn" id="btn_newlover"
                onclick="toggleEdit('<%=ddlNewLover.ClientID%>', 'disp_newlover', 'btn_newlover')">✏️</button>
        </div>

        <%-- Old Horse Lover --%>
        <div class="field-row">
            <span class="field-label">Old Horse Lover?</span>
            <div class="field-value-wrap">
                <span class="field-display" id="disp_oldlover"></span>
                <asp:DropDownList ID="ddlOldLover" runat="server" CssClass="form-input">
                    <asp:ListItem Value="" Text="-- Select --" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                </asp:DropDownList>
                <asp:Label ID="lblErrLovers" runat="server" Visible="false" CssClass="field-error" />
            </div>
            <button type="button" class="edit-btn" id="btn_oldlover"
                onclick="toggleEdit('<%=ddlOldLover.ClientID%>', 'disp_oldlover', 'btn_oldlover')">✏️</button>
        </div>

        <%-- Permissions — תמיד פתוחים --%>
        <div class="field-row">
            <span class="field-label">Permissions</span>
            <div class="field-value-wrap" style="display:flex; gap:20px; align-items:center; padding:8px 0;">
                <label style="display:flex; align-items:center; gap:6px;">
                    <asp:CheckBox ID="chkIsAdmin" runat="server" /> Is Admin
                </label>
                <label style="display:flex; align-items:center; gap:6px;">
                    <asp:CheckBox ID="chkIsHidden" runat="server" /> Is Hidden
                </label>
            </div>
            <span style="width:36px;"></span>
        </div>

        <div class="form-actions">
            <asp:Button ID="btnSave" runat="server" Text="💾 Save Changes"
                CssClass="btn-primary" OnClick="btnSave_Click" CausesValidation="false" />
            <asp:Button ID="btnCancel" runat="server" Text="↩ Cancel"
                CssClass="btn-secondary" OnClick="btnCancel_Click" CausesValidation="false" />
        </div>

    </div>

    <script>
        var fields = [
            { inputId: '<%=txtUsername.ClientID%>', dispId: 'disp_username', btnId: 'btn_username' },
            { inputId: '<%=txtMail.ClientID%>', dispId: 'disp_mail', btnId: 'btn_mail' },
            { inputId: '<%=ddlGender.ClientID%>', dispId: 'disp_gender', btnId: 'btn_gender' },
            { inputId: '<%=txtDate.ClientID%>', dispId: 'disp_date', btnId: 'btn_date' },
            { inputId: '<%=txtFavoriteBreed.ClientID%>', dispId: 'disp_breed', btnId: 'btn_breed' },
            { inputId: '<%=ddlNewLover.ClientID%>', dispId: 'disp_newlover', btnId: 'btn_newlover' },
            { inputId: '<%=ddlOldLover.ClientID%>', dispId: 'disp_oldlover', btnId: 'btn_oldlover' }
        ];

        window.onload = function () {
            fields.forEach(function (f) {
                var el = document.getElementById(f.inputId);
                var disp = document.getElementById(f.dispId);
                if (!el || !disp) return;

                // הצג ערך כטקסט
                disp.textContent = getDisplayValue(el);
                disp.style.display = '';
                el.style.display = 'none';
            });
        };

        function getDisplayValue(el) {
            if (el.tagName === 'SELECT') {
                return el.options[el.selectedIndex] ? el.options[el.selectedIndex].text : '—';
            }
            return el.value || '—';
        }

        function toggleEdit(inputId, dispId, btnId) {
            var el = document.getElementById(inputId);
            var disp = document.getElementById(dispId);
            var btn = document.getElementById(btnId);
            if (!el || !disp || !btn) return;

            var isHidden = el.style.display === 'none';

            if (isHidden) {
                // פתח לעריכה
                disp.style.display = 'none';
                el.style.display = '';
                el.focus();
                btn.textContent = '✅';
            } else {
                // סגור ועדכן תצוגה
                disp.textContent = getDisplayValue(el);
                disp.style.display = '';
                el.style.display = 'none';
                btn.textContent = '✏️';
            }
        }
    </script>

    <style>
        .form-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 700px;
        }

        .field-row {
            display: flex;
            align-items: flex-start;
            gap: 16px;
            padding: 14px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .field-label {
            width: 150px;
            min-width: 150px;
            font-size: 13px;
            font-weight: 600;
            color: #555;
            padding-top: 8px;
        }

        .field-value-wrap {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .field-display {
            font-size: 14px;
            color: #222;
            padding: 8px 4px;
            min-height: 36px;
        }

        .form-input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 7px;
            font-size: 14px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-input:focus {
            outline: none;
            border-color: coral;
        }

        select.form-input {
            background: white;
        }

        .field-error {
            color: #e53e3e;
            font-size: 12px;
        }

        .edit-btn {
            background: none;
            border: 1px solid #e0e0e0;
            cursor: pointer;
            font-size: 14px;
            padding: 5px 8px;
            border-radius: 6px;
            transition: background 0.2s;
            margin-top: 4px;
            min-width: 36px;
        }

        .edit-btn:hover {
            background: #f5f5f5;
        }

        .form-actions {
            display: flex;
            gap: 12px;
            margin-top: 24px;
        }

        .btn-primary {
            background-color: coral;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-primary:hover { background-color: #e8623a; }

        .btn-secondary {
            background-color: #f0f0f0;
            color: #333;
            border: 1px solid #ddd;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn-secondary:hover { background-color: #e0e0e0; }
    </style>


</asp:Content>
