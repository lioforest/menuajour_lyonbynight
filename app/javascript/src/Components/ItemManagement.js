import React from "react"

const ItemManagement = function({objects}) {
    return (
        <section>
            {objects.map(
                object => <p key={object.id}>{object.name}</p>
            )}
        </section>
    )
}

export default ItemManagement