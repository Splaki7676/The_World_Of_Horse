<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="quis.aspx.cs" Inherits="TheWorldOfHorses__.quis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
 
    <div class="quiz">

        <h3>1. What is the fastest horse breed?</h3>

        <label>
            <input type="radio" name="q1" value="Arabian" id="q1a1">
            Arabian
        </label>
        <br />

        <label>
            <input type="radio" name="q1" value="Thoroughbred" id="q1a2">
            Thoroughbred
        </label>
        <br />

        <label>
            <input type="radio" name="q1" value="Clydesdale" id="q1a3">
            Clydesdale
        </label>
        <br />

        <label>
            <input type="radio" name="q1" value="Pony" id="q1a4">
            Pony
        </label>


        <br />
        <br />

        <h3>2. Which horse is small?</h3>

        <label>
            <input type="radio" name="q2" value="Mustang" id="q2a1">
            Mustang
        </label>
        <br />

        <label>
            <input type="radio" name="q2" value="Pony" id="q2a2">
            Pony
        </label>
        <br />

        <label>
            <input type="radio" name="q2" value="Friesian" id="q2a3">
            Friesian
        </label>
        <br />

        <label>
            <input type="radio" name="q2" value="Andalusian" id="q2a4">
            Andalusian
        </label>


        <br />
        <br />

        <h3>3. How many toes does a horse have per leg?</h3>

        <label>
            <input type="radio" name="q3" value="1" id="q3a1">
            1
        </label>
        <br />

        <label>
            <input type="radio" name="q3" value="2" id="q3a2">
            2
        </label>
        <br />

        <label>
            <input type="radio" name="q3" value="3" id="q3a3">
            3
        </label>
        <br />

        <label>
            <input type="radio" name="q3" value="4" id="q3a4">
            4
        </label>


        <br />
        <br />

        <h3>4. What do horses mainly eat?</h3>

        <label>
            <input type="radio" name="q4" value="Meat" id="q4a1">
            Meat
        </label>
        <br />

        <label>
            <input type="radio" name="q4" value="Fish" id="q4a2">
            Fish
        </label>
        <br />

        <label>
            <input type="radio" name="q4" value="Hay" id="q4a3">
            Hay
        </label>
        <br />

        <label>
            <input type="radio" name="q4" value="Insects" id="q4a4">
            Insects
        </label>

        <br />
        <br />
        <div id="finalScore" runat="server"></div>
        <br />
        <br />
        <input type="submit" value="Check Score" />
    </div>
</asp:Content>
