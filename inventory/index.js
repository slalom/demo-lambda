const search = require('./search.js');
const add = require('./add.js');

exports.searchInventory = async(event, context) => {
  const inventory = await search.search();
  console.log('Function Name: ', context.functionName);
  return {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(inventory, null, 2),
  };
};

exports.addInventory = async(event, context) => {
  const hostname = event.headers.Host;
  const path = event.requestContext.path;

  let inventory = JSON.parse(event.body);
  console.log('Function Name: ', context.functionName);

  await add.add(inventory);
  return {
    statusCode: 201,
    headers: {
      Location: `https://${hostname}${path}/${inventory.id}`,
    },
  };
};
