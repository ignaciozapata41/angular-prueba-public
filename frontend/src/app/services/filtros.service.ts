import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Relacion, FiltroAplicado } from '../interfaces/interfaces'
import { environment } from '../../environments/environment';
 

@Injectable({
  providedIn: 'root'
})
export class filtrosService {
  private url: string;
  private filtrosAplicados: FiltroAplicado[] = []; 

  constructor( private _http: HttpClient) { 
    this.url = environment.api_url;
  }

  getCategorias():Observable<any>{
    return this._http.get<Relacion>(this.url+`Categorias/`)
  }

  getMarcas():Observable<any>{
    return this._http.get<Relacion>(this.url+`Marcas/`)
  }

  addFiltro(item: any, tipo: string){
    if(this.filtrosAplicados.findIndex( filtro => filtro.id == item.id && filtro.tipo == item.tipo) == -1){
      this.filtrosAplicados.push({tipo: tipo, id: item.id, nombre: item.nombre})
    }
  }

  removeFiltro(id: Number, tipo: string){
    var indice = this.filtrosAplicados.findIndex(filtroid => filtroid.id == id && filtroid.tipo == tipo )
    this.filtrosAplicados.splice(indice,1);

  }

  getFiltros(tipo){
    var array: Number[] = []

    this.filtrosAplicados.forEach(item => {
      if(item.tipo == tipo)
        array.push(item.id)
    })
    return array
  }

  getFiltrosAplicados(){
    return this.filtrosAplicados;
  }

  getCantFiltros(){
    return this.filtrosAplicados.length
  }
}
