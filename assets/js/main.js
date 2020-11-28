function updateDate() {
    const dateElement = document.getElementById("date");
    const currentYear = new Date().getFullYear();
    if (dateElement.textContent !== currentYear) {
        // There is most likely a far better way to do this.
        // Then again, this page contains almost no JS... so this may be fine 🤔
        // I also want this to stay constantly up to date...
        dateElement.textContent = currentYear;
    }
}

function onLoad() {
    updateDate();
    console.log("If you like Simple-Resume, consider supporting it! (https://joshuamiller.net)")
}

window.onload = onLoad;