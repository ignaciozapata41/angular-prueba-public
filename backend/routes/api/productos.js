const router = require('express').Router();
const { Producto } = require('../../dbConf/db')
const { Op } = require("sequelize");

router.get('/', async (req,res) => {
    const productos = await Producto.findAll({attributes: [
        'sku', 
        'nombre',
        'popularidad',
        'imagen_150',
        'imagen_450',
        'fk_id_estado',
        'fk_id_categoria',
        'fk_id_marca',
        'fk_id_proveedor',
        'fk_id_fabricacion',
        'precio_venta',
    ],
        where: {[Op.not]:[{ fk_id_estado: 2}]}
    });
    if(res.status(200)){
        if(productos.length == 0) return res.status(404).send("Productos no encontrados.");

        return res.status(200).send(productos);
    }
})

router.get('/:skuCode', async (req,res) => {
    console.log(req.params.skuCode);
    const productos = await Producto.findAll( { 
        where: {
            sku: req.params.skuCode
        }
    });
    if(productos.length == 0) return res.status(404).send("Producto no encontrado.");

    return res.status(200).send(productos);
})

module.exports = router;