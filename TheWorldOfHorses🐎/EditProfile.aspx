<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="TheWorldOfHorses__.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/EditProfile.js"></script>
    <link href="CSS/MyAccount.css" rel="stylesheet" />
    <%-- 🆕 הוספת Cropper.js --%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="account-card">

        <!-- Header -->

        <div class="account-header">
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
            <p>Edit your profile</p>
        </div>
    <!-- end account-header -->



    <!-- Verify Password -->
    <div class="edit-header">
        <p>Verify identity</p>
        <p>Enter your current password to unlock fields</p>
    </div>

    <div class="detail-row">
        <span class="label">Current Password</span>
        <div class="verify-row">
            <asp:TextBox ID="textBox_currentPass" runat="server" TextMode="Password" placeholder="Enter current password"></asp:TextBox>
            <asp:Button ID="btnVerify" runat="server" Text="Verify" OnClick="btnVerify_Click" CssClass="verify-btn" />
        </div>
        <div id="currentPassDiv" runat="server"></div>
    </div>

    <!-- Locked Fields -->
    <div id="editFields" runat="server" style="display: none;">





        <%-- 🆕 הוספת שורת העלאת תמונה --%>
        <div class="detail-row">
            <span class="label">Profile Picture</span>
            <div class="pic-upload-row">
                <div class="avatar-preview" id="avatarPreview" style="<% if (Session["ProfilePic"] != null) { %>background-image: url('ShowPic.ashx'); background-size: cover; background-position: center; <% } %>">
                    <% if (Session["ProfilePic"] == null)
                        { %>
                    <%= Session["Username"] != null ? Session["Username"].ToString()[0].ToString().ToUpper() : "?" %>
                    <% } %>
                </div>
                <%-- avatar-preview --%>
                <label class="upload-btn">
                    Choose Photo
            <input type="file" id="fileInput" accept="image/*" style="display: none;" onchange="openCropper(this)" />
                </label>
            </div>
            <!-- pic-upload-row -->
        </div>
        <!-- end detail-row -->


        <%-- 🆕 חלון ה-Crop --%>
        <div id="cropModal" style="display: none;">
            <div class="crop-overlay">
                <div class="crop-box">
                    <img id="cropImage" />
                    <div class="crop-actions">
                        <button type="button" onclick="applyCrop()" class="verify-btn">✔ Apply</button>
                        <button type="button" onclick="cancelCrop()" class="btn-secondary">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <%-- 🆕 שדה נסתר שמחזיק את התמונה החתוכה --%>
        <asp:HiddenField ID="croppedImageData" runat="server" />









        <div class="detail-row">
            <span class="label">Username</span>
            <asp:TextBox ID="textBox_Username" runat="server" oninput="checkUsername()" placeholder="Leave empty to keep current"></asp:TextBox>
            <div id="UsernameDiv" runat="server"></div>
        </div>

        <div class="detail-row">
            <span class="label">Email</span>
            <asp:TextBox ID="textBox_Email" runat="server" oninput="checkMail()" placeholder="Leave empty to keep current"></asp:TextBox>
            <div id="emailDiv" runat="server"></div>
        </div>

        <div class="detail-row">
            <span class="label">New Password</span>
            <asp:TextBox ID="textBox_NewPass" runat="server" TextMode="Password" placeholder="Leave empty to keep current" oninput="checkNewPass()"></asp:TextBox>
            <div id="newPassDiv" runat="server"></div>
        </div>

        <!-- Actions -->
        <div class="account-actions">
            <asp:Button ID="btnSave" runat="server" Text="Save Changes"
                OnClientClick="return checkSave();"
                OnClick="btnSave_Click" CssClass="btn-primary" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                OnClick="btnCancel_Click" CssClass="btn-secondary"
                CausesValidation="false" />
        </div>


    </div>

    </div>

    <script>
        const UsernameDiv = document.getElementById("<%=UsernameDiv.ClientID%>");
        const emailDiv = document.getElementById("<%=emailDiv.ClientID%>");
        const currentPassDiv = document.getElementById("<%=currentPassDiv.ClientID%>");
        const newPassDiv = document.getElementById("<%=newPassDiv.ClientID%>");
        const croppedImageData = document.getElementById("<%=croppedImageData.ClientID%>");

        const textBox_Username = document.getElementById("<%=textBox_Username.ClientID%>");
        const textBox_Email = document.getElementById("<%=textBox_Email.ClientID%>");
        const textBox_NewPass = document.getElementById("<%=textBox_NewPass.ClientID%>");



    </script>

</asp:Content>
