const uuid = require('uuid/v4');

exports.search = async() => {
  return {
    id: uuid(),
  };
};
