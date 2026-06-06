var passFlag = false;
var confirmFlag = false;

function setError(div, msg) {
    div.style.color = "red";
    div.style.fontSize = "14px";
    div.innerHTML = msg;
}
function clearError(div) {
    div.innerHTML = "";
}

function checkPass() {
    const pass = document.getElementById("newPass").value.trim();
    const passDiv = document.getElementById("passDiv");
    const letterCount = (pass.match(/[a-zA-Z]/g) || []).length;

    passFlag = false;
    clearError(passDiv);

    if (pass.length === 0) {
        setError(passDiv, "Field is required."); return;
    }
    if (pass.length < 6) {
        setError(passDiv, "At least 6 characters."); return;
    }
    if (pass.length > 9) {
        setError(passDiv, "At most 9 characters."); return;
    }
    if (!/[0-9]/.test(pass)) {
        setError(passDiv, "Must contain a number."); return;
    }

    if (letterCount < 3) {
        setError(passDiv, "Must contain at least 3 letters."); return;
    }

    passFlag = true;
}

function checkConfirm() {
    const pass = document.getElementById("newPass").value.trim();
    const confirm = document.getElementById("confirmPass").value.trim();
    const confirmDiv = document.getElementById("confirmDiv");

    confirmFlag = false;
    clearError(confirmDiv);

    if (confirm.length === 0) { setError(confirmDiv, "Field is required."); return; }
    if (pass !== confirm) { setError(confirmDiv, "Passwords do not match."); return; }

    confirmFlag = true;
}

function checkAll() {
    checkPass();
    checkConfirm();
    return passFlag && confirmFlag;
}
