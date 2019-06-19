import React, {Component} from 'react'

import {fetchUser} from './APIs/user'

export default class App extends Component {
    constructor () {
        super()
        this.state = {
            //user is the user currently connected
            user: [],
            menus: [],
            categories: [],
            items: [],
            //aLaCarte are the menus displayed on the Menu Page
            aLaCarte: []
        }

        this.addToPage = this.addToPage.bind(this)
    }

    addToPage = async (menu) => {
        let {aLaCarte} = this.state
        aLaCarte = [...aLaCarte, menu]
        this.setState({aLaCarte: aLaCarte})
    }

    addMenu = function() {
        alert("Nouveau menu crée")
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
    };

    getCategory = (id) => {
        return this.getEntity(this.state.categories, id)
    }

    getItem = (id) => {
        return this.getEntity(this.state.items, id)
    }

    getEntity = (entitities, id) => {
        let searchedEntity = {}
        entitities.forEach(
            entity => {
                if (entity.id === id) {
                    searchedEntity = entity
                }
            }
        )

        return searchedEntity
    }

    render() {
        const {user,menus, categories, items} = this.state

        return (
            <div>
                <section>
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
                </section>
            </div>
        )
    }
}