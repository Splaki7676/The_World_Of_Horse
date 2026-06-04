    <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="TheWorldOfHorses__.ForgotPassword" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="CSS/login.css" rel="stylesheet" />
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="allLoginPage">

            <!-- LEFT -->
            <div class="left">
                <div class="overlay">
                    <h1>Forgot Password? 🐎</h1>
                    <p>Enter your email and we'll send you a reset link.</p>
                </div>
            </div>

            <!-- RIGHT -->
            <div class="right">
                <div class="login-wrapper">

                    <h2 class="login-title">
                        Forgot Password?
                        <small style="color:gray;font-size:18px;">Reset here</small>
                    </h2>

                    <div class="input-group">
                        <label for="emailInput">Email</label>
                        <input type="text" id="emailInput" name="emailInput" oninput="checkEmail()" />
                        <div id="emailDiv"></div>
                    </div>

                    <div id="msgDiv" runat="server"></div>

                    <div class="step-buttons">
                        <input type="submit" value="Send Reset Link" onclick="return checkEmail()" />
                    </div>

                    <div class="login-link">
                        <hr />
                        <p>Remembered your password? <a href="LoginPage.aspx">Login here</a></p>
                    </div>

                </div>
            </div>

        </div>


        <script>
            function checkEmail() {
                const email = document.getElementById("emailInput").value.trim();
                const emailDiv = document.getElementById("emailDiv");

                emailDiv.innerHTML = "";

                if (email.length === 0) {
                    emailDiv.style.color = "red";
                    emailDiv.innerHTML = "Field is required.";
                    return false;
                }

                if (!isValidEmail(email)) {
                    emailDiv.style.color = "red";
                    emailDiv.innerHTML = "This email address is invalid";
                    return;
                }
                
                return true;
            }


            function isValidEmail(mail) {
                const atIndex = mail.indexOf("@");
                const lastAtIndex = mail.lastIndexOf("@");
                const dotIndex = mail.lastIndexOf(".");
                const domainLength = mail.length - dotIndex - 1;

                if (mail.length === 0) return false;
                if (atIndex < 1 || atIndex !== lastAtIndex) return false;
                if (dotIndex === -1 || dotIndex <= atIndex + 1) return false;
                if (dotIndex === mail.length - 1) return false;
                if (domainLength < 2) return false;

                return true;
            }

          
        </script>

    </asp:Content>
