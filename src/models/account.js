'use strict';
module.exports = (sequelize, DataTypes) => {
  var Account = sequelize.define('account', {
    ID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    FirstName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    LastName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Tel: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    CardID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    LevelID: DataTypes.INTEGER,
    RegisterDate: DataTypes.INTEGER,
    Money: DataTypes.DECIMAL(7,2),
    Bonuses: DataTypes.DECIMAL(7,2),
    Tickets: DataTypes.INTEGER,
    ChargedTickets: DataTypes.INTEGER,
    SpendTickets: DataTypes.INTEGER,
    Spend: DataTypes.DECIMAL(7,2),
    SpendBonuses: DataTypes.DECIMAL(7,2),
    InPawn: DataTypes.FLOAT,
    Charged: DataTypes.DECIMAL(7,2),
    ChargedBonuses: DataTypes.DECIMAL(7,2),
    Blocked: DataTypes.TINYINT,
    // Timestamps
    deletedAt: DataTypes.DATE,
  }, {
    // don't forget to enable timestamps!
    timestamps: true,
    createdAt: 'RegisterDate',
    // I don't want updatedAt
    updatedAt: false,
    // Enable soft-delete (deletedAt)
    paranoid: true,
    // disable the modification of table names; By default, sequelize will automatically
    // transform all passed model names (first parameter of define) into plural.
    // if you don't want that, set the following
    freezeTableName: true,
    getterMethods: {
      FullName() {
        return (this.FirstName ? this.FirstName + ' ' + this.LastName : 'Иван Иванов' + this.ID)
      }
    },
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return Account;
};