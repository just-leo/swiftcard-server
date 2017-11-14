## Getting Started
### Install Dependencies

```
npm install
```

### Run the Application


```
npm start
```

Server listening at `http://localhost:3000`


## Directory Layout

```
src/                    --> all of the source files for the application
  app/                  --> koa app initialization 
  api/                  --> REST API resources
    users/                --> resourse /users
    .../
  config/               --> app configs, handles by npm-config 
  routing/              --> app routs configuration
  db/                   --> db connection establisment
```

## Models

You can simple generate new model using sequelize-cli

Use the next command to see help:

```node_modules/.bin/sequelize help model:generate```

Or real example (table `log`):

```node_modules/.bin/sequelize model:generate --name log --attributes level:string,category:string,prefix:text,message:text,log_time:integer```

## Links

http://docs.sequelizejs.com/manual/tutorial/models-definition.html

http://docs.sequelizejs.com/manual/tutorial/migrations.html