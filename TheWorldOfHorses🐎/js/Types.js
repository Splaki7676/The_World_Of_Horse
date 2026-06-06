// ===============================
// נתוני הסוסים
// ===============================
const horsesData = [
    // ===== קבוצה: מהירים (ירוק) =====
    {
        name: "Arabian Horse",
        image: "types_pic/Group_fast/ArabianHorsePic.png",
        group: "fast",
        groupLabel: "Fast",
        color: "#27ae60",
        speed: "65 km/h",
        height: "150–160 cm",
        horseColor: "Bay, Gray, Chestnut",
        temperament: "Intelligent, Energetic",
        description: "One of the oldest and most recognizable breeds in the world. Known for incredible endurance and loyalty, often used in long-distance racing and shows.",
        funFact: "Can travel over 100 miles in a single day! 🌵"
    },
    {
        name: "Quarter Horse",
        image: "types_pic/Group_fast/QuarterHorsePic.png",
        group: "fast",
        groupLabel: "Fast",
        color: "#27ae60",
        speed: "88 km/h",
        height: "145–163 cm",
        horseColor: "Sorrel, Bay, Black",
        temperament: "Calm, Responsive",
        description: "The fastest horse breed over short distances. Famous in American rodeos and Western riding. Extremely muscular and agile.",
        funFact: "Can reach top speed in just 3 strides! ⚡"
    },
    {
        name: "Thoroughbred",
        image: "types_pic/Group_fast/Thoroughbred_Group_fast_pic_2.jpg",
        group: "fast",
        groupLabel: "Fast",
        color: "#27ae60",
        speed: "70 km/h",
        height: "157–163 cm",
        horseColor: "Bay, Chestnut, Gray",
        temperament: "Spirited, Athletic",
        description: "The ultimate racehorse, bred specifically for speed and agility. Dominates the world of horse racing globally.",
        funFact: "The Kentucky Derby has been run by Thoroughbreds since 1875! 🏆"
    },
    {
        name: "Akhal-Teke",
        image: "types_pic/Group_fast/Akhal-Teke_Group_fast_pic.jpg",
        group: "fast",
        groupLabel: "Fast",
        color: "#27ae60",
        speed: "60 km/h",
        height: "147–163 cm",
        horseColor: "Golden, Palomino, Bay",
        temperament: "Loyal, Brave",
        description: "An ancient breed from Turkmenistan with a stunning metallic golden coat. Incredibly fast and resilient in harsh desert conditions.",
        funFact: "Its coat shimmers like gold in the sunlight ✨"
    },
    {
        name: "Standardbred",
        image: "types_pic/Group_fast/Standardbred_Group_fast_pic.jpg",
        group: "fast",
        groupLabel: "Fast",
        color: "#27ae60",
        speed: "55 km/h",
        height: "142–163 cm",
        horseColor: "Bay, Brown, Black",
        temperament: "Gentle, Hardworking",
        description: "Bred specifically for harness racing. Known for their stamina and consistent pace. One of America's most popular racing breeds.",
        funFact: "Can trot faster than most horses can gallop! 🏇"
    },
    {
        name: "Appaloosa",
        image: "types_pic/Group_fast/Appaloosa_Group_fast_pic.jpg",
        group: "fast",
        groupLabel: "Fast",
        color: "#27ae60",
        speed: "55 km/h",
        height: "142–162 cm",
        horseColor: "Spotted, Leopard",
        temperament: "Hardy, Versatile",
        description: "Famous for their striking spotted coat pattern. Originally bred by the Nez Perce Native Americans for speed and stamina.",
        funFact: "No two Appaloosas have the same spot pattern! 🐆"
    },

    // ===== קבוצה: פראיים (כתום-חום) =====
    {
        name: "Mustang",
        image: "types_pic/Group_wild/Mustang_Group_wild_pic.jpg",
        group: "wild",
        groupLabel: "Wild",
        color: "#c0392b",
        speed: "72 km/h",
        height: "140–158 cm",
        horseColor: "All colors",
        temperament: "Independent, Fierce",
        description: "Free-roaming horses of the American West. Descendants of Spanish horses brought by explorers. Symbolize freedom and wilderness.",
        funFact: "Over 80,000 Mustangs still roam free in the USA 🌄"
    },
    {
        name: "Przewalski's Horse",
        image: "types_pic/Group_wild/Przewalski_Group_wild_pic.jpg",
        group: "wild",
        groupLabel: "Wild",
        color: "#c0392b",
        speed: "56 km/h",
        height: "122–142 cm",
        horseColor: "Dun, Bay",
        temperament: "Wild, Untameable",
        description: "The last truly wild horse species on Earth. Never domesticated. Once extinct in the wild, saved by conservation efforts.",
        funFact: "Has 66 chromosomes, 2 more than domestic horses! 🧬"
    },
    {
        name: "Brumby",
        image: "types_pic/Group_wild/Brumby_Group_wild_pic.jpg",
        group: "wild",
        groupLabel: "Wild",
        color: "#c0392b",
        speed: "64 km/h",
        height: "140–155 cm",
        horseColor: "Bay, Chestnut, Gray",
        temperament: "Stubborn, Resilient",
        description: "Australia's famous feral horses. Descendants of escaped domestic horses that adapted to harsh outback conditions.",
        funFact: "There are over 400,000 Brumbies roaming Australia! 🦘"
    },
    {
        name: "Camargue Horse",
        image: "types_pic/Group_wild/Camargue_Group_wild_pic.jpg",
        group: "wild",
        groupLabel: "Wild",
        color: "#c0392b",
        speed: "52 km/h",
        height: "135–150 cm",
        horseColor: "White, Gray",
        temperament: "Hardy, Spirited",
        description: "Ancient semi-wild horses from the marshes of southern France. Born dark, they turn white as they mature. Called 'Horses of the Sea'.",
        funFact: "They are born black or brown and slowly turn white! 🌊"
    },
    {
        name: "Kaimanawa Horse",
        image: "types_pic/Group_wild/Kaimanawa_Group_wild_pic.jpg",
        group: "wild",
        groupLabel: "Wild",
        color: "#c0392b",
        speed: "50 km/h",
        height: "130–148 cm",
        horseColor: "Bay, Brown, Black",
        temperament: "Tough, Independent",
        description: "Wild horses living on the volcanic plateau of New Zealand's North Island. Extremely hardy and adapted to rough terrain.",
        funFact: "They survived the harsh volcanic terrain for over 150 years! 🌋"
    },

    // ===== קבוצה: מלכותיים (סגול) =====
    {
        name: "Friesian Horse",
        image: "types_pic/Group_royal/FriesianHorsePic.png",
        group: "royal",
        groupLabel: "Royal",
        color: "#8e44ad",
        speed: "55 km/h",
        height: "152–170 cm",
        horseColor: "Black",
        temperament: "Graceful, Majestic",
        description: "One of Europe's oldest breeds, known for its striking black coat and long flowing mane. Used by knights in the Middle Ages.",
        funFact: "Friesians are almost always pure black 🖤"
    },
    {
        name: "Andalusian Horse",
        image: "types_pic/Group_royal/Andalusian_Group_royal_pic.jpg",
        group: "royal",
        groupLabel: "Royal",
        color: "#8e44ad",
        speed: "55 km/h",
        height: "152–165 cm",
        horseColor: "Gray, White, Bay",
        temperament: "Noble, Brave",
        description: "Also known as the Pure Spanish Horse. Historically ridden by royalty and used in bullfighting. Famous for elegant high-stepping movement.",
        funFact: "Christopher Columbus rode an Andalusian on his voyages! ⚓"
    },
    {
        name: "Lipizzaner",
        image: "types_pic/Group_royal/Lipizzaner_Group_royal_pic.jpg",
        group: "royal",
        groupLabel: "Royal",
        color: "#8e44ad",
        speed: "50 km/h",
        height: "147–162 cm",
        horseColor: "White, Gray",
        temperament: "Intelligent, Dignified",
        description: "The famous 'dancing white horses' of the Spanish Riding School in Vienna. Trained in complex classical dressage movements.",
        funFact: "They are born dark and turn white only as adults 🤍"
    },
    {
        name: "Lusitano",
        image: "types_pic/Group_royal/Lusitano_Group_royal_pic.jpg",
        group: "royal",
        groupLabel: "Royal",
        color: "#8e44ad",
        speed: "52 km/h",
        height: "150–165 cm",
        horseColor: "Gray, Bay, Chestnut",
        temperament: "Courageous, Agile",
        description: "Portugal's national horse breed. Closely related to the Andalusian. Traditionally used in bullfighting where the horse must dodge the bull.",
        funFact: "The name 'Lusitano' comes from ancient Roman name for Portugal! 🏛️"
    },
    {
        name: "Baroque Horse",
        image: "types_pic/Group_royal/Baroque_Group_royal_pic.jpg",
        group: "royal",
        groupLabel: "Royal",
        color: "#8e44ad",
        speed: "48 km/h",
        height: "155–168 cm",
        horseColor: "White, Gray, Black",
        temperament: "Powerful, Elegant",
        description: "A category of horses bred in Europe during the Baroque period for royalty and nobility. Known for arched necks and powerful build.",
        funFact: "Painted in hundreds of royal portraits throughout history! 🎨"
    },

    // ===== קבוצה: כבדים/עבודה (כחול כהה) =====
    {
        name: "Shire Horse",
        image: "types_pic/Group_work/ShireHorsePic.png",
        group: "work",
        groupLabel: "Work",
        color: "#2980b9",
        speed: "40 km/h",
        height: "163–193 cm",
        horseColor: "Black, Bay, Gray",
        temperament: "Gentle, Patient",
        description: "One of the world's tallest and heaviest horse breeds. Originally bred to pull heavy loads in England. Despite its size, incredibly gentle.",
        funFact: "A Shire horse once pulled 58 tonnes — a world record! 💪"
    },
    {
        name: "Clydesdale",
        image: "types_pic/Group_work/Clydesdale_Group_work_pic.jpg",
        group: "work",
        groupLabel: "Work",
        color: "#2980b9",
        speed: "38 km/h",
        height: "162–183 cm",
        horseColor: "Bay, Brown, Roan",
        temperament: "Friendly, Strong",
        description: "Scotland's famous draft horse. Known for feathered legs and a high-stepping gait. Famous as the Budweiser mascot horses.",
        funFact: "The Budweiser Clydesdales travel 100,000 miles per year! 🍺"
    },
    {
        name: "Percheron",
        image: "types_pic/Group_work/Percheron_Group_work_pic.jpg",
        group: "work",
        groupLabel: "Work",
        color: "#2980b9",
        speed: "42 km/h",
        height: "155–185 cm",
        horseColor: "Gray, Black",
        temperament: "Willing, Versatile",
        description: "A powerful French draft horse. Despite their massive size, Percherons are athletic and energetic. Used in agriculture and forestry.",
        funFact: "Napoleon Bonaparte was a fan of the Percheron breed! 🇫🇷"
    },
    {
        name: "Belgian Draft",
        image: "types_pic/Group_work/BelgianDraft_Group_work_pic .jpg",
        group: "work",
        groupLabel: "Work",
        color: "#2980b9",
        speed: "35 km/h",
        height: "162–173 cm",
        horseColor: "Chestnut, Roan",
        temperament: "Docile, Powerful",
        description: "One of the strongest horse breeds on Earth. The Belgian Draft has been used for centuries to pull heavy farm equipment.",
        funFact: "Can pull loads over twice its own body weight! 🏋️"
    },
    {
        name: "Suffolk Punch",
        image: "types_pic/Group_work/SuffolkPunch_Group_work_pic .jpg",
        group: "work",
        groupLabel: "Work",
        color: "#2980b9",
        speed: "36 km/h",
        height: "163–173 cm",
        horseColor: "Chestnut",
        temperament: "Hard-working, Calm",
        description: "England's oldest draft horse breed. Always chestnut in color. Known for exceptional strength and a docile temperament.",
        funFact: "Every Suffolk Punch alive today traces back to one stallion from 1768! 📜"
    },

    // ===== קבוצה: נדירים (זהוב/כתום) =====
    {
        name: "Shetland Pony",
        image: "types_pic/Group_rare/ShetlandPonyPic.png",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "45 km/h",
        height: "70–107 cm",
        horseColor: "All colors",
        temperament: "Stubborn, Friendly",
        description: "The smallest horse breed, originating from Scotland's Shetland Islands. Despite tiny size, incredibly strong — can carry twice its own weight.",
        funFact: "Proportionally, they are stronger than a draft horse! 💥"
    },
    {
        name: "Marwari Horse",
        image: "types_pic/Group_rare/Marwari_Group_rare_pic.jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "60 km/h",
        height: "142–160 cm",
        horseColor: "All colors, often Piebald",
        temperament: "Brave, Loyal",
        description: "A rare breed from the Marwar region of India, easily identified by its unique inward-turning ear tips. Used by Indian warriors for centuries.",
        funFact: "Its ears can rotate 180 degrees! 👂"
    },
    {
        name: "Falabella",
        image: "types_pic/Group_rare/Falabella_Group_rare_pic.jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "40 km/h",
        height: "63–86 cm",
        horseColor: "All colors",
        temperament: "Gentle, Intelligent",
        description: "The world's smallest horse breed, developed in Argentina. Despite being miniature, it has all the proportions of a full-sized horse.",
        funFact: "Some Falabellas are smaller than a large dog! 🐕"
    },
    {
        name: "Fjord Horse",
        image: "types_pic/Group_rare/Fjord_Group_rare_pic.jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "48 km/h",
        height: "135–150 cm",
        horseColor: "Dun, Yellow Dun",
        temperament: "Calm, Willing",
        description: "One of the world's oldest and purest horse breeds from Norway. Recognizable by its distinctive two-toned mane and dun coloring.",
        funFact: "Viking warriors rode Fjord horses into battle! ⚔️"
    },
    {
        name: "Icelandic Horse",
        image: "types_pic/Group_rare/Icelandic_Group_rare_pic.jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "48 km/h",
        height: "132–142 cm",
        horseColor: "All colors",
        temperament: "Friendly, Tough",
        description: "A small but incredibly hardy breed from Iceland. Unique in that it has five gaits instead of the usual three.",
        funFact: "Once an Icelandic Horse leaves Iceland, it can never return! 🧊"
    },
    {
        name: "Haflinger",
        image: "types_pic/Group_rare/Haflinger_Group_rare_pic.jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "50 km/h",
        height: "136–150 cm",
        horseColor: "Chestnut with flaxen mane",
        temperament: "Friendly, Versatile",
        description: "An Austrian mountain horse with a stunning golden chestnut coat and white/flaxen mane. Used for both riding and light draft work.",
        funFact: "All Haflingers trace back to one stallion born in 1874! 🏔️"
    },
    {
        name: "Knabstrupper",
        image: "types_pic/Group_rare/Knabstrupper_Group_rare_pic.jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "52 km/h",
        height: "155–164 cm",
        horseColor: "Spotted, Leopard",
        temperament: "Calm, Intelligent",
        description: "A rare Danish breed with a striking leopard-spotted coat. One of the most visually stunning horses in the world.",
        funFact: "Their spotted pattern is similar to a Dalmatian dog! 🐕"
    },
    {
        name: "Paso Fino",
        image: "types_pic/Group_rare/PasoFino_Group_rare_pic .jpg",
        group: "rare",
        groupLabel: "Rare",
        color: "#d35400",
        speed: "48 km/h",
        height: "135–152 cm",
        horseColor: "All colors",
        temperament: "Spirited, Smooth",
        description: "A Latin American breed known for its incredibly smooth natural gait. The rider barely moves while the horse travels at speed.",
        funFact: "Its gait is so smooth you can hold a full glass of water while riding! 💧"
    }
];


