'use strict';
module.exports = (sequelize, DataTypes) => {
  var finance = sequelize.define('finance', {
    ID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    ClassID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    EventTime: DataTypes.INTEGER,
    AccountantID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'account',
        key: 'ID',
        // deferrable: Sequelize.Deferrable.INITIALLY_IMMEDIATE
      },
    },
    ContractorID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'account',
        key: 'ID',
        // deferrable: Sequelize.Deferrable.INITIALLY_IMMEDIATE
      },
    },
    ObjectID: {
      type: DataTypes.INTEGER,
      // references: {
      //   model: 'object',
      //   key: 'ID',
      //   // deferrable: Sequelize.Deferrable.INITIALLY_IMMEDIATE
      // },
    },
    CashSum: DataTypes.DECIMAL(7,2),
    Comment: DataTypes.STRING,
    CancelAccountID: {
      type: DataTypes.INTEGER,
      references: {
        model: 'account',
        key: 'ID',
        // deferrable: Sequelize.Deferrable.INITIALLY_IMMEDIATE
      },
    },
    CancelTime: {
      type: DataTypes.INTEGER
    },
    Coins: {
      type: DataTypes.INTEGER
    }
  }, {
    // don't forget to enable timestamps!
    timestamps: true,
    createdAt: 'EventTime',
    // I don't want updatedAt
    updatedAt: false,
    deletedAt: false,
    // Disable soft-delete (deletedAt)
    paranoid: false,
    // disable the modification of table names; By default, sequelize will automatically
    // transform all passed model names (first parameter of define) into plural.
    // if you don't want that, set the following
    // freezeTableName: true,
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return finance;
};