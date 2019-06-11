import React, {Component} from 'react'
import PropTypes from 'prop-types'

import {fetchMenus} from './APIs/menus'
import PresetMenu from './Components/PresetMenu'
import MenuPage from './Components/MenuPage'
import '../../assets/stylesheets/PresetMenu.css'

export default class App extends Component {
    constructor () {
        super()
        this.state = {
            //menus are the menus owned by the customer
            menus: [],
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
        const menus = await fetchMenus();
        this.setState({
          menus,
        });
      };
    
    componentDidMount = async () => {
        await this.refreshMenus();
    };

    render() {
        const menus = this.state.menus.map((menu, index) =>
            <PresetMenu
                menu = {menu}
                key = {index}
                adding = {this.addToPage}
            />)
        const menuAlaCarte = this.state.aLaCarte

        return (
            <div>
                <section>
                        <h2 className = "text-center">Vos menus</h2>
                        <div
                            id="preset-menus"
                        >
                            {menus}
                            <i
                                className="fas fa-plus fa-4x"
                                title="Ajouter un menu"
                            >
                            </i>
                        </div>
                </section>
                <MenuPage menus = {menuAlaCarte} />
            </div>
        )
    }
}