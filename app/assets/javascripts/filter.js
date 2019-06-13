function isEverythingSelected() {
    let allSelected = true
    document.querySelectorAll(".categoryElt").forEach(
        (category) => {
            if (category.classList.contains("hidden")) {
                allSelected = false
            }
        }
    )
    return allSelected
}

function isEverythingUnchecked() {
    let allUnchecked = true
    document.querySelectorAll(".categoryElt").forEach(
        (category) => {
            if (!category.classList.contains("hidden")) {
                allUnchecked = false
            }
        }
    )
    return allUnchecked
}

function selectedAll() {
    selectAll.checked = true
    filters.forEach((category) => {
        if (!category.checked){
            category.checked = true
        }
    })
    document.querySelectorAll(".categoryElt").forEach((category) => category.classList.remove("hidden"))
    selectNone.checked = false
}

function selectedNone() {
    selectNone.checked = true
    filters.forEach((category) => {
        if (category.checked){
            category.checked = false
        }
    })
    document.querySelectorAll(".categoryElt").forEach((category) => category.classList.add("hidden"))
    selectAll.checked = false
}

function toggleCategory(event) {
    const categoryElt = document.getElementById(event.target.value).parentNode
    categoryElt.classList.toggle("hidden")
    selectAll.checked = isEverythingSelected()
    selectNone.checked = isEverythingUnchecked()
}

const selectAll = document.querySelector(".filter input[value=all]")
const selectNone = document.querySelector(".filter input[value=none]")
const filters = document.querySelectorAll(".categoryFilter input[type=checkbox]")

filters.forEach(
    (category) => category.addEventListener("change", (e) => toggleCategory(e))
)

selectAll.addEventListener("change", () => selectedAll())
selectNone.addEventListener("change", () => selectedNone())