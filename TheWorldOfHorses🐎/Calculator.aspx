<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="TheWorldOfHorses__.Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/Calculator.js"></script>
    <link href="CSS/Calculator.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="calc-hero">
        <h1>🐴 Horse Age Calculator</h1>
        <p>Find out how old your horse is in human years</p>
    </div>

    <div class="horse-calc-page">


        <div class="tabs">
            <button type="button" class="tab active" onclick="switchTab('horse')">Horse → Human</button>
            <button type="button" class="tab" onclick="switchTab('human')">Human → Horse</button>
        </div>

        <div class="main-row">

            <!-- שמאל: טופס -->
            <div class="calculator-box">
                <div class="calc-row">
                    <label id="labelYears">Horse years:</label>
                    <input type="number" id="inputYears" min="0" max="120" placeholder="0" />
                </div>
                <div class="calc-row">
                    <label>Months:</label>
                    <input type="number" id="inputMonths" min="0" max="11" placeholder="0" />
                </div>
                <div class="calc-row" id="breedRow">
                    <label>Breed:</label>
                    <select id="horseBreed">
                        <option value="standard">Standard / Arabian</option>
                        <option value="pony">Pony</option>
                        <option value="draft">Draft horse</option>
                        <option value="thoroughbred">Thoroughbred</option>
                    </select>
                </div>
                <button type="button" class="calc-btn" onclick="calculate()">Calculate</button>
            </div>

            <!-- ימין: תוצאה -->
            <div class="result-box" id="resultBox">
                <p class="result-label" id="resultLabel">Result</p>
                <p class="result-number" id="resultNumber">–</p>
                <p class="result-unit" id="resultUnit"></p>
            </div>

        </div>
    </div>

</asp:Content>
