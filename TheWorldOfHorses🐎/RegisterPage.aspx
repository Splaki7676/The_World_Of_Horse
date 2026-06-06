<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="TheWorldOfHorses__.RegisterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/Register.js"></script>
    <link href="CSS/Register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="register-page-layout">

        <!-- LEFT SIDE -->
        <div class="register-left">
            <div class="overlay">
                <h1>Join the World of Horse</h1>
                <p>Learn, discover, and deepen your connection with horses.</p>
            </div>
        </div>

        <!-- RIGHT SIDE -->
        <div class="register-right">

            <div class="register-wrapper">

                <!-- progress bar -->
                <div class="progress-wrapper">
                    <div class="progressbar-line" id="progress-line"></div>
                    <div class="progressbar">
                        <div class="step active" id="circle1">1</div>
                        <div class="step" id="circle2">2</div>
                        <div class="step" id="circle3">3</div>
                    </div>
                </div>

                <div class="register-container">
                    <!-- STEP 1 -->
                    <div id="step1" class="form-step">
                        <h2 class="step-title">Basic Info</h2>
                        <div class="input-group">
                            <label for="Username">Username</label>
                            <input type="text" id="Username" name="Username" oninput="checkUsername()" />
                            <div id="UsernameDiv" runat="server"></div>
                        </div>
                        <div class="input-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" oninput="checkPassword()" />
                            <div id="PasswordDiv"></div>
                        </div>
                        <div class="input-group">
                            <label for="password2">Confirm Password</label>
                            <input type="password" id="password2" name="password2" oninput="checkPassword2()" />
                            <div id="password2Div"></div>
                        </div>

                        <div class="step-buttons">
                            <button type="button" class="prev" style="visibility: hidden;"></button>

                            <asp:Button ID="btnNext1" runat="server"
                                CssClass="next"
                                Text="Next"
                                OnClientClick="return isStep1Valid();"
                                OnClick="btnNextStep1_Click" />

                        </div>
                    </div>

                    <!-- STEP 2 -->
                    <div id="step2" class="form-step">
                        <h2 class="step-title">Contact Info</h2>
                        <div class="input-group">
                            <label for="mail">Email</label>
                            <input type="email" id="mail" name="mail" oninput="checkMail()" />
                            <div id="mailDiv" runat="server"></div>
                        </div>
                        <div class="input-group">
                            <label>Gender</label>
                            <div class="radio-group">
                                <label>
                                    <input type="radio" id="male" name="gender" value="male" onclick="checkGender()" />
                                    Male
                                </label>
                                <label>
                                    <input type="radio" id="female" name="gender" value="female" onclick="checkGender()" />
                                    Female
                                </label>
                                <label>
                                    <input type="radio" id="other" name="gender" value="other" onclick="checkGender()" />
                                    Other
                                </label>
                            </div>
                            <div id="genderDiv"></div>
                        </div>
                        <div class="input-group">
                            <label for="date">Date of Birth</label>
                            <input type="date" id="date" name="date" oninput="checkBirthday()" />
                            <div id="birthdayDiv"></div>
                        </div>

                        <div class="step-buttons">
                            <button type="button" class="prev" onclick="prevStep(2)">Previous</button>

                            <!--      <button type="button" class="next" onclick="nextStep(2)">Next</button>
                          -->
                            <asp:Button ID="btnNext2" runat="server"
                                CssClass="next"
                                Text="Next"
                                OnClientClick="return isStep2Valid();"
                                OnClick="btnNextStep2_Click" />

                        </div>
                    </div>

                    <!-- STEP 3 -->
                    <div id="step3" class="form-step">
                        <h2 class="step-title">Preferences</h2>
                        <div class="checkbox-group">
                            <div class="checkbox-item">
                                <input type="checkbox" id="terms" name="terms" onchange="checkCheckBox()" />
                                <label for="terms">I agree to the terms of use</label>
                            </div>
                            <div class="checkbox-item">
                                <input type="checkbox" id="newLover" name="newLover" onchange="checkCheckBox()" />
                                <label for="newLover">I am a new lover</label>
                            </div>
                            <div class="checkbox-item">
                                <input type="checkbox" id="oldLover" name="oldLover" onchange="checkCheckBox()" />
                                <label for="oldLover">I am an old lover</label>
                            </div>
                            <div id="checkBoxDiv"></div>
                            <br />
                        </div>
                        <div class="input-group">
                            <label for="favoriteBreed">Select a favorite breed:</label>
                            <select id="favoriteBreed" name="favoriteBreed" onchange="checkSelect()">
                                <option value="" selected hidden>Select</option>
                                <option value="arabian">Arabian</option>
                                <option value="thoroughbred">Thoroughbred</option>
                                <option value="quarter_horse">Quarter Horse</option>
                                <option value="pony">Pony</option>
                                <option value="appaloosa">Appaloosa</option>
                                <option value="friesian">Friesian</option>
                                <option value="mustang">Mustang</option>
                                <option value="other">Other</option>
                            </select>
                            <div id="selectDiv"></div>
                        </div>
                        <div class="step-buttons">
                            <button type="button" class="prev" onclick="prevStep(3)">Previous</button>

                            <asp:Button ID="btnRegister" runat="server"
                                CssClass="next"
                                Text="Register"
                                OnClientClick="return checkRegister();"
                                OnClick="btnRegister_Click" />



                        </div>
                    </div>
                </div>




                <!-- LOGIN LINK בתוך ה-wrapper -->
                <div class="login-link">
                    <hr>
                    <p>Already have an account? <a href="LoginPage.aspx">Login here</a></p>
                </div>

            </div>
            <!-- end register-wrapper -->

        </div>
        <!-- end register-right -->

    </div>
    <!-- end register-page-layout -->

    <script>

        const UsernameDiv = document.getElementById("<%=UsernameDiv.ClientID%>");
        const mailDiv = document.getElementById("<%=mailDiv.ClientID%>");

    </script>

</asp:Content>
