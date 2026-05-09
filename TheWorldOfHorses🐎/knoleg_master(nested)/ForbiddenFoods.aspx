<%@ Page Title="" Language="C#" MasterPageFile="~/knoleg_master(nested)/knowlegHorse.master" AutoEventWireup="true" CodeBehind="ForbiddenFoods.aspx.cs" Inherits="TheWorldOfHorses__.knoleg_master_nested_.ForbiddenFoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NutritionContent" runat="server">

     <h1>🚫 Foods Horses Should Never Eat</h1>
    <p>Some foods that seem harmless to humans can be very dangerous for horses. Here's what to absolutely avoid.</p>

    <h2>☠️ Toxic and Dangerous Foods</h2>
    <table border="1" cellpadding="8" cellspacing="0" style="border-collapse:collapse; width:100%; margin-top:10px;">
        <tr style="background:#f8d7da;">
            <th>Food</th>
            <th>Why It's Dangerous</th>
        </tr>
        <tr>
            <td>🍫 Chocolate</td>
            <td>Contains theobromine — toxic to horses. Can cause colic, seizures, and heart problems.</td>
        </tr>
        <tr>
            <td>🧅 Onions &amp; Garlic</td>
            <td>Can damage red blood cells and cause anemia.</td>
        </tr>
        <tr>
            <td>🥑 Avocado</td>
            <td>All parts are toxic to horses. Causes respiratory distress and edema.</td>
        </tr>
        <tr>
            <td>🍞 Bread &amp; Baked Goods</td>
            <td>Dough can expand in the gut and cause colic.</td>
        </tr>
        <tr>
            <td>🥦 Brassicas (cabbage, broccoli)</td>
            <td>Cause extreme gas buildup leading to painful colic.</td>
        </tr>
        <tr>
            <td>🌾 Moldy Hay or Feed</td>
            <td>Fungal toxins can cause liver damage and neurological issues.</td>
        </tr>
        <tr>
            <td>🍅 Tomato leaves/stems</td>
            <td>Part of the nightshade family — toxic in large amounts.</td>
        </tr>
        <tr>
            <td>🥔 Potatoes</td>
            <td>Raw potatoes and potato plants are toxic.</td>
        </tr>
        <tr>
            <td>🌰 Acorns &amp; Oak leaves</td>
            <td>Contain tannins that damage kidneys and the digestive tract.</td>
        </tr>
    </table>

    <h2>⚠️ Foods to Be Careful With</h2>
    <ul>
        <li><strong>Apples and carrots:</strong> Great as treats but only in small amounts</li>
        <li><strong>Spring grass:</strong> Very rich — limit grazing time to avoid laminitis</li>
        <li><strong>Alfalfa hay:</strong> Too much protein if given in excess</li>
    </ul>

    <h2>🆘 If Your Horse Ate Something Toxic</h2>
    <p>Call your vet immediately. Signs of poisoning include: colic, trembling, difficulty breathing, excessive sweating, or loss of coordination.</p>



</asp:Content>
