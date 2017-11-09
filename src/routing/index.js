const router = require('koa-router')()
const users = require('api/users/routes')

router.get('/', ctx => {
  ctx.body = `Uptime ${process.uptime()}s`
})

router.use('/users', users)

module.exports = router
