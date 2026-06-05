<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Guess_the_Sound.aspx.cs" Inherits="TheWorldOfHorses__.Guess_the_Sound" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .game-page {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 70vh;
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }

        /* מסך פתיחה */
        #startScreen {
            text-align: center;
            background: white;
            border-radius: 20px;
            padding: 50px 60px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
            max-width: 480px;
            width: 100%;
        }

        .start-emoji {
            font-size: 70px;
            margin-bottom: 10px;
        }

        #startScreen h1 {
            font-size: 2rem;
            color: #3b2a1a;
            margin-bottom: 10px;
        }

        #startScreen p {
            color: #7a6550;
            font-size: 1rem;
            margin: 6px 0;
        }

        .game-info {
            background: #fdf3e3;
            border-radius: 10px;
            padding: 8px 16px;
            display: inline-block;
            color: #b07d3a !important;
            font-weight: 600;
            margin: 12px 0 20px !important;
        }

        .btn-main {
            background: linear-gradient(135deg, #c8860a, #e8a020);
            color: white;
            border: none;
            padding: 14px 40px;
            border-radius: 30px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(200,134,10,0.4);
            transition: transform 0.2s, box-shadow 0.2s;
        }

            .btn-main:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(200,134,10,0.5);
            }

        /* מסך משחק */
        #gameScreen {
            background: white;
            border-radius: 20px;
            padding: 36px 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
            max-width: 520px;
            width: 100%;
            text-align: center;
        }

        .progress-top {
            display: flex;
            justify-content: space-between;
            margin-bottom: 24px;
            font-weight: 600;
            color: #7a6550;
            font-size: 1rem;
        }

        /* כפתור ניגון */
        .sound-player {
            margin: 10px 0 28px;
        }

        

        /* כפתורי תשובות */
        .choices {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            margin-top: 10px;
        }

        .btn-choice {
            background: #fdf3e3;
            border: 2px solid #e8d5b0;
            border-radius: 14px;
            padding: 16px 12px;
            font-size: 0.95rem;
            font-weight: 600;
            color: #3b2a1a;
            cursor: pointer;
            transition: all 0.2s;
            line-height: 1.4;
        }

            .btn-choice:hover {
                background: #f5e6c8;
                border-color: #c8860a;
                color: #c8860a;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(200,134,10,0.2);
            }

            .btn-choice:active {
                transform: scale(0.97);
            }

        .player-box {
            background: white;
            border: 2px solid #e0cfc0;
            border-radius: 16px;
            padding: 22px 32px;
            width: 100%;
            display: flex;
            align-items: center;
            gap: 18px;
            box-sizing: border-box;
        }

        .play-btn {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: saddlebrown;
            color: white;
            border: none;
            font-size: 18px;
            cursor: pointer;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .play-btn:hover {
                background: #6b3410;
            }

        .player-info {
            flex: 1;
        }

        .progress-bar {
            height: 6px;
            background: #e0cfc0;
            border-radius: 3px;
        }

        .progress-fill {
            height: 6px;
            background: saddlebrown;
            border-radius: 3px;
            width: 0%;
            transition: width 0.3s;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="game-page">

        <!-- מסך פתיחה -->
        <div id="startScreen" runat="server">
            <div class="start-emoji">🎵</div>
            <h1>Guess the Sound!</h1>
            <p>Listen to the horse sound and guess what it is</p>
            <p class="game-info">5 rounds • 4 choices each</p>
            <asp:Button ID="btnStart" runat="server" Text="▶ Start Game"
                CssClass="btn-main" OnClick="btnStart_Click" />
        </div>

        <!-- מסך משחק -->
        <div id="gameScreen" runat="server" visible="false">
            <span><strong>*</strong>stop and start will start the sound frome the beginning</span>
            <div class="progress-top">
                <asp:Label ID="lblRound" runat="server" Text="Round 1 / 5" />
                <asp:Label ID="lblScore" runat="server" Text="Score: 0" />
            </div>

            <div class="sound-player">
                <audio id="gameAudio"></audio>
                <asp:HiddenField ID="hfAudioSrc" runat="server" />
                <asp:HiddenField ID="hfAudioType" runat="server" />

                <div class="player-box">
                    <button type="button" class="play-btn" id="playBtn" onclick="playSound()">▶</button>
                    <div class="player-info">
                        <div class="progress-bar">
                            <div class="progress-fill" id="progressFill"></div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="choices">
                <asp:Button ID="btnA" runat="server" CssClass="btn-choice" OnClick="btnAnswer_Click" />
                <asp:Button ID="btnB" runat="server" CssClass="btn-choice" OnClick="btnAnswer_Click" />
                <asp:Button ID="btnC" runat="server" CssClass="btn-choice" OnClick="btnAnswer_Click" />
                <asp:Button ID="btnD" runat="server" CssClass="btn-choice" OnClick="btnAnswer_Click" />
            </div>
        </div>

    </div>

    <script>
        function playSound() {
            var src = document.getElementById('<%= hfAudioSrc.ClientID %>').value;
            var type = document.getElementById('<%= hfAudioType.ClientID %>').value;
            var audio = document.getElementById('gameAudio');
            var btn = document.getElementById('playBtn');

            // אם כבר מנגן — עצור
            if (!audio.paused) {
                audio.pause();
                audio.currentTime = 0;
                btn.textContent = '▶';
                return;
            }

            // טען רק אם ה-src השתנה
            if (audio.getAttribute('data-loaded') !== src) {
                audio.src = src;
                audio.type = type;
                audio.load();
                audio.setAttribute('data-loaded', src);
            }

            audio.play();
            btn.textContent = '⏹ Stop';

            // כשנגמר — חזור לכפתור Play
            audio.onended = function () {
                btn.textContent = '▶';
            };
        }
    </script>

</asp:Content>
