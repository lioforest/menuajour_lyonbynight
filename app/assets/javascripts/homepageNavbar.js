function transparent() {
    const navbar = document.querySelector("nav.navbar")

    if (window.scrollY <= 100) {
        navbar.classList.add("transparent")
    } else {
        if (navbar.classList.contains("transparent")) {
            navbar.classList.remove("transparent")
        }
    }
}

if (/\//.test(window.location.pathname)) { alert("Will you work ?") }
/*    document.querySelector("main").classList.add("homepage");
    transparent();
    window.addEventListener("scroll", () => transparent()); */