const router = require('koa-router')()
const accounts = require('api/accounts/routes')
const finances = require('api/finances/routes')

router.get('/', ctx => {
  ctx.body = `Uptime ${process.uptime()}s`
})

router.use('/accounts', accounts)
router.use('/finances', finances)

module.exports = router
