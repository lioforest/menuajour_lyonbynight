import React from 'react'
import PropTypes from 'prop-types'
import '../../../assets/stylesheets/PresetMenu.css'

const PresetMenu = function({menu, index = 0}){
    return (
        <div
            key = {index}
            className = "preset-menu"
        >
            <h3>{menu.name}</h3>
            <p>
                {menu.title}<br/>
                <small>{menu.subtitle}</small>
            </p>
        </div>
    )
}

PresetMenu.defaultTypes = {
    menu: {
        name: "Menu",
        title: "Menu title",
        subtitle: "Menu subtitle"
    }
}

PresetMenu.propTypes = {
    index: PropTypes.number,
    menu: PropTypes.object
}

export default PresetMenu