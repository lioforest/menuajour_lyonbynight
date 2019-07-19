import React from "react"

import ItemTableHeader from "./ItemTableHeader";
import { create } from "domain";

const NewItem = function({createItem}) {
    return (
        <div className="jumbotron entity">
            <h4 className="form-label">Créer un nouvel item</h4>
            <form method="post" action="#">
                <table className="entityManager">
                    <thead><ItemTableHeader /></thead>
                    <tbody>
                        <tr className="entity">
                            <td className="majorCol">
                                <input type="text" placeholder="Ex : Salade Lyonnaise/Eau pétillante/Expresso..." name="name" tabIndex="1" required/>
                            </td>
                            <td className="majorCol">
                                <input type="text" placeholder="Description" name="description" tabIndex="2"/>
                            </td>
                            <td className="minorCol">
                                <input type="number" min="0" step=".01" placeholder="Ex : 5.55" required tabIndex="3" name="price" />
                            </td>
                            <td className="minorCol">
                                <button type="button" className="btn" tabIndex="4" onClick={ e => createItem(e)}>
                                    <i className="fas fa-plus fa-2x" title="Créer l'item"></i>
                                </button>
                            </td>
                            <td className="minorCol">
                                <button type="reset" className="btn">
                                    <i className="fas fa-times-circle fa-2x" title="Annuler les changements"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div id="log"></div>
            </form>
        </div>
    )
}
        {/*}
            <!--button add-->
            <div class="col-md-1 d-flex justify-content-end align-items-start">
            <%= button_tag type: "submit", class: "btn mt-5" do%>
            
            <%end%>
            </div>
        <% end %>
    </div>
</div>
{*/}

export default NewItem