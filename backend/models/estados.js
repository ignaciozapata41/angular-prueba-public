module.exports = (sequalize, type) => {
    return sequalize.define('estado',{
        id: {
            type : type.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        nombre: { 
            type: type.STRING(50),
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