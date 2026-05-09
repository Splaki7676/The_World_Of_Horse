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

           <%-- <!-- קלף סוס -->
            <div class="horse-card">
                <div class="card-inner">

                    <!-- צד קדמי -->
                    <div class="card-front">
                        <img src="Pics/ArabianHorsePic.png" alt="Arabian Horse" class="horse-img" />
                        <div class="horse-name">Arabian Horse</div>
                        <div class="favorite-btn" data-horse="Arabian Horse">❤</div>
                    </div>

                    <!-- צד אחורי -->
                    <div class="card-back"  data-bg-color="saddlebrown" style="background-color: saddlebrown;">
                        <ul class="horse-stats">
                            <li><span class="stat-label">Maximum Speed:</span> 65 km/h</li>
                            <li><span class="stat-label">Height:</span> 150–160 cm</li>
                            <li><span class="stat-label">Color:</span> Bay, Gray</li>
                            <li><span class="stat-label">Temperament:</span> Intelligent, Energetic</li>
                            <li><span class="stat-label">Description:</span>            Arabian horses are elegant and resilient. Known for their endurance and loyalty, 
they are often used in long-distance riding and shows. Their graceful appearance 
makes them one of the most admired horse breeds in the world.
                            </li>
                            <li><span class="stat-label">*Fun Fact:</span> Loves long rides in the desert 🌵</li>

                        </ul>

                    </div>
                    <!-- end card-back -->
                </div>
                <!-- end card-inner -->
            </div>
            <!-- end horse-card  -->


            <div class="horse-card">
                <div class="card-inner">

                    <!-- צד קדמי -->
                    <div class="card-front">
                        <img src="Pics/BodyPic.png" alt="Arabian Horse" class="horse-img" />
                        <div class="horse-name">EX</div>
                        <div class="favorite-btn" data-horse="EX">❤</div>
                    </div>

                    <!-- צד אחורי -->
                    <div class="card-back"  data-bg-color="blue" style="background-color:blue;">
                        <ul class="horse-stats">
                            <li><span class="horse-group-fast">Group:</span>fast horse</li>
                            <li><span class="stat-label">Maximum Speed:</span> AAAAAAAAAAAAA km/h</li>
                            <li><span class="stat-label">Height:</span> 150AAAAAAAAAAAAA160 cm</li>
                            <li><span class="stat-label">Color:</span> Bay, Gray</li>
                            <li><span class="stat-label">Temperament:</span> 150AAAAAAAAAAAAA160, Energetic</li>
                            <li><span class="stat-label">Description:</span>            2222222222222222222222222222222
                            </li>
                            <li><span class="stat-label">*Fun Fact:</span> =================AAAAA 🌵</li>

                        </ul>

                    </div>
                    <!-- end card-back -->
                </div>
                <!-- end card-inner -->
            </div>--%>
        </div>
        <!-- end other-cards   -->
    </div>
    <!-- end  horse-cards-container  -->

    <script src="js/Types.js"></script>

</asp:Content>
