const User = require('./model')

exports.read = async () => {
  return User.findAll()
}

exports.create = async ({ data = {} } = {}) => {
  return User.create(data)
}
