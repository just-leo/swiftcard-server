'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return [
      queryInterface.addColumn('account', 'FirstName', {
        type: Sequelize.STRING
      }),
      queryInterface.addColumn('account', 'LastName', {
        type: Sequelize.STRING
      }),
      queryInterface.addColumn('account', 'Tel', {
        type: Sequelize.STRING
      }),
      queryInterface.addColumn('account', 'deletedAt', {
        type: Sequelize.DATE
      })
    ];
  },

  down: (queryInterface, Sequelize) => {
    return [
      queryInterface.removeColumn('account', 'FirstName'),
      queryInterface.removeColumn('account', 'LastName'),
      queryInterface.removeColumn('account', 'Tel'),
      queryInterface.removeColumn('account', 'deletedAt'),
    ];
  }
};
