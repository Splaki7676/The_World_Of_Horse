<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="TheWorldOfHorses__.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/login.css" rel="stylesheet" />
    <script src="js/Login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="allLoginPage">

        <!-- LEFT -->
        <div class="left">
            <div class="overlay">
                <h1>Welcome Back 🐎</h1>
                <p>Sign in and continue your journey with horses.</p>
            </div>
        </div>

        <!-- RIGHT -->
        <div class="right">
            <div class="login-wrapper">

                <h2 class="login-title">Sign In</h2>

                <div class="input-group">
                    <label for="Username">Username</label>
                    <input type="text" id="Username" name="Username" oninput="checkUsername()" />
                    <div id="UsernameDiv"></div>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" oninput="checkPassword()" />
                    <div id="PasswordDiv"></div>
                </div>

                <div id="loginError" runat="server"></div>

                <div class="step-buttons">

                    <input type="submit" value="Login" onclick="return checkLogin()" />
                </div>

                <div class="login-link">
                    <hr />
                    <p>Don't have an account? <a href="RegisterPage.aspx">Register here</a></p>
                    <p>Forgot your password? <a href="ForgotPassword.aspx">Reset here</a></p>

                </div>

            </div>
        </div>

    </div>



</asp:Content>
