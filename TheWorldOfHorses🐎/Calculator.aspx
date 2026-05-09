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

    <%-- <div class="calc-page">

        <div class="calc-hero">
            <h1>🐴 Horse Age Calculator</h1>
            <p>Find out how old your horse is in human years</p>
        </div>

        <div class="calc-container">

            <!-- LEFT: INPUT -->
            <div class="calc-card">
                <h2>How old is your horse?</h2>
                <p class="calc-subtitle">Enter the age and get the human years equivalent</p>

                <div class="field-row">
                    <div class="field">
                        <label class="field-label">Horse age (horse years)</label>
                        <input class="calc-input" type="number" id="horseYears" min="0" max="50" placeholder="e.g. 8" />
                    </div>
                    <div class="field">
                        <label class="field-label">Extra months (optional)</label>
                        <input class="calc-input" type="number" id="horseMonths" min="0" max="11" placeholder="0 – 11" />
                    </div>
                </div>
                
                <div style="margin-bottom: 16px;">
                    <label class="field-label">Horse breed</label>
                    <select class="calc-select" id="breedType">
                        <option value="standard">Standard / Arabian</option>
                        <option value="pony">Pony (lives longer)</option>
                        <option value="draft">Draft horse (heavy breed)</option>
                        <option value="thoroughbred">Thoroughbred (racing)</option>
                    </select>
                </div>

                <button type="button" class="calc-btn" onclick="calculate()">🐎 Calculate Age!</button>
            </div>

            <!-- RIGHT: RESULT -->
            <div class="result-card" id="resultCard">
                <div class="result-top">
                    <span class="big-num" id="humanAge">–</span>
                    <div class="unit">Human Years</div>
                </div>
                <div class="result-rows">
                    <div class="result-row">
                        <span class="lbl">Horse age</span>
                        <span class="val" id="rHorseAge">–</span>
                    </div>
                    <div class="result-row">
                        <span class="lbl">Equivalent human age</span>
                        <span class="val" id="rHumanDetail">–</span>
                    </div>
                    <div class="result-row">
                        <span class="lbl">Life stage</span>
                        <span class="val" id="rStage">–</span>
                    </div>
                    <div class="result-row">
                        <span class="lbl">Breed</span>
                        <span class="val" id="rBreed">–</span>
                    </div>
                    <div class="result-row">
                        <span class="lbl">Average lifespan</span>
                        <span class="val" id="rLifespan">–</span>
                    </div>
                    <div class="result-row">
                        <span class="lbl">Life lived so far</span>
                        <span class="val" id="rPercent">–</span>
                    </div>
                </div>
            </div>

            <!-- BOTTOM: STAGES + FORMULA -->
            <div class="bottom-section">
                <div class="section-title">Horse Life Stages</div>
                <div class="stage-cards">
                    <div class="stage-card" style="border-color: #ff7f50;">
                        <span class="s-icon">🐣</span>
                        <span class="s-name">Foal</span>
                        <span class="s-horse">0–1 horse years</span>
                        <span class="s-human">≈ 0–6 human years</span>
                    </div>
                    <div class="stage-card" style="border-color: #f0a830;">
                        <span class="s-icon">🌱</span>
                        <span class="s-name">Young</span>
                        <span class="s-horse">1–4 horse years</span>
                        <span class="s-human">≈ 6–24 human years</span>
                    </div>
                    <div class="stage-card" style="border-color: saddlebrown;">
                        <span class="s-icon">💪</span>
                        <span class="s-name">Adult</span>
                        <span class="s-horse">4–15 horse years</span>
                        <span class="s-human">≈ 24–48 human years</span>
                    </div>
                    <div class="stage-card" style="border-color: #8B6914;">
                        <span class="s-icon">🏅</span>
                        <span class="s-name">Senior</span>
                        <span class="s-horse">15–20 horse years</span>
                        <span class="s-human">≈ 48–60 human years</span>
                    </div>
                    <div class="stage-card" style="border-color: #6b6b6b;">
                        <span class="s-icon">🌿</span>
                        <span class="s-name">Geriatric</span>
                        <span class="s-horse">20+ horse years</span>
                        <span class="s-human">≈ 60+ human years</span>
                    </div>
                </div>

                <div class="formula-box">
                    <h4>📐 How does the calculation work?</h4>
                    <p>Year 1 ≈ <strong>6 human years</strong> (very rapid growth)</p>
                    <p>Year 2 ≈ <strong>4 additional human years</strong></p>
                    <p>Years 3–4 ≈ <strong>3 human years</strong> per horse year</p>
                    <p>From age 5 onwards ≈ <strong>2.5 human years</strong> per horse year</p>
                    <p class="note">* Result varies by breed — ponies generally live longer, Thoroughbreds tend to age faster.</p>
                </div>
            </div>

        </div>
    </div>--%>
</asp:Content>
