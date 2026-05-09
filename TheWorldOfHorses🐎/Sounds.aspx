<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sounds.aspx.cs" Inherits="TheWorldOfHorses__.Sounds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/sounds.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="top-row">
        <div class="sounds-hint">
            <span class="hint-emoji">👆</span>
            <p>Click a sound to start</p>
        </div>
        <div class="volume-banner">
            🔊 Make sure your volume is turned up!
        </div>
    </div>

    <div class="sounds-page">

        <div class="sounds-circles" id="soundsCircles"></div>

        <div class="player-box">
            <audio id="audioPlayer">
                <source id="audioSource" src="" />
            </audio>
            <button type="button" class="play-btn" id="playBtn" onclick="togglePlay()">▶</button>
            <div class="player-info">
                <div class="player-name" id="playerName">—</div>
                <div class="progress-bar">
                    <div class="progress-fill" id="progressFill"></div>
                </div>
            </div>
        </div>

    </div>

    <script>
        var sounds = [
            { name: 'neigh', label: 'Neigh', hebrew: 'נהירה', emoji: '🐴', ext: 'wav' },
            { name: 'snort', label: 'Snort', hebrew: 'נחירה', emoji: '😤', ext: 'wav' },
            { name: 'nicker', label: 'Nicker', hebrew: 'גרגור', emoji: '😌', ext: 'wav' },
            { name: 'scream', label: 'Scream', hebrew: 'צריחה', emoji: '😱', ext: 'wav' },
            { name: 'blow', label: 'Blow', hebrew: 'נשיפה', emoji: '💨', ext: 'wav' },
            { name: 'snore', label: 'Snore', hebrew: 'נחירת שינה', emoji: '🤧', ext: 'wav' },
            { name: 'whinny', label: 'Whinny', hebrew: 'ילילה', emoji: '👶', ext: 'wav' },
            { name: 'horse_eating_hay', label: 'Eating hay', hebrew: 'אכילת שחת', emoji: '🌾', ext: 'wav' },
            { name: 'horse_drinking_water', label: 'Drinking', hebrew: 'שתייה', emoji: '💧', ext: 'wav' },
            { name: 'horse_tail_swish', label: 'Tail swish', hebrew: 'נדנוד זנב', emoji: '🐎', ext: 'm4a' },
            { name: 'horse_teeth', label: 'Eating carrot', hebrew: 'אכילת גזר', emoji: '🥕', ext: 'm4a' },
            { name: 'walk2_fotstepsts', label: 'Hooves', hebrew: 'פרסות', emoji: '👟', ext: 'wav' }
        ];

        window.onload = function () {
            var container = document.getElementById('soundsCircles');
            sounds.forEach(function (s, index) {
                var div = document.createElement('div');
                div.className = 'sound-circle' + (index === 0 ? ' active' : '');
                div.innerHTML = '<div class="circle">' + s.emoji + '</div><span>' + s.label + '</span>';
                div.onclick = function () { playSound(s, div); };
                container.appendChild(div);
            });
        };

        function playSound(s, el) {
            var audio = document.getElementById('audioPlayer');
            var source = document.getElementById('audioSource');
            var type = s.ext === 'm4a' ? 'audio/mp4' : 'audio/wav';

            audio.pause();
            source.src = 'Sounds/' + s.name + '.' + s.ext;
            source.type = type;
            audio.load();
            audio.volume = s.name === 'horse_teeth' ? 0.05 : 1.0;  // ← הוסף כאן
            audio.play();

            if (s.name === 'horse_teeth') {
                setTimeout(function () {
                    audio.volume = 1.0;
                }, 2000);
            }

            document.getElementById('playerName').innerText = s.label + ' — ' + s.hebrew;
            document.getElementById('playBtn').innerText = '⏸';
            document.getElementById('progressFill').style.width = '0%';

            document.querySelectorAll('.sound-circle').forEach(function (c) {
                c.classList.remove('active');
            });
            el.classList.add('active');

            audio.ontimeupdate = function () {
                if (audio.duration) {
                    var pct = (audio.currentTime / audio.duration) * 100;
                    document.getElementById('progressFill').style.width = pct + '%';
                }
            };

            audio.onended = function () {
                document.getElementById('playBtn').innerText = '▶';
                document.getElementById('progressFill').style.width = '100%';
            };
        }
        function togglePlay() {
            var audio = document.getElementById('audioPlayer');
            var btn = document.getElementById('playBtn');
            if (audio.paused) {
                audio.play();
                btn.innerText = '⏸';
            } else {
                audio.pause();
                btn.innerText = '▶';
            }
        }
    
    </script>


</asp:Content>
