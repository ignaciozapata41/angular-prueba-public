const router = require('express').Router();
const { Categoria, Estado, Marca, Linea, Fabricacion, Proveedor } = require('../../dbConf/db')

router.get('/estados', async (req,res) => {
    const estados = await Estado.findAll({attributes: ['id', 'nombre','disable']});
    if(estados.length == 0) return res.status(404).send("No se han encontrado estados de productos.");

    return res.status(200).send(estados);
})

router.get('/categorias', async (req,res) => {
    const categorias = await Categoria.findAll({attributes: ['id', 'nombre','disable']});
    if(categorias.length == 0) return res.status(404).send("No se han encontrado categorias.");

    return res.status(200).send(categorias);
})

router.get('/marcas', async (req,res) => {
    const marcas = await Marca.findAll({attributes: ['id', 'nombre','disable']});
    if(marcas.length == 0) return res.status(404).send("No se han encontrado marcas.");

    return res.status(200).send(marcas);
})

router.get('/lineas', async (req,res) => {
    const lineas = await Linea.findAll({attributes: ['id', 'nombre','disable']});
    if(lineas.length == 0) return res.status(404).send("No se han encontrado lineas.");

    return res.status(200).send(lineas);
})

router.get('/fabricacion', async (req,res) => {
    const fabricacion = await Fabricacion.findAll({attributes: ['id', 'nombre','disable']});

    if(fabricacion.length == 0) return res.status(404).send("No se han encontrado tipos de fabricación.");

    return res.status(200).send(fabricacion);
})

router.get('/proveedores', async (req,res) => {
    const proveedores = await Proveedor.findAll({attributes: ['id', 'nombre','codigo','disable']});
    if(marcas.length == 0) return res.status(404).send("No se han encontrado proveedores.");

    return res.status(200).send(marcas);
})

module.exports = router;