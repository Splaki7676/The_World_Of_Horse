var UsernameFlag = false;
var passwordFlag = false;
var password2Flag = false;
var mailFlag = false;
var genderFlag = false;
var birthdayFlag = false;
var checkBoxFlag = false;
var selectFlag = false;
let step1Progress = 0;
let step2Progress = 0;
let step3Progress = 0;



function setError(div, msg) {
    div.style.fontSize = "14px";
    div.style.color = "red";
    div.innerHTML = msg;
}
function clearError(div) {
    div.innerHTML = "";
}


// ===================== Step 1: Basic Info =====================
function checkUsername() {
    var Username = document.getElementById("Username").value.trim(); //אם יש רווח זה מסיר אותו <--trim()

    UsernameFlag = false; // מאפס כל פעם מחדש - מה אם משתמש מוחק
    clearError(UsernameDiv);

    // בדיקה: ריק
    if (Username.length === 0) {
        setError(UsernameDiv, "field is empty");

    }

    else if (!/^(?=.*[A-Za-z])[a-zA-Z0-9_]{4,9}$/.test(Username)) { // REGEX
        setError(UsernameDiv, "Username must be 4–9 characters long, contain at least one letter, and may include numbers and _"
        );
    }


    // אם הכל תקין
    else {
        UsernameFlag = true;
        clearError(UsernameDiv);
    }


    updateStep1Progress();

}

function checkPassword() {
    var password = document.getElementById("password").value.trim();
    var PasswordDiv = document.getElementById("PasswordDiv");

    passwordFlag = false;
    clearError(PasswordDiv)

    let letterCount = (password.match(/[a-zA-Z]/g) || []).length;


    // בדיקה: ריק
    if (password.length === 0) {
        setError(PasswordDiv, "field is empty")
    }

    // בדיקה: אורך
    else if (password.length < 6) {
        setError(PasswordDiv, "Password must be at least 6 characters long.")
    }

    // בדיקה: לפחות ספרה
    else if (!/[0-9]/.test(password)) {
        setError(PasswordDiv, "Password must contain at least one number.")

    }

    // בדיקה: לפחות אות קטנה
    else if (letterCount < 3) {
        setError(PasswordDiv, "Password must contain at least 3 letters (uppercase or lowercase).")
    }

    // אם הכל תקין
    else {
        passwordFlag = true;
        clearError(PasswordDiv)
    }

    updateStep1Progress();
}

function checkPassword2() {
    var password1 = document.getElementById("password").value.trim();
    var password2 = document.getElementById("password2").value.trim();
    var password2Div = document.getElementById("password2Div");

    password2Flag = false;
    clearError(password2Div);

    // אם המשתמש עוד לא התחיל להקליד בכלל — לא עושים כלום
    if (password1.length === 0 && password2.length === 0) {
        clearError(password2Div);
        updateStep1Progress();
        return;
    }

    // ❗ אם הסיסמה הראשונה לא תקינה — לא בודקים בכלל התאמה
    if (!passwordFlag) {
        setError(password2Div, "The first password is invalid");
        updateStep1Progress();
        return;
    }

    if (password2.length === 0 && password1.length > 0) {
        setError(password2Div, "Please confirm your password");
    }

    // בדיקה: לא תואם
    else if (password2 !== password1) {
        setError(password2Div, "Passwords do not match");
    }

    // תקין
    else {
        password2Flag = true;
        clearError(password2Div);
    }

    updateStep1Progress();

}

function updateStep1Progress() {
    let validCount = 0;

    if (UsernameFlag) validCount++;
    if (passwordFlag) validCount++;
    if (password2Flag) validCount++;

    const totalFields = 3;
    step1Progress = Math.round((validCount / totalFields) * 100);



    updateInnerProgress(1);
    updateV(1);
    updateCircle(1);
}

