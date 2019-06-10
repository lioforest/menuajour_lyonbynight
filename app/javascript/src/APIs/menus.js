export const fetchMenus = async () => {
    // fetch the data
    const menusResponse = await fetch('', {
      // Header asking for json
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    });
    // parsong the json to get a JS object.
    const menusJSON = await menusResponse.json();
    // Delete the fact than menus are in "menus"
    return menusJSON.menus;
  };