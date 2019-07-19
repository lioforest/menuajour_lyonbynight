import React from "react"

import NewItem from "./NewItem"
import Item from "./Item"
import ItemTableHeader from "./ItemTableHeader"

const ItemManagement = function({objects, createItem, editItem, deleteItem}) {
    return (
        <section>
            <NewItem createItem={createItem}/>
            <table className="entityManager">
                <thead><ItemTableHeader /></thead>
                <tfoot><ItemTableHeader /></tfoot>
                <tbody>
                {
                    objects
                        .sort((a, b) =>
                            (a.name.toUpperCase() < b.name.toUpperCase())? -1 : 1 )
                        .map(
                            object => <Item
                                key={object.id}
                                item={object}
                                editItem={editItem}
                                deleteItem={ deleteItem }
                            />
                        )
                }
                </tbody>
            </table>
        </section>
    )
}

export default ItemManagement