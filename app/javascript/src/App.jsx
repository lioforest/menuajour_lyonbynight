import React, {Component} from 'react'

import {fetchUser} from './APIs/user'

import TypeSelector from './Components/TypeSelector'
import ItemManagement from './Components/ItemManagement'
import CategoryManagement from './Components/CategoryManagement'
import MenuManagement from './Components/MenuManagement'

export default class App extends Component {
    constructor () {
        super()
        this.state = {
            //user is the user currently connected
            user: [],
            menus: [],
            categories: [],
            items: [],
            currentPage: "item",
            //aLaCarte are the menus displayed on the Menu Page
            aLaCarte: [],
        }

        this.setPage = this.setPage.bind(this)
        this.toItemPage = this.toItemPage.bind(this)
        this.toCategoryPage = this.toCategoryPage.bind(this)
        this.toMenuPage = this.toMenuPage.bind(this)
        this.createItem = this.createItem.bind(this)
        this.editItem = this.editItem.bind(this)
        this.updateItem = this.updateItem.bind(this)
        this.deleteItem = this.deleteItem.bind(this)
        this.popupBtn = this.popupBtn.bind(this)
        //this.addToPage = this.addToPage.bind(this)
        this.getEntity = this.getEntity.bind(this)
        this.getItem = this.getItem.bind(this)
    }

    //Functions to select the displayed page
    setPage = function(target) {
        this.setState({currentPage: target})
        this.setActiveBtn(`${target}Btn`)
    }

    toItemPage = function() {
        this.setPage("item")
    }

    toCategoryPage = function() {
        this.setPage("category")
    }

    toMenuPage = function() {
        this.setPage("menu")
    }

    setActiveBtn = function(id) {
        document.querySelectorAll(`.SelectorNav button:not(.${id})`).forEach(
            button => button.classList.remove("activeZone")
        )
        document.querySelectorAll(`.SelectorNav button.${id}`)
            .forEach( btn => btn.classList.add("activeZone"))

    }

    /*addToPage = async (menu) => {
        let {aLaCarte} = this.state
        aLaCarte = [...aLaCarte, menu]
        this.setState({aLaCarte: aLaCarte})
    }

    addMenu = function() {
        alert("Nouveau menu crée")
    }*/

    createFade = function() {
        const fade = document.createElement("div")
        
        fade.classList.add("popup-fade")

        document.body.classList.add("no-scroll")
        document.body.appendChild(fade)
        return fade
    }

    closePopup = function(e) {
        e.preventDefault()
        document.body.removeChild(document.querySelector("div.popup-fade"))
        document.body.classList.remove("no-scroll")
    }

    createItem= function(e) {
        const formRow = e.target.parentNode.parentNode.parentNode
        const cells = formRow.cells
        const log = document.getElementById("log")
        log.innerText = ""

        if (formRow.parentNode.parentNode.parentNode.checkValidity()) { 
            [...cells].forEach(cell => cell.childNodes[0].classList.remove("invalid")) 
            const datas = [...cells].map(cell => cell.childNodes[0].value)
            const {user, items} = this.state

            const newItem = {
                name: datas[0],
                description: datas[1],
                price: datas[2],
                user: {
                    email: user.email,
                    first_name: user.first_name,
                    id: user.id,
                    last_name: user.last_name
                },
                id: `local${Math.floor(Math.random()*1000)}`
            }

            items.push(newItem)
            user.items = items
            this.setState({user, items})

            document.querySelector("tr.entity td.minorCol button.btn[type=reset]").click()

            log.style.display = "none"
        } else {
            [...cells].forEach(cell => {
                if (!cell.childNodes[0].checkValidity()) {
                    cell.childNodes[0].classList.add("invalid")
                } else {
                    cell.childNodes[0].classList.remove("invalid")
                }
            })

            log.style.display = "flex"
            log.innerText = "Certains champs sont invalides"
        }
    }

    updateItem = function(e) {
        this.closePopup(e)
        const {items, user} = this.state
        const newData = e.target.parentNode.parentNode
        const registredItem = this.getItem(newData[3].value)
        const oldData = registredItem.entity
        
        oldData.name = newData[0].value
        oldData.description = newData[1].value
        oldData.price = newData[2].value
        
        items[registredItem.index] = oldData
        user.items = items
        this.setState({ items, user })
    }

    deleteItem = function(object) {
        if (confirm(`Voulez-vous vraiment supprimer "${object.name}" ?\n(Cette operation est irreversible.)`)) {
            const {items, user} = this.state
            const newList = items.filter(item => item.id !== object.id)
            
            user.items = newList
            this.setState({user, items: newList})
        }
    }

    popupBtn = function() {
        const buttons = [
            {
                text: "Mettre à jour",
                onClick: (e) => this.updateItem(e)
            },
            {
                text: "Annuler",
                onClick: (e) => this.closePopup(e)
            }
        ]
        const div = document.createElement("div")
        div.classList.add("popup-buttons")

        buttons.forEach(button => {
            const element = document.createElement("button")
            element.innerText = button.text
            element.onclick = button.onClick
            element.classList.add("btn", "btn-outline-info")

            div.appendChild(element)
        })

        return div
    }

