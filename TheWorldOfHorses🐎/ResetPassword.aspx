<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="TheWorldOfHorses__.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/login.css" rel="stylesheet" />
    <script src="js/ResetPassword.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="allLoginPage">

        <!-- LEFT -->
        <div class="left">
            <div class="overlay">
                <h1>Reset Password 🐎</h1>
                <p>Enter your new password below.</p>
            </div>
        </div>

        <!-- RIGHT -->
        <div class="right">
            <div class="login-wrapper">

                <h2 class="login-title">New Password</h2>

                <div id="msgDiv" runat="server"></div>

                <div id="formFields" runat="server">

                    <div class="input-group">
                        <label for="newPass">New Password</label>
                        <input type="password" id="newPass" name="newPass" oninput="checkPass()" />
                        <div id="passDiv"></div>
                    </div>

                    <div class="input-group">
                        <label for="confirmPass">Confirm Password</label>
                        <input type="password" id="confirmPass" name="confirmPass" oninput="checkConfirm()" />
                        <div id="confirmDiv"></div>
                    </div>

                    <div class="step-buttons">
                        <input type="submit" value="Reset Password" onclick="return checkAll()" />
                    </div>

                </div>

                <div class="login-link">
                    <hr />
                    <p>Remembered your password? <a href="LoginPage.aspx">Login here</a></p>
                </div>

            </div>
        </div>

    </div>

    <script>
        setTimeout(function () {
            const msg = document.getElementById("<%=msgDiv.ClientID%>");
            if (msg && msg.innerText.trim() === "success") {
                let count = 7;

                msg.innerHTML = `
                <div style="text-align:center; padding: 20px;">
                    <div style="
                        width: 80px; height: 80px; border-radius: 50%;
                        background: #3b6d11; color: white;
                        display: flex; align-items: center; justify-content: center;
                        font-size: 40px; margin: 0 auto 15px;">
                        ✓
                    </div>
                    <div style="font-size: 22px; font-weight: bold; color: #3b6d11; margin-bottom: 10px;">
                        Password Reset Successfully!
                    </div>
                    <div id="countdownText" style="font-size: 15px; color: #333; font-weight: bold;">
                          Redirecting in ${count}...
                     </div>
                </div>
                            `;

                let interval = setInterval(function () {
                    count--;
                    if (count === 0) {
                        clearInterval(interval);
                        window.location.href = "LoginPage.aspx";
                    } else {
                        document.getElementById("countdownText").innerText = "Redirecting in " + count + "...";
                    }
                }, 1000);
            }
        }, 100);
    </script>

</asp:Content>
