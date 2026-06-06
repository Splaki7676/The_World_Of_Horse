<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TheWorldOfHorses__.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- section = (div) תגית שמסמנת למתכנתים (ולמערכת) ששם נמצא נמצא תוכן ,ולא רק עטיפת עיצוב  -->

    <!-- דיב לתמונה עם הטקסט שפותחת את דף הבית -->
    <div class="hero">
        <div class="hero-content">
            <h1>Horses  – A Deep Connection</h1>
            <p>Discover the beauty, power, and bond between humans and horses</p>
        </div>
    </div>


    <%//Section = a grouped area of related content %>
    <section class="home-section">
        <h2>About This Website</h2>
        <p>
            This website is dedicated to providing information about horses.
        Here you can learn about different horse breeds, horse riding,
        daily care, and the special connection between humans and horses.
        </p>
    </section>

    <!-- -->
    <section class="home-section">
        <p>
            Horses have accompanied humans for thousands of years.
        They symbolize freedom, strength, trust, and a deep bond with nature.
        </p>
    </section>




</asp:Content>
