function winFix() {
    if (/^Win/.test(navigator.platform)) {
        document.querySelectorAll(".creation-subsection")
            .forEach((div) => div.style.width = "99vw")
    }
}

document.querySelector("body").onload = winFix()