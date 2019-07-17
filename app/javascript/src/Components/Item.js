import React from "react"

const Item = function({item}) {
    return (
        <tr className="entity">
            <td><h3>{item.name}</h3></td>
            <td>{item.description}</td>
            <td>{item.price}&nbsp;€</td>
            <td>
                <button className="btn edit" type="submit">
                    <i className="fas fa-pencil-alt" data-toggle="tooltip" data-placement="top" title="Modifier l'item"></i>
                </button>
            </td>
            <td>
                <button className="btn delete" type="submit">
                    <i className="fas fa-trash-alt" data-toggle="tooltip" data-placement="top" title="Supprimer l'item"></i>
                </button>
            </td>
        </tr>
    )
}

export default Item