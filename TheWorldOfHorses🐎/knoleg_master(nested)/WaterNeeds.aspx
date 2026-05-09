<%@ Page Title="" Language="C#" MasterPageFile="~/knoleg_master(nested)/knowlegHorse.master" AutoEventWireup="true" CodeBehind="WaterNeeds.aspx.cs" Inherits="TheWorldOfHorses__.knoleg_master_nested_.WaterNeeds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NutritionContent" runat="server">

     <h1>💧 Water Needs of Horses</h1>
    <p>Water is the single most important nutrient for horses. A horse can survive weeks without food, but only a few days without water.</p>

    <h2>📊 How Much Water Does a Horse Need?</h2>
    <p>An average adult horse drinks <strong>25–55 liters of water per day</strong>. This increases when:</p>
    <ul>
        <li>The weather is hot or humid</li>
        <li>The horse is working or exercising heavily</li>
        <li>The horse is lactating</li>
        <li>The horse is eating mostly dry hay</li>
    </ul>

    <table border="1" cellpadding="8" cellspacing="0" style="border-collapse:collapse; width:100%; margin-top:10px;">
        <tr style="background:#d0eaf8;">
            <th>Situation</th>
            <th>Estimated Daily Water Intake</th>
        </tr>
        <tr><td>Resting horse, cool weather</td><td>25–30 liters</td></tr>
        <tr><td>Working horse, normal weather</td><td>35–45 liters</td></tr>
        <tr><td>Hot summer day</td><td>45–60 liters</td></tr>
        <tr><td>Lactating mare</td><td>Up to 65 liters</td></tr>
    </table>

    <h2>✅ Water Quality Matters</h2>
    <ul>
        <li>Water should always be clean and fresh</li>
        <li>Change water buckets at least once or twice a day</li>
        <li>Scrub buckets and troughs weekly to prevent algae</li>
        <li>In winter, make sure water isn't frozen</li>
    </ul>

    <h2>⚠️ Signs of Dehydration</h2>
    <p>Use the "pinch test": pinch the skin on the neck. If it snaps back in under 2 seconds, the horse is well hydrated.</p>
    <ul>
        <li>Dry, tacky gums</li>
        <li>Sunken eyes</li>
        <li>Lethargy or weakness</li>
        <li>Dark, concentrated urine</li>
    </ul>

    <h2>🧂 Electrolytes and Salt</h2>
    <p>Provide a <strong>salt lick block</strong> in the stable so horses can regulate their own salt intake. After intense exercise in hot weather, electrolyte supplements may be needed.</p>


</asp:Content>
