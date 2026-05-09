<%@ Page Title="" Language="C#" MasterPageFile="~/knoleg_master(nested)/knowlegHorse.master" AutoEventWireup="true" CodeBehind="FeedingByAge.aspx.cs" Inherits="TheWorldOfHorses__.knoleg_master_nested_.FeedingByAge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NutritionContent" runat="server">
     <h1>🐣 Feeding Horses by Age</h1>
    <p>A horse's nutritional needs change dramatically throughout its life — from a nursing foal to a senior horse.</p>

    <h2>🍼 Foals (0–6 months)</h2>
    <ul>
        <li>Rely entirely on their mother's milk for the first weeks of life</li>
        <li>Around 2–3 months, foals begin to nibble on hay and grass</li>
        <li>"Creep feed" (special foal feed) can be introduced at 1–2 months</li>
        <li>Should not be weaned before 4–6 months of age</li>
    </ul>

    <h2>🌱 Weanlings &amp; Yearlings (6 months – 2 years)</h2>
    <ul>
        <li>After weaning, need a diet high in protein and calcium for growth</li>
        <li>Feed specially formulated growth pellets</li>
        <li>Good quality hay should be freely available</li>
        <li>Avoid overfeeding — too-fast growth causes joint problems</li>
    </ul>

    <h2>💪 Young Adults (2–5 years)</h2>
    <ul>
        <li>Horses are still growing until age 5–6</li>
        <li>As training begins, energy needs increase</li>
        <li>Introduce grain slowly if they are in work</li>
    </ul>

    <h2>🏆 Adult Horses (5–15 years)</h2>
    <ul>
        <li>Feed based on workload: light work = mostly forage, heavy work = more concentrates</li>
        <li>A typical plan: 1.5–2% of body weight in forage daily</li>
        <li>Provide a mineral block for free-choice salt</li>
    </ul>

    <h2>🧓 Senior Horses (15+ years)</h2>
    <ul>
        <li>Switch to senior feed pellets that are easy to chew</li>
        <li>Soak hay or feed hay cubes if the horse has dental issues</li>
        <li>Increase feeding frequency to 3+ small meals daily</li>
        <li>Regular dental checkups every 6–12 months are essential</li>
        <li>Joint supplements (glucosamine, MSM) may be beneficial</li>
    </ul>

    <table border="1" cellpadding="8" cellspacing="0" style="border-collapse:collapse; width:100%; margin-top:15px;">
        <tr style="background:#fdf3e3;">
            <th>Age Group</th>
            <th>Key Nutritional Focus</th>
        </tr>
        <tr><td>Foal (0–6 mo)</td><td>Mother's milk + introduction to forage</td></tr>
        <tr><td>Weanling/Yearling</td><td>High protein &amp; calcium for growth</td></tr>
        <tr><td>Young adult (2–5)</td><td>Balanced growth + training energy</td></tr>
        <tr><td>Adult (5–15)</td><td>Forage-based, adjusted for workload</td></tr>
        <tr><td>Senior (15+)</td><td>Easy-to-digest feed, dental care</td></tr>
    </table>

</asp:Content>
