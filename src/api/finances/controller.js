const Finance = require('models').finance;

exports.read = async () => {
  return Finance.findAll({ limit: 100 })//  order: 'EventTime DESC',
}
