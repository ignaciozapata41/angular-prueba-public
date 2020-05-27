import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Relacion } from '../interfaces/interfaces';

@Injectable({
  providedIn: 'root'
})
export class RelacionesService {
  estados: Relacion[] = [];
  categorias: Relacion[] = [];
  marcas: Relacion[] = [];
  lineas: Relacion[] = [];
  tipoFabricacion: Relacion[] = [];
  proveedores: Relacion[];


  constructor(private _http: HttpClient) { 
    this.getRelaciones('estados');
    this.getRelaciones('categorias');
    this.getRelaciones('marcas');
    this.getRelaciones('lineas');
    this.getRelaciones('fabricacion');
    this.getRelaciones('proveedores');
  }

  getRelaciones(tipo: string){
    this._http.get<Relacion[]>(environment.api_url+`relaciones/${tipo}`).subscribe( 
      response =>{
        if(response.length > 0){
          switch (tipo){
            case 'estados':
              this.estados = response;
              break;
            case 'categorias':
              response.forEach( cat => {
                this.categorias.push({id: cat.id, nombre: cat.nombre, disable: cat.disable, selected: false})
              });
              break;
            case 'marcas':
              response.forEach( marca => {
                this.marcas.push({id: marca.id, nombre: marca.nombre, disable: marca.disable, selected: false})
              });
              break;
            case 'lineas':
              this.lineas = response;
              break;
            case 'fabricacion':
              this.tipoFabricacion = response;
              break;
            case 'proveedores':
              this.proveedores = response;
              break;
          }
        }else{
          console.log(`No se han encontrado .${tipo}`)
        }
      },
      error => {
        if(error.status == 404){
          console.log(`No se ha encontrado el recurso solicitado para "${tipo}"`)
        }
      })
  }

  // Funcion que retorna el nombre de una relacion, utilizando los ids que provienen de un producto.
  getNombreRelacion(id: any,tipo: string){
    var item = eval('this.'+tipo).filter(data => data.id == id);
    if(item[0]){
      return item[0].nombre;
    }else{
      return '';
    }
  }

  getTipo(tipo: string){
    return eval('this.'+tipo);
  }
}