// ===============================
// מצב כללי
// ===============================
let favoritesList = [];
let horseCards = [];
let heroIndex = 0;

// ===============================
// אלמנטים מה־DOM
// ===============================
const searchInput = document.getElementById('searchInput');
const favoritesContainer = document.querySelector('.favorite-cards');
const otherContainer = document.querySelector('.other-cards');
const noResultsEl = document.querySelector('#noResults');
const heroContainer = document.querySelector(".hero-container");

// ===============================
// HERO - הצגת סוס
// ===============================
function setHero(horse) {
    document.getElementById("hero-name").textContent = horse.name;
    document.getElementById("hero-img").src = horse.image;

    document.getElementById("hero-stats").innerHTML = `
        <li><span class="stat-label">Speed:</span> ${horse.speed}</li>
        <li><span class="stat-label">Height:</span> ${horse.height}</li>
        <li><span class="stat-label">Temperament:</span> ${horse.temperament}</li>
        <li><span class="stat-label">Description:</span> ${horse.description}</li>
        <li><span class="stat-label">*Fun Fact:</span> ${horse.funFact}</li>
    `;
}

function getHeroList() {
    return horsesData.filter(h => favoritesList.includes(h.name));
}

function updateHero() {
    const heroList = getHeroList();

    if (!heroList.length) {
        document.getElementById("hero-name").textContent = "No Favorites Yet";
        document.getElementById("hero-img").src = "";
        document.getElementById("hero-stats").innerHTML = "<li>Add favorites to see them here</li>";
        return;
    }

    heroIndex = heroIndex % heroList.length;
    setHero(heroList[heroIndex]);
}

