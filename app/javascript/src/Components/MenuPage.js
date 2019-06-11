import React from 'react'

const MenuPage = function({menus}) {
    return (
        <section className = "section_menu" id="section_menu">
            <div className = "container">
                <div className = "row">
                    <div className = "col-md-12 menu_show">
                        {menus.map((menu) => menu.title)}
                    </div>
                </div>   
            </div>
        </section>
    )
}

export default MenuPage