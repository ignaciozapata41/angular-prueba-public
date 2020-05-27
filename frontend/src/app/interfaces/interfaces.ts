import { DecimalPipe } from '@angular/common'
import { Type } from '@angular/core'


export interface Relacion{
    id: Number,
    nombre: object,
    disable: boolean,
    selected: boolean,
    code?: string,
}

export interface Producto{
    sku: Number,
    nombre: string,
    unitid: string,
    precio_venta: Number,
    costo_financiero: Number,
    uen: string,
    precio_minimo: Number,
    descripcion: string,
    imagen_150: string,
    imagen_450: string,
    popularidad: Number,
    fk_id_linea: Number,
    fk_id_fabricacion: Number,
    fk_id_proveedor: Number,
    fk_id_marca: Number,
    fk_id_categoria: Number,
    createdAt: Date,
    updatedAt: Date,
    numero_parte: string,
}

export interface FiltroAplicado{
    tipo: string,
    id: any,
    nombre: string,
}

