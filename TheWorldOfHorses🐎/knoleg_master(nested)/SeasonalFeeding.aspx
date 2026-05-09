<%@ Page Title="" Language="C#" MasterPageFile="~/knoleg_master(nested)/knowlegHorse.master" AutoEventWireup="true" CodeBehind="SeasonalFeeding.aspx.cs" Inherits="TheWorldOfHorses__.knoleg_master_nested_.SeasonalFeeding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NutritionContent" runat="server">
    
    <h1>🍂 Seasonal Feeding Guide</h1>
    <p>A horse's nutritional needs change with the seasons. Temperature, activity level, and pasture availability all affect what and how much a horse should eat.</p>

    <h2>🌸 Spring — Watch Out for Rich Grass!</h2>
    <p>Fresh spring grass is very high in sugars (fructans), which can cause laminitis and colic.</p>
    <ul>
        <li>Limit grazing time, especially in the morning when sugar levels are highest</li>
        <li>Use a grazing muzzle if needed</li>
        <li>Introduce pasture gradually after winter</li>
    </ul>

    <h2>☀️ Summer — Heat and Hydration</h2>
    <ul>
        <li>Horses sweat more and need up to 60 liters of water per day</li>
        <li>Provide electrolytes after heavy exercise</li>
        <li>Pasture may dry out — supplement with hay</li>
        <li>Feed during the cooler hours of morning and evening</li>
    </ul>

    <h2>🍁 Autumn — Preparing for Winter</h2>
    <ul>
        <li>As pasture declines, gradually increase hay rations</li>
        <li>Monitor body condition — horses should enter winter at healthy weight</li>
        <li>Watch for acorns and fallen leaves in paddocks — some are toxic</li>
    </ul>

    <h2>❄️ Winter — Extra Energy Needed</h2>
    <ul>
        <li>Increase hay significantly — forage fermentation creates body heat</li>
        <li>Ensure water does not freeze — use heated buckets</li>
        <li>Thin horses may need grain supplementation</li>
        <li>Horses in blankets burn fewer calories — adjust feed accordingly</li>
    </ul>

    <table border="1" cellpadding="8" cellspacing="0" style="border-collapse:collapse; width:100%; margin-top:15px;">
        <tr style="background:#e0f0ff;">
            <th>Season</th>
            <th>Main Challenge</th>
            <th>Key Action</th>
        </tr>
        <tr><td>Spring</td><td>Too much rich grass</td><td>Limit grazing, watch for laminitis</td></tr>
        <tr><td>Summer</td><td>Dehydration</td><td>Extra water &amp; electrolytes</td></tr>
        <tr><td>Autumn</td><td>Declining pasture</td><td>Increase hay gradually</td></tr>
        <tr><td>Winter</td><td>Cold = more calories needed</td><td>More hay, check water daily</td></tr>
    </table>
</asp:Content>