// ניווט ב־Hero בלחיצה ימין/שמאל
heroContainer.addEventListener("click", (e) => {
    const rect = heroContainer.getBoundingClientRect();
    const clickX = e.clientX - rect.left;

    const heroList = getHeroList();
    if (!heroList.length) return;

    if (clickX > rect.width / 2) {
        heroIndex = (heroIndex + 1) % heroList.length;
    } else {
        heroIndex = (heroIndex - 1 + heroList.length) % heroList.length;
    }

    setHero(heroList[heroIndex]);
});

// ===============================
// יצירת קלף סוס
// ===============================
function createHorseCard(horse) {
    const card = document.createElement("div");
    card.className = "horse-card";

    const inner = document.createElement("div");
    inner.className = "card-inner";

    inner.innerHTML = `
        <div class="card-front">
            ${horse.image
            ? `<img src="${horse.image}" class="horse-img">`
            : `<div class="horse-placeholder">🐎</div>`}

            <div class="horse-name">${horse.name}</div>

            <div class="group-badge" style="background:${horse.color}">
                ${horse.groupLabel}
            </div>

            <div class="favorite-btn ${favoritesList.includes(horse.name) ? "active" : ""}" 
                 data-horse="${horse.name}">
                ❤
            </div>
        </div>

        <div class="card-back" style="background:${horse.color}">
          <ul class="horse-stats">
    <li><span class="stat-label">Group:</span> ${horse.groupLabel}</li>
    <li><span class="stat-label">Maximum Speed:</span> ${horse.speed}</li>
    <li><span class="stat-label">Height:</span> ${horse.height}</li>
    <li><span class="stat-label">Color:</span> ${horse.horseColor}</li>
    <li><span class="stat-label">Temperament:</span> ${horse.temperament}</li>
    <li><span class="stat-label">Description:</span> ${horse.description}</li>
    <li><span class="stat-label">*Fun Fact:</span> ${horse.funFact}</li>
</ul>
        </div>
    `;

    inner.addEventListener("click", (e) => {
        if (e.target.classList.contains("favorite-btn")) return;
        inner.classList.toggle("flipped");
    });

    card.appendChild(inner);

    return card;
}
// ===============================
// טעינת מועדפים מהשרת
// ===============================
function loadFavorites() {
    fetch("TypesPage.aspx/GetFavorites", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: "{}"
    })
        .then(r => r.json())
        .then(data => {
            favoritesList = data.d || [];
            renderCards();
            updateHero();
        });
}

