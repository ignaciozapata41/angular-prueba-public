const Sequelize = require('sequelize');
const estadoModel = require('../models/estados');
const categoriaModel = require('../models/categoria');
const marcaModel = require('../models/marcas');
const lineaModel = require('../models/lineas');
const tipo_fabricacionModel = require('../models/tipo_fabricacion')
const proveedorModel = require('../models/proveedor');
const productosModel = require('../models/productos');

const sequelize =  new Sequelize(
    'bd_productos',
    '######',
    '######',
    {
        host: '######',
        port: '5439',
        dialect: 'postgres',
        freezeTableName: true
    }
);

const Estado = estadoModel(sequelize, Sequelize);
const Categoria = categoriaModel(sequelize, Sequelize);
const Marca = marcaModel(sequelize, Sequelize);
const Linea = lineaModel(sequelize, Sequelize);
const Fabricacion = tipo_fabricacionModel(sequelize, Sequelize);
const Proveedor = proveedorModel(sequelize, Sequelize);
const Producto = productosModel(sequelize, Sequelize);

/* sequelize.sync({force: false}).then( () =>{
    console.log("tablas sincronizadas");
}) */

module.exports = {
    Estado,
    Categoria,
    Marca,
    Linea,
    Fabricacion,
    Proveedor,
    Producto
}