<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GameResults.aspx.cs" Inherits="TheWorldOfHorses__.GameResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .game-results {
            background-color: aqua;
            text-align: center;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 30px;
            background-color: aqua;
            width: 20cm;
            border-radius: 50%;
            height: 20cm;
            display: flex;
            justify-content: center;
            margin-left: 25%;
            box-sizing: border-box;
            padding: 4px;
            flex-direction: column;
        }
        .title {
            font-weight: bold;
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="game-results" >

        <h2>Game Results</h2>

        <span class="title">Game Name:</span>
        <asp:Label ID="lblGame" runat="server"  /><br />
        <br>
        <span class="title">Score:</span>
        <asp:Label ID="lblScore" runat="server" /><br />
        <br>

        <asp:Label ID="lblMessage" runat="server" Font-Size="70px" />

    </div>

    
</asp:Content>
