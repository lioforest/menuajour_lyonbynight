import React from "react"

import NewItem from "./NewItem"
import Item from "./Item"
import ItemTableHeader from "./ItemTableHeader"

const ItemManagement = function({objects}) {
    return (
        <section>
            <NewItem />
            <table className="entityManager">
                <thead><ItemTableHeader /></thead>
                <tfoot><ItemTableHeader /></tfoot>
                <tbody>
                {
                    objects
                        .sort((a, b) =>
                            (a.name.toUpperCase() < b.name.toUpperCase())? -1 : 1 )
                        .map(
                            object => <Item key={object.id} item={object} />
                        )
                }
                </tbody>
            </table>
        </section>
    )
}

export default ItemManagement