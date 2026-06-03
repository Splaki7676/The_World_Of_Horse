

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