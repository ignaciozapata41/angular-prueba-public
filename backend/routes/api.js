const router = require('express').Router();

const apiProductosRouter = require('./api/productos');
const apiRelacionesRouter = require('./api/relaciones');

router.use('/productos', apiProductosRouter )
router.use('/relaciones', apiRelacionesRouter )

module.exports = router;