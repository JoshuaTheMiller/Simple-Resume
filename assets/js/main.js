// The footer year is written at build time; this keeps it current if the site
// has not been rebuilt since the year turned over.
function updateDate() {
    const dateElement = document.getElementById("date");
    const currentYear = String(new Date().getFullYear());
    if (dateElement && dateElement.textContent !== currentYear) {
        dateElement.textContent = currentYear;
    }
}

function wirePrintButton() {
    const button = document.querySelector(".print-button");
    if (button) {
        button.addEventListener("click", function () { window.print(); });
    }
}

function onLoad() {
    updateDate();
    wirePrintButton();
    console.log("If you like Simple-Resume, consider supporting it! (https://joshuamiller.net)")
}

window.onload = onLoad;
