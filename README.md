## Getting Started


### Prerequisites


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

## Testing
### Running Unit Tests

The angular-seed app comes preconfigured with unit tests. These are written in
[Jasmine][jasmine], which we run with the [Karma Test Runner][karma]. We provide a Karma
configuration file to run them.

* the configuration is found at `karma.conf.js`
* the unit tests are found next to the code they are testing and are named as `..._test.js`.

The easiest way to run the unit tests is to use the supplied npm script:

```
npm test
```

## Links