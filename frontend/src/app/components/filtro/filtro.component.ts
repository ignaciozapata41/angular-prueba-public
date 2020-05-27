import { Component, OnInit, Input, OnChanges, Output, OnDestroy} from '@angular/core';
import { EventEmitter } from '@angular/core';
import { filtrosService } from '../../services/filtros.service'


@Component({
  selector: 'app-filtro',
  templateUrl: './filtro.component.html',
  styleUrls: ['./filtro.component.scss'],
})
export class FiltroComponent implements OnInit {
  @Input() data: any[];
  @Input() tipo: string;
  @Output() filtrarDatos = new EventEmitter();
  mostrarNumeros: boolean = true;


  constructor(public _listFiltrosService: filtrosService) { }

  ngOnInit() {
    
  }

  ngOnChanges(changes){

  }

  // FUNCION EJECUTADA CADA VES QUE SE SELECCIONA UN ITEM EN LOS FILTROS. EMITIENDO UN EVENTO PARA ACTUALIZAR LOS PINES.
  itemClicked(item){
    if(item.id != 0){
      if(item.selected == true){
        this._listFiltrosService.addFiltro(item, this.tipo)
      }else{
        this._listFiltrosService.removeFiltro(item.id, this.tipo)
      }
  
      this.filtrarDatos.emit(item);
    }
  }

  ngOnDestroy(){
    
  }
  

}