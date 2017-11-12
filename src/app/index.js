const Koa = require('koa')
const router = require('routing')
const bodyparser = require('koa-bodyparser')
const logger = require('koa-morgan')
const responseTime = require('koa-response-time')
const health = require('koa-ping')
const database = require('models')
const config = require('config')

const app = new Koa()
app.use(responseTime())
app.use(health('/status'));
app.use(logger('combined'))
app.use(bodyparser())
app.use(router.routes())
app.use((ctx) => { ctx.type = 'json' })

exports.start = async () => {
  try {
    await database.connect()
    console.log('Connected to database')
    const { port } = config.app;
    await app.listen(port)
    console.log(`Connected on port: ${port}`)
  } catch (error) {
    console.log('Something went wrong', error)
  }
}
