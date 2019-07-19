import React from "react"

import SelectorBtn from "./SelectorBtn"

const TypeSelector = function({buttons}) {
    return (
        <nav className="SelectorNav d-flex align-items-center justify-content-around">
            {buttons.map(
                (button, index) =>
                <SelectorBtn
                    key = {index}
                    selector = {button.selector}
                    text = {button.text}
                    id = {button.id}
                />
            )}
        </nav>
    )
}

export default TypeSelector