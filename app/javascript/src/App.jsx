import React, {Component} from 'react'
import PropTypes from 'prop-types'

import {fetchMenus} from './APIs/menus'
import PresetMenu from './Components/PresetMenu'
import '../../assets/stylesheets/PresetMenu.css'

export default class App extends Component {
    constructor () {
        super()
        this.state = {
            menus: []
        }
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
                index = {index}
            />)

        return (
            <section>
                    <h2 className = "text-center">Vos menus</h2>
                    <div
                        id="preset-menus"
                    >
                        {menus}
                    </div>
            </section>
        )
    }
}