    editItem = function(object) {
        const fade = this.createFade()
        const form = document.createElement("form")
        
        form.action = "#"
        form.method = "post"
        form.classList.add("popup")

        const inputs = [
            {
                name: "name",
                label: "Nom",
                type: "text",
                required: true,
                focused: true
            },
            {
                name: "description",
                label: "Description",
                type: "text",
                required: false,
                focused: false
            },
            {
                name: "price",
                label: "Prix en €uros",
                type: "number",
                step: ".01",
                required: true,
                focused: false
            },
            {
                name: "id",
                label: "",
                type: "hidden",
                required: true,
                focused: false
            }
        ]

        inputs.forEach(input => {
            const div = document.createElement("div")
            div.style.width = "100%"

            if (input.label !== "") {
                const label = document.createElement("label")
                label.htmlFor = input.name
                label.innerText = input.label + " :"
                label.classList.add("popup-label")
                div.appendChild(label)
            }

            const field = document.createElement("input")
            field.type = input.type
            if (field.type === "number") { field.step = input.step }
            field.value = object[input.name]
            field.required = input.required
            field.name = input.name
            field.autofocus = input.focused 
            field.classList.add("popup-field")
            div.appendChild(field)

            form.appendChild(div)
        })

        form.appendChild(this.popupBtn())

        fade.appendChild(form)      
    }

    refreshMenus = async () => {
        const user = await fetchUser()
        const menus = user.menus
        const categories = user.category_types
        const items = user.item_types
        this.setState({ user, menus, categories, items });
    };
    
    componentDidMount = async () => {
        await this.refreshMenus();
        this.setActiveBtn(`${this.state.currentPage}Btn`)
    };

    /*getCategory = (id) => {
        return this.getEntity(this.state.categories, id)
    }*/

    getItem = function(id) {
        return this.getEntity(this.state.items, id)
    }

    getEntity = function(entitities, id) {
        let searchedEntity = {}
        entitities.forEach(
            (entity, index) => {
                if (entity.id == id) {
                    searchedEntity = {entity, index}
                }
            }
        )

        return searchedEntity
    }

    render() {
        const {menus, categories, items, currentPage} = this.state
        const buttons = [
            {
                text: "Mes plats",
                selector: this.toItemPage,
                id: "itemBtn" 
            },
            {
                text: "Mes catégories",
                selector: this.toCategoryPage,
                id: "categoryBtn"
            },
            {
                text: "Mes menus",
                selector: this.toMenuPage,
                id: "menuBtn"
            },
        ]
        
        let mainZone = <section></section>
        switch(currentPage) {
            case "item":
                mainZone = <ItemManagement
                    objects={items}
                    createItem={this.createItem}
                    editItem={this.editItem}
                    deleteItem={this.deleteItem} />
                break
            case "category":
                mainZone = <CategoryManagement objects={categories} sub={items} />
                break
            case "menu":
                mainZone = <MenuManagement objects={menus} sub={categories} />
                break
        }

        return (
            <div>
                <TypeSelector buttons={buttons} />
                {mainZone}
                <TypeSelector buttons={buttons} />
                {/*<section>
                        <h2 className = "text-center">
                            {user.first_name + " " + user.last_name}
                        </h2>
                        <div className="d-flex justify-content-between">
                            <div>
                                <h3>Menus&nbsp;:</h3>
                                <ul>
                                {menus.map(
                                    (menu, index) =>
                                    <li key={index}>
                                        {menu.title}
                                        <ul>
                                            {menu.menu_categories.map(
                                                (category_type, index) =>
                                                {
                                                    const category = this.getCategory(
                                                        category_type.id
                                                    )

                                                    return (
                                                        <li key={index}>
                                                            {category.name}
                                                            <ul>
                                                                {category.item_types.map(
                                                                    (item_type, index) =>
                                                                    {
                                                                        const item = this.getItem(item_type.id)

                                                                        return (
                                                                            <li key="index">
                                                                                {item.name}
                                                                            </li>
                                                                        )
                                                                    }
                                                                )}
                                                            </ul>
                                                        </li>)
                                                }
                                                
                                            )}
                                        </ul>
                                    </li>
                                )} 
                                </ul>
                            </div>
                            <div>
                                <h3>Catégories&nbsp;:</h3>
                                <ul>
                                {categories.map(
                                    (categorie, index) => 
                                        <li key={index}>
                                            {categorie.name}
                                            <ul>
                                                {categorie.item_types.map(
                                                    (item_type, index) =>
                                                    {
                                                        const item = this.getItem(item_type.id)

                                                        return (
                                                            <li>{item.name}</li>
                                                        )
                                                    }
                                                )}
                                            </ul>
                                        </li>
                                )} 
                                </ul>
                            </div>
                            <div>
                                <h3>Plats&nbsp;:</h3>
                                <ul>
                                {items.map(
                                    (item, index) =>
                                    <li key={index}>{item.name}</li>
                                )} 
                                </ul>
                            </div>
                        </div>
                </section>*/}
            </div>
        )
    }
}