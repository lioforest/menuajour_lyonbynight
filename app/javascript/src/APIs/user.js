export const fetchUser = async () => {
  // fetch the data
  const userResponse = await fetch('', {
    // Header asking for json
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  });
  // parsong the json to get a JS object.
  const userJSON = await userResponse.json();
  // Delete the fact than menus are in "user"
  return userJSON.user;
};