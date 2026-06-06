var UsernameFlag = false;
var passwordFlag = false;

function setError(div, msg) {
    div.style.fontSize = "14px";
    div.style.color = "red";
    div.innerHTML = msg;
}
function clearError(div) {
    div.innerHTML = "";
}

function checkUsername() {
    const Username = document.getElementById("Username").value.trim();
    const UsernameDiv = document.getElementById("UsernameDiv");

    UsernameFlag = false;
    clearError(UsernameDiv);

    if (Username.length === 0) {
        setError(UsernameDiv, "Field is required.");
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
    //.test() returns true if there is a match, false otherwise;
    //it checks it on the username string;
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



function checkPassword() {
    const password = document.getElementById("password").value.trim();
    const PasswordDiv = document.getElementById("PasswordDiv");
    //g = global flag
    //[a-zA-Z]/g matches all letters in the password and returns them as an array;
    //match() returns the array of matches or null if there are no matches;
    const letterCount = (password.match(/[a-zA-Z]/g) || []).length;

    passwordFlag = false;
    clearError(PasswordDiv);

    if (password.length === 0) {
        setError(PasswordDiv, "Field is required.");
        return;
    }
    if (password.length < 6) {
        setError(PasswordDiv, "Password must be at least 6 characters long.");
        return;
    }
    if (password.length > 9) {
        setError(PasswordDiv, "Password must be at most 9 characters long.");
        return;
    }
    //.test() returns true if there is a match, false otherwise;
    //  it checks it on the password string;
    if (!/[0-9]/.test(password)) {
        setError(PasswordDiv, "Password must contain at least one number.");
        return;
    }
    if (letterCount < 3) {
        setError(PasswordDiv, "Password must contain at least 3 letters.");
        return;
    }

    passwordFlag = true;
}
function checkLogin() {
    checkPassword();
    checkUsername();

    return UsernameFlag && passwordFlag;
}


