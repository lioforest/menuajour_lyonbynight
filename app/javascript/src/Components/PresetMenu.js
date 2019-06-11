import React from 'react'
import PropTypes from 'prop-types'
import '../../../assets/stylesheets/PresetMenu.css'

const PresetMenu = function({menu, adding, index = 0}){
    return (
        <div
            key = {index}
            className = "preset-menu"
        >
            <h3>{menu.name}</h3>
            <p>
                <strong>{menu.title}</strong><br/>
                <small>{menu.subtitle}</small>
            </p>
            <ul>
                { menu.menu_categories.map(
                    (menu_category) => {
                        {console.log("menu-category",menu_category)}
                       {console.log("category-type", menu_category.category_type)}
                        {console.log("menu-item", menu_category.menu_items[0])}
                        return (
                            <li key={menu_category.category_type.id}>
                                {menu_category.category_type.name}
                                {/*<ul>
                                    {menu_category.category_type.items.map(
                                        (item) => console.log(item)
                                    )}
                                </ul>*/}
                            </li>
                        )
                    }
                )}
            </ul>
            <p>
                <a onClick={() => adding(menu)}>
                    <i
                        className = "fas fa-plus fa-2x"
                        title= "Ajouter à la carte"
                    ></i>
                </a>
            </p>
        </div>
    )
}

PresetMenu.defaultTypes = {
    menu: {
        name: "Menu",
        title: "Menu title",
        subtitle: "Menu subtitle"
    },
    adding: () => {}
}

PresetMenu.propTypes = {
    index: PropTypes.number,
    menu: PropTypes.object,
    adding: PropTypes.func
}

export default PresetMenu