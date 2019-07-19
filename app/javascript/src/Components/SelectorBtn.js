import React from "react"

const SelectorBtn = function({selector, text, id}) {
    return (
        <button
            type="button"
            onClick={selector}
            className={`btn btn-primary text-center mt-5 mb-2 ${id}`}
        >
            {text}
        </button>
    )
}

export default SelectorBtn

/*style:'min-width: 240px;'%>*/