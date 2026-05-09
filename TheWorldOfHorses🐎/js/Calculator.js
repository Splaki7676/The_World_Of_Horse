
//const breedData = {
//    standard: { name: "Standard / Arabian", lifespan: 25, factor: 1.0 },
//    pony: { name: "Pony", lifespan: 30, factor: 0.85 },
//    draft: { name: "Draft horse", lifespan: 22, factor: 1.1 },
//    thoroughbred: { name: "Thoroughbred", lifespan: 23, factor: 1.05 }
//};

//function horseToHuman(years, months, breed) {
//    const t = years + months / 12;
//    const f = breedData[breed].factor;
//    let h = 0;
//    if (t <= 1) h = t * 6;
//    else if (t <= 2) h = 6 + (t - 1) * 4;
//    else if (t <= 4) h = 10 + (t - 2) * 3;
//    else h = 16 + (t - 4) * 2.5;
//    return Math.round(h * f);
//}

//function getStage(years) {
//    if (years < 1) return "🐣 Foal";
//    if (years < 4) return "🌱 Young";
//    if (years < 15) return "💪 Adult";
//    if (years < 20) return "🏅 Senior";
//    return "🌿 Geriatric";
//}

//function calculate() {
//    const years = parseFloat(document.getElementById('horseYears').value) || 0;
//    const months = parseFloat(document.getElementById('horseMonths').value) || 0;
//    const breed = document.getElementById('breedType').value;

//    if (years === 0 && months === 0) {
//        document.getElementById('horseYears').focus();
//        return;
//    }

//    const human = horseToHuman(years, months, breed);
//    const lifespan = breedData[breed].lifespan;
//    const percent = Math.min(Math.round((years + months / 12) / lifespan * 100), 100);

//    let horseLabel = years + (years === 1 ? " horse year" : " horse years");
//    if (months > 0) horseLabel += " and " + months + (months === 1 ? " month" : " months");

//    document.getElementById('humanAge').textContent = human;
//    document.getElementById('rHorseAge').textContent = horseLabel;
//    document.getElementById('rHumanDetail').textContent = human + " human years";
//    document.getElementById('rStage').textContent = getStage(years);
//    document.getElementById('rBreed').textContent = breedData[breed].name;
//    document.getElementById('rLifespan').textContent = lifespan + " horse years";
//    document.getElementById('rPercent').textContent = percent + "% of lifespan";

//    // show result with animation — only ONE click needed
//    document.getElementById('resultCard').classList.add('visible');
//}

//document.addEventListener('keydown', function (e) {
//    if (e.key === 'Enter') {
//        e.preventDefault();
//        calculate();
//    }
//});

var currentTab = sessionStorage.getItem('calcTab') || 'horse';
function switchTab(tab) {
    currentTab = tab;
    sessionStorage.setItem('calcTab', tab);  // ← הוסף את זה

    document.getElementById('labelYears').innerText =
        tab === 'horse' ? 'Horse years:' : 'Human years:';

    document.getElementById('breedRow').style.display =
        tab === 'horse' ? 'flex' : 'none';

    var tabs = document.querySelectorAll('.tab');
    tabs[0].classList.toggle('active', tab === 'horse');
    tabs[1].classList.toggle('active', tab === 'human');

    document.getElementById('resultNumber').innerText = '–';
    document.getElementById('resultUnit').innerText = '';
}
function calculate() {
    var years = parseFloat(document.getElementById('inputYears').value) || 0;
    var months = parseFloat(document.getElementById('inputMonths').value) || 0;
    var breed = document.getElementById('horseBreed').value;

    if (years === 0 && months === 0) {
        document.getElementById('resultNumber').innerText = '!';
        document.getElementById('resultUnit').innerText = 'Please enter an age';
        return;
    }

    var total = years + months / 12;
    var number, unit;

    if (currentTab === 'horse') {
        var factor = 1.0;
        if (breed === 'pony') factor = 0.85;
        else if (breed === 'draft') factor = 1.1;
        else if (breed === 'thoroughbred') factor = 1.05;

        var human;
        if (total <= 1) human = total * 6;
        else if (total <= 2) human = 6 + (total - 1) * 4;
        else if (total <= 4) human = 10 + (total - 2) * 3;
        else human = 16 + (total - 4) * 2.5;

        number = Math.round(human * factor);
        unit = 'human years';

    } else {
        var horse;
        if (total <= 6) horse = total / 6;
        else if (total <= 10) horse = 1 + (total - 6) / 4;
        else if (total <= 16) horse = 2 + (total - 10) / 3;
        else horse = 4 + (total - 16) / 2.5;

        number = Math.round(horse * 10) / 10;
        unit = 'horse years';
    }

    document.getElementById('resultNumber').innerText = number;
    document.getElementById('resultUnit').innerText = unit;
}
window.onload = function () {
    switchTab(currentTab);
};