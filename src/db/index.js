const Sequelize = require('sequelize');
const config = require('config');

const sequelize = new Sequelize(config.get('db.database'), config.get('db.username'), config.get('db.password'), {
  host: config.get('db.host'),
  dialect: 'mysql',
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  },
  define: {
    timestamps: true // true by default
  }
});

exports.connect = () => {
  return sequelize.authenticate()
}

exports.db = sequelize;
