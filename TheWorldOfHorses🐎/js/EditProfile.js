var UsernameFlag = false;
var newPassFlag = false;
var mailFlag = false;



function setError(div, msg) {
    div.style.fontSize = "14px";
    div.style.color = "red";
    div.innerHTML = msg;
}
function clearError(div) {
    div.innerHTML = "";
}

function checkUsername() {
    const Username = textBox_Username.value.trim();

    UsernameFlag = false;
    clearError(UsernameDiv);

    if (Username.length === 0) {
        UsernameFlag = true;
        return;
    }
    if (Username.length < 4) {
        setError(UsernameDiv, "Username must be at least 4 characters long.");
        return;
    }
    if (Username.length > 9) {
        setError(UsernameDiv, "Username must be at most 9 characters long.");
        return;
    }
    if (!/[A-Za-z]/.test(Username)) {
        setError(UsernameDiv, "Username must contain at least one letter.");
        return;
    }
    if (/[^a-zA-Z0-9_]/.test(Username)) {
        setError(UsernameDiv, "Username may only contain letters, numbers and _");
        return;
    }

    UsernameFlag = true;
}


function checkNewPass() {
    const pass = textBox_NewPass.value.trim();
    const letterCount = (pass.match(/[a-zA-Z]/g) || []).length;

    newPassFlag = false;
    clearError(newPassDiv);

    // אם ריק — לא חובה לשנות סיסמא
    if (pass.length === 0) {
        newPassFlag = true;
        return;
    }

    if (pass.length < 6) {
        setError(newPassDiv, "Password must be at least 6 characters long.");
        return;
    }
    if (pass.length > 9) {
        setError(newPassDiv, "Password must be at most 9 characters long.");
        return;
    }
    if (!/[0-9]/.test(pass)) {
        setError(newPassDiv, "Password must contain at least one number.");
        return;
    }
    if (letterCount < 3) {
        setError(newPassDiv, "Password must contain at least 3 letters.");
        return;
    }

    newPassFlag = true;
}


function checkMail() {
    const mail = textBox_Email.value.trim();

    mailFlag = false;
    clearError(emailDiv);

    if (mail.length === 0) {
        mailFlag = true;
        return;
    }
    if (!isValidEmail(mail)) {
        setError(emailDiv, "This email address is invalid");
        return;
    }

    mailFlag = true;
}
function isValidEmail(mail) {
    const atIndex = mail.indexOf("@");
    const lastAtIndex = mail.lastIndexOf("@");
    const dotIndex = mail.lastIndexOf(".");
    const domainLength = mail.length - dotIndex - 1;

    if (mail.length === 0) return false;
    if (atIndex < 1 || atIndex !== lastAtIndex) return false;
    if (dotIndex === -1 || dotIndex <= atIndex + 1) return false;
    if (dotIndex === mail.length - 1) return false;
    if (domainLength < 2) return false;

    return true;
}


function checkSave() {
    checkUsername();
    checkMail();
    checkNewPass();
    if (!UsernameFlag || !mailFlag || !newPassFlag) {
        return false; // עוצר את השמירה ומראה שגיאות
    }

    return true;
}


//picture choos
let cropper = null;

function openCropper(input) {
    if (!input.files || !input.files[0]) return;
    const reader = new FileReader();
    reader.onload = function (e) {
        const cropImage = document.getElementById("cropImage");
        cropImage.src = e.target.result;
        document.getElementById("cropModal").style.display = "block";
        if (cropper) cropper.destroy();
        cropper = new Cropper(cropImage, {
            aspectRatio: 1,
            viewMode: 1,
            dragMode: 'move',
            cropBoxResizable: false,
            cropBoxMovable: true,
            toggleDragModeOnDblclick: false,
        });
    };
    reader.readAsDataURL(input.files[0]);
}

function applyCrop() {
    if (!cropper) return;
    const canvas = cropper.getCroppedCanvas({ width: 200, height: 200 });
    const base64 = canvas.toDataURL("image/jpeg", 0.85);

    const preview = document.getElementById("avatarPreview");
    preview.innerHTML = "";
    preview.style.backgroundImage = `url(${base64})`;
    preview.style.backgroundSize = "cover";
    preview.style.backgroundPosition = "center";

    croppedImageData.value = base64;
    cancelCrop();
}

function cancelCrop() {
    document.getElementById("cropModal").style.display = "none";
    if (cropper) { cropper.destroy(); cropper = null; }
    document.getElementById("fileInput").value = "";
}