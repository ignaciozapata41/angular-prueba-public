module.exports = (sequalize, type) => {
    return sequalize.define('proveedor',{
        id: {
            type : type.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        codigo:{
            type: type.STRING(256),
            unique: true,
            allowNull: false,
        },
        nombre: { 
            type: type.STRING(256),
            allowNull: true,
            unique: true
        },
        disable: {
            type: type.BOOLEAN,
            defaultValue: false,
        },
        createdAt: {
            type: type.DATE,
            defaultValue: type.literal('CURRENT_TIMESTAMP')
        },
        updatedAt: {
            type: type.DATE,
            defaultValue: type.literal('CURRENT_TIMESTAMP')
        }
    })
}