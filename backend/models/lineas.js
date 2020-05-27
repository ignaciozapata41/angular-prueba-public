module.exports = (sequalize, type) => {
    return sequalize.define('linea',{
        id: {
            type : type.BIGINT(),
            primaryKey: true,
        },
        nombre: { 
            type: type.STRING(100),
            allowNull: false,
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