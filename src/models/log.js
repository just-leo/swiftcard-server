'use strict';
module.exports = (sequelize, DataTypes) => {
  var log = sequelize.define('log', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    level: DataTypes.STRING,
    category: DataTypes.STRING,
    prefix: DataTypes.TEXT,
    message: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    log_time: {
      type: DataTypes.INTEGER,
    },
  }, {
    timestamps: true,
    createdAt: false,
    updatedAt: false,
    deletedAt: false,
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return log;
};