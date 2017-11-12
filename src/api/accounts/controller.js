const Account = require('models').account;

exports.read = async () => {
  return Account.findAll()
}

exports.create = async ({ data = {} } = {}) => {
  return Account.create(data)
}
