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

//if (window.location.pathname === "/") {
    document.querySelector("main").classList.add("homepage")
    transparent()
    window.addEventListener("scroll", () => transparent())
//}