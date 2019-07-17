import React from "react"

const ItemTableHeader = function (props) {
    return (
        <tr className="entity">
            <th className="majorCol">Nom</th>
            <th className="majorCol">Description</th>
            <th className="minorCol">Prix</th>
            <th className="minorCol"></th>
            <th className="minorCol"></th>
        </tr>
    )
}

export default ItemTableHeader