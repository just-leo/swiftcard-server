const router = require('koa-router')()
const controller = require('./controller')

router.get('/', async ctx => {
  ctx.body = await controller.read(ctx.request.query)
})

module.exports = router.routes()
