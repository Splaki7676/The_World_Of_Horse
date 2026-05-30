<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TypesPage.aspx.cs" Inherits="TheWorldOfHorses__.TypesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Types.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- ================================================== -->
    <!-- ================================================== -->
    <!-- HERO SECTION – סוס מועדף בראש הדף -->
    <div class="hero-container">

        <div class="hero-arrow left">‹</div>
        <div class="hero-arrow right">›</div>

        <!-- צד שמאל – רקע עם מלל -->
        <div class="hero-text">
            <h1 id="hero-name"></h1>
            <ul id="hero-stats" class="hero-stats">
            </ul>
        </div>

        <!-- צד ימין – תמונה -->
        <div class="hero-image">
            <img id="hero-img" src="" alt="Hero Horse" />
        </div>
    </div>


    <!-- ================================================== -->

    <!-- SEARCH SECTION – חיפוש סוסים -->
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Search horses..." />
    </div>

    <!-- ================================================== -->
    <div class="horse-cards-container">


        <!-- קו עם טקסט למועדפים -->
        <div class="section-divider">
            <span>Favorites</span>
        </div>

        <!-- קלפי המועדפים -->
        <div class="favorite-cards">
            <!-- כאן יוכנסו קלפי המועדפים -->
        </div>

        <!-- קו עם טקסט לשאר הסוסים -->
        <div class="section-divider">
            <span>Other Horses</span>
        </div>

        <!-- קלפי השאר -->
        <div class="other-cards">

                <!-- הקלפים נוצרים אוטומטית מ-JS -->

            <!-- כאן נכניס את שאר other-cards" -->

        </div>
        <!-- end other-cards   -->
    </div>
    <!-- end  horse-cards-container  -->

    <script src="js/Types.js"></script>

</asp:Content>