// ===============================
// Toggle מועדף
// ===============================
document.addEventListener("click", (e) => {
    if (!e.target.classList.contains("favorite-btn")) return;

    const horseName = e.target.dataset.horse;

    fetch("TypesPage.aspx/ToggleFavorite", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ horseName })
    })
        .then(r => r.json())
        .then(data => {
            const isFav = data.d;

            e.target.classList.toggle("active", isFav);

            if (isFav) {
                if (!favoritesList.includes(horseName)) {
                    favoritesList.push(horseName);
                }
            } else {
                favoritesList = favoritesList.filter(h => h !== horseName);
            }

            renderCards();
            updateHero();
        });
});

// ===============================
// רינדור קלפים
// ===============================
function renderCards() {
    favoritesContainer.innerHTML = "";
    otherContainer.innerHTML = "";

    horseCards = [];

    const favFragment = document.createDocumentFragment();
    const otherFragment = document.createDocumentFragment();

    horsesData.forEach(horse => {
        const card = createHorseCard(horse);
        horseCards.push(card);

        if (favoritesList.includes(horse.name)) {
            favFragment.appendChild(card);
        } else {
            otherFragment.appendChild(card);
        }
    });

    favoritesContainer.appendChild(favFragment);
    otherContainer.appendChild(otherFragment);
}

// ===============================
// חיפוש
// ===============================
searchInput.addEventListener("keydown", function (e) {
    if (e.key === "Enter") e.preventDefault();
});

function filterHorses() {
    const filter = searchInput.value.toLowerCase();

    let found = false;

    horseCards.forEach(card => {
        const name = card.querySelector(".horse-name").textContent.toLowerCase();
        const show = name.includes(filter);

        card.style.display = show ? "inline-block" : "none";

        if (show) found = true;
    });

    if (noResultsEl) {
        noResultsEl.style.display = found ? "none" : "block";
    }
}

searchInput.addEventListener("input", filterHorses);

// ===============================
// התחלה
// ===============================
loadFavorites();

