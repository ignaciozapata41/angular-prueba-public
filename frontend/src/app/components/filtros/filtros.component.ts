import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { NavParams, PopoverController  } from '@ionic/angular';
import { Producto, Relacion, FiltroAplicado} from '../../interfaces/interfaces'
import { filtrosService } from '../../services/filtros.service';
import { RelacionesService } from '../../services/relaciones.service'

@Component({
  selector: 'app-filtros',
  templateUrl: './filtros.component.html',
  styleUrls: ['./filtros.component.scss'],
})
export class FiltrosComponent implements OnInit {
  
  categorias: Relacion[] = [];
  marcas: Relacion[] = [];
  data: Relacion[] = [];
  labelHeader: string = 'Filtrar Por:';
  tipo: string = '';
  filtros: Array<object> = [{nombre: 'categorias'}, {nombre: 'marcas'}];
  _anEmitter: EventEmitter< any >;
  filtrosAplicados: FiltroAplicado[] = [];

  constructor(  public navParams:NavParams,
                public PopoverController: PopoverController,
                public _listFiltrosService: filtrosService,
              ) 
  { 
    this._anEmitter = this.navParams.get('theEmitter'); 
    this.categorias = this.navParams.get('categorias');
    this.marcas = this.navParams.get('marcas');
  }

  ngOnInit(){
    this.filtrosAplicados = this._listFiltrosService.getFiltrosAplicados();
  }

  MostrarFiltro(tipo: string){
    this.data =  eval('this.'+tipo);
    this.tipo = tipo;
  }

  // METODO UTILIZADO PARA OCULTAR SUBMENOS DE FILTROS Y VOLVER A LA LISTA PRINCIPAL DE FILTROS.
  listaFiltros(){
    this.tipo = '';
  }

  // EJECUTA EL EVENTO QUE HACE QUE SE FILTREN LOS PINES DENTRO DEL MAPBOX Y ACTUALIZA LA LISTA DE FILTROS APLICADOS.
  EjecutarFiltro(){
    this.filtrosAplicados = this._listFiltrosService.getFiltrosAplicados();
    this._anEmitter.emit( );
  }

  // METODO UTILIZADO PARA QUITAR FILTRO DESDE LA LISTA DE FILTROS APLICADOS.
  quitarFiltroAplicado(id, tipo){
    if(id != 0){
      this._listFiltrosService.removeFiltro(id, tipo); 
      eval("this."+tipo+".find( item => item.id =="+id+")").selected = false;
      this._anEmitter.emit( );
    }
  }
 
}
