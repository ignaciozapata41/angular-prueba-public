module.exports = (sequalize, type) => {
    var producto = sequalize.define('producto',{
        sku: {
            type : type.STRING,
            primaryKey: true,
        },
        nombre: { 
            type: type.STRING(200),
            allowNull: false,
            unique: true
        },
        unitid: type.STRING,
        precio_venta: type.INTEGER,
        costo_financiero: type.DECIMAL(10,1),
        uen: type.STRING,
        precio_minimo: type.INTEGER,
        numero_parte: type.STRING(100),
        descripcion: type.STRING(300), 
        imagen_150: type.STRING(256),
        imagen_450: type.STRING(256),
        popularidad: type.INTEGER,
        fk_id_estado: {
            type: type.BIGINT(),
            onDelete: 'CASCADE',
            references: {
                model: 'estados',
                key: 'id'
            }
        },
        fk_id_linea: {
            type: type.BIGINT(),
            onDelete: 'CASCADE',
            references: {
                model: 'lineas',
                key: 'id'
            }
        },
        fk_id_fabricacion: {
            type: type.INTEGER,
            onDelete: 'CASCADE',
            references: {
                model: 'tipo_fabricacions',
                key: 'id'
            }
        },
        fk_id_proveedor:{
            type: type.INTEGER,
            onDelete: 'CASCADE',
            references: {
                model: 'proveedors',
                key: 'id'
            }
        },
        fk_id_marca: {
            type: type.INTEGER,
            onDelete: 'CASCADE',
            references: {
                model: 'marcas',
                key: 'id'
            }
        },
        fk_id_categoria: {
            type: type.BIGINT(),
            onDelete: 'CASCADE',
            references: {
                model: 'categoria',
                key: 'id'
            }
        },
        createdAt: {
            type: type.DATE,
            defaultValue: type.literal('CURRENT_TIMESTAMP')
        },
        updatedAt: {
            type: type.DATE,
            defaultValue: type.literal('CURRENT_TIMESTAMP')
        }
    });

    producto.associate = function(models){
       
    };

    return producto;
}