// ===================== Step 2: Contact Info =====================
function checkMail() {
    const mail = document.getElementById("mail").value.trim();
   
    mailFlag = false;
    clearError(mailDiv);

    // check for an empety mail
    if (mail.length == 0) {
        setError(mailDiv, "Email is required");
    }

    else if (!isValidEmail(mail)) {
        setError(mailDiv, "This email address is invalid");

    }

    else {
        clearError(mailDiv);
        mailFlag = true;
    }

    updateStep2Progress();

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

function checkGender() {
    const genderDiv = document.getElementById("genderDiv");

    genderFlag = false;
    clearError(genderDiv);

    if (!isGenderSelected()) {
        setError(genderDiv, "Please select one gender");
    } else {
        genderFlag = true;
        clearError(genderDiv);
    }

    updateStep2Progress();
}
function isGenderSelected() {
    const genders = document.querySelectorAll('input[name="gender"]');
    return Array.from(genders).some(g => g.checked);
}


function checkBirthday() {
    var birthdayDiv = document.getElementById("birthdayDiv");
    var dateValue = document.getElementById("date").value;

    clearError(birthdayDiv);
    birthdayFlag = false;

    if (dateValue === "") {
        setError(birthdayDiv, "enter birthday");

    }

    else {
        clearError(birthdayDiv);
        birthdayFlag = true;

    }


    updateStep2Progress();

}


function updateStep2Progress() {

    let validCount = 0;

    if (mailFlag) validCount++;
    if (genderFlag) validCount++;
    if (birthdayFlag) validCount++;

    const totalFields = 3;
    step2Progress = Math.round((validCount / totalFields) * 100);


    updateInnerProgress(2);
    updateV(2);
    updateCircle(2);
}

// ===================== Step 3: Preferences =====================
function checkCheckBox() {
    var checkBoxDiv = document.getElementById("checkBoxDiv");

    checkBoxFlag = false;
    clearError(checkBoxDiv);

    // שליפת הצ׳קבוקס
    var terms = document.getElementById("terms").checked;
    var newLover = document.getElementById("newLover").checked;
    var oldLover = document.getElementById("oldLover").checked;

    // בדיקה: חובה על תנאי שימוש
    if (!terms) {
        setError(checkBoxDiv, "You must agree to the Terms of Use!");
        checkBoxFlag = false;

    }

    // בדיקה: לא אפשרי לבחור גם חדש וגם ישן
    else if (newLover && oldLover) {
        setError(checkBoxDiv, "You cannot select both New Lover and Old Lover of horses!");
        checkBoxFlag = false;

    }

    // אם הכל תקין
    else {
        clearError(checkBoxDiv);
        checkBoxFlag = true;
    }

    updateStep3Progress();


}

function checkSelect() {
    var selectDiv = document.getElementById("selectDiv");

    selectFlag = false;
    clearError(selectDiv);

    if (document.getElementById("favoriteBreed").value == "") {
        setError(selectDiv, "Choose a favorite breed ");
        selectFlag = false;

    }
    else {
        clearError(selectDiv);
        selectFlag = true;
    }

    updateStep3Progress();
}

function updateStep3Progress() {
    let validCount = 0;

    if (checkBoxFlag) validCount++;
    if (selectFlag) validCount++;


    const totalFields = 2;
    step3Progress = Math.round((validCount / totalFields) * 100);

    updateInnerProgress(3);
    updateV(3);
    updateCircle(3);
}


// ------------------ Step Navigation משודרג ------------------

function updateV(stepNumber) {
    const steps = document.querySelectorAll(".step");

    // שלב 1
    if (stepNumber === 1) {
        setStep(steps[0], UsernameFlag && passwordFlag && password2Flag, "1");

    }

    // שלב 2
    if (stepNumber === 2) {
        setStep(steps[1], mailFlag && genderFlag && birthdayFlag, "2");

    }

    // שלב 3
    if (stepNumber === 3) {
        setStep(steps[2], checkBoxFlag && selectFlag, "3");

    }
}
function setStep(stepElement, isCompleted, numberIfFalse) {
    if (isCompleted) {
        stepElement.classList.add("completed");
        stepElement.innerHTML = "";
    } else {
        stepElement.classList.remove("completed");
        stepElement.innerHTML = numberIfFalse;
    }
}


function nextStep(currentStep) {
    // בדיקה לפי Flags לפני המעבר

    if (currentStep === 1 && !isStep1Valid())
        return;


    else if (currentStep === 2 && !isStep2Valid())
        return;

    else if (currentStep === 3 && !isStep3Valid())
        return;



    showStep(currentStep + 1);
} //1
function isStep1Valid() {
    checkUsername();
    checkPassword();
    checkPassword2();
    return UsernameFlag && passwordFlag && password2Flag;
}
function isStep2Valid() {
    checkMail();
    checkGender();
    checkBirthday();

    return mailFlag && genderFlag && birthdayFlag;
}
function isStep3Valid() {
    checkCheckBox();
    checkSelect();

    return checkBoxFlag && selectFlag;
}


function prevStep(currentStep) {
    if (currentStep <= 1)//כי אין שלב 0
        return;
    showStep(currentStep - 1);
} // 2

function showStep(stepNumber) {
    document.querySelectorAll(".form-step").forEach((step, index) => {
        step.style.display = index + 1 === stepNumber ? "flex" : "none";
        // // מציג רק את השלב המבוקש ומסתיר את כל השאר

    });
    updateCircle(stepNumber); // מעדכן עיגולים
    updateInnerProgress(stepNumber); // מעדכן קו התקדמות
} //3

function updateCircle(currentStep) {
    const steps = document.querySelectorAll(".step");

    steps.forEach((step, index) => {

        step.classList.remove("active");


        // אם השלב כבר הושלם (✔) — אל תיגע בו
        if (step.classList.contains("completed")) {
            return;
        }

        // השלב הנוכחי
        if (index + 1 === currentStep) {
            step.classList.add("active");
            step.style.transform = "scale(1.3)";
            step.innerHTML = index + 1;
            return;
        }

        // שלבים עתידיים בלבד
        if (index + 1 > currentStep) {
            step.innerHTML = index + 1;
        }

    });
} //4

function updateInnerProgress(currentStep) { // עדכון פנימי
    const progressLine = document.getElementById("progress-line");
    const stepRange = 50;

    // שלב 1: 0–33–66–100
    if (currentStep === 1) {
        progressLine.style.width = (step1Progress * stepRange / 100) + "%";
        return;
    }

    // שלב 2: 50–66–83–100
    if (currentStep === 2) {
        const percent = 50 + (step2Progress * stepRange / 100);
        progressLine.style.width = percent + "%";
        return;

    }

    // שלב 3 ומעלה = תמיד מלא
    progressLine.style.width = "100%";

} //5



/**
 * When the page loads, determines whether this is a fresh visit or a server-driven state.
 *
 * If no server flag (__startStep) exists, the page starts from step 1.
 * Otherwise, it continues from the step defined by the server (C# postback).
 */

// ------------------ אתחול ברגע טעינת הדף ------------------
document.addEventListener("DOMContentLoaded", () => {
    if (typeof __startStep === "undefined") {
        showStep(1);
    }
});






function checkRegister() {


    checkUsername();
    checkPassword();
    checkPassword2();
    checkMail();
    checkGender();
    checkBirthday();
    checkCheckBox();
    checkSelect();

    /*///////////////////בדיקה////////////////////
    
    console.log("Username:", document.getElementById("Username").value);
    console.log("Password:", document.getElementById("password").value);
    console.log("Confirm Password:", document.getElementById("password2").value);
    console.log("Email:", document.getElementById("mail").value);
    console.log("Gender:", document.querySelector('input[name="gender"]:checked')?.value);
    console.log("Birthday:", document.getElementById("date").value);
    console.log("Terms:", document.getElementById("terms").checked);
    console.log("New Lover:", document.getElementById("newLover").checked);
    console.log("Old Lover:", document.getElementById("oldLover").checked);
    console.log("Favorite Breed:", document.getElementById("favoriteBreed").value);
    
    */



    if (UsernameFlag && passwordFlag && password2Flag && mailFlag && genderFlag && birthdayFlag && checkBoxFlag && selectFlag) {
        return true;

    }
    return false;
}



