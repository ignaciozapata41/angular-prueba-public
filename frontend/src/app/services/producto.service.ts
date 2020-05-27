import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Producto } from '../interfaces/interfaces';
import { filtrosService } from '../services/filtros.service'

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  productos: Producto[] = [];
  productos_populares: Producto[] = [];
  productosFiltrados: Producto[] = [];

  constructor(private _http: HttpClient, private _filtrosService: filtrosService) { 
    this.getProducto();
  }

  // Metodo que permite asignar un array con todos los productos que no tienen el estado en descontinuado.
  getProducto(){
    this._http.get<Producto[]>(environment.api_url+`productos`).subscribe(
      response => {
        if(response.length > 0){
          this.productos = response;
          this.productosFiltrados = response;
          this.getProductosPopulares();
        }else{
          console.log("no se han encontrado productos")
        }
      },
      error => {
        if(error.status == 404){
          console.log(`No se han encontrado productos`)
        }
      })
  }

  // Funcion que retorna un producto en especifico. filtrado por el sku.
  getProductoBySku(skuCode: string):Observable<any>{
    return this._http.get<Producto>(environment.api_url+`productos/${skuCode}`)
  }

  // Funcion que asigna el valor de la propiedad productos Filtrados, con los productos que tienen popularidad con el valor "1".
  getProductosPopulares(){
     this.productos_populares = this.productos.filter(producto => producto.popularidad == 1);
  }


  FiltrarProductos(texto?: string){
    if(texto){
        this.resetFiltros();
        this.productosFiltrados = this.productosFiltrados.filter(producto => producto.nombre.toLowerCase().match(texto.toLocaleLowerCase()));
    }else{
      if(this._filtrosService.getCantFiltros() == 0){
        this.productosFiltrados = this.productos;
      }else{
        this.productosFiltrados = []
        this.productos.forEach(producto => {
          var existe = false;
          this._filtrosService.getFiltros('categorias').forEach( cat => {
            if(cat == producto.fk_id_categoria){
              existe = true
            }
          })
          this._filtrosService.getFiltros('marcas').forEach( marca => {
            if(marca == producto.fk_id_marca){
              existe = true
            }
          })
          if(existe){
            this.productosFiltrados.push(producto)
          }
        })
      }
    }
    console.log(this.productosFiltrados)
  }

  resetFiltros(){
    this.productosFiltrados = this.productos;
  }
}
