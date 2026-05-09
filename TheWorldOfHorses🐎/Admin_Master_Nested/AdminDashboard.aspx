<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master_Nested/Admin.master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TheWorldOfHorses__.Admin_Master_Nested_.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

     <h2>📊 Dashboard</h2>

    <div style="display: flex; gap: 20px; flex-wrap: wrap;">

        <div class="stat-card">
            <div class="stat-icon">👥</div>
            <div class="stat-number"><asp:Label ID="lblTotalUsers" runat="server" Text="0" /></div>
            <div class="stat-label">Total Users</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">🎮</div>
            <div class="stat-number"><asp:Label ID="lblTotalGames" runat="server" Text="0" /></div>
            <div class="stat-label">Total Games Played</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">🏆</div>
            <div class="stat-number"><asp:Label ID="lblTopScore" runat="server" Text="0" /></div>
            <div class="stat-label">Top Score</div>
        </div>

    </div>

    <style>
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            width: 160px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-top: 4px solid coral;
        }

        .stat-icon {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .stat-number {
            font-size: 32px;
            font-weight: bold;
            color: #1a1a1a;
        }

        .stat-label {
            font-size: 13px;
            color: #888;
            margin-top: 5px;
        }
    </style>

</asp:Content>
