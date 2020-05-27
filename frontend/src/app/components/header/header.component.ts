import { Component, OnInit, Input, EventEmitter} from '@angular/core';
import {  PopoverController } from '@ionic/angular';
import { FiltrosComponent } from '../../components/filtros/filtros.component'
import { RelacionesService } from '../../services/relaciones.service'
import { Relacion } from '../../interfaces/interfaces'
import { ProductoService } from '../../services/producto.service'
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  @Input() titulo: string;
  categorias: Relacion[] = this._RelacionesService.categorias;
  marcas: Relacion[] = this._RelacionesService.marcas;
 
  constructor(public PopoverController: PopoverController,
             public _RelacionesService: RelacionesService,
             public _ProductoService: ProductoService,
             public router: Router) { }

  ngOnInit(

  ) {}

  async presentPopover(ev: any) {
    let myEmitter = new EventEmitter< any >();
		  myEmitter.subscribe(
			  v=> this.FiltrarRecursos()
		  );

    const popover = await this.PopoverController.create({
      component: FiltrosComponent,
      componentProps: { 
                        categorias: this.categorias,
                        marcas: this.marcas,
                        theEmitter: myEmitter
                      },
      event: ev,
      animated: true,
      translucent: true,
      mode: 'ios',
    });
    await  popover.present();

    return popover.onDidDismiss().then(
      (data: any) => {
        if (data) {

          
        }
      });
  }

  // EJECUTA EL FILTRO DESDE LOS SERVICIOS, CUANDO SE EMITE EL EVENTO AL SELECCIONAR UN FILTRO.
  FiltrarRecursos(){
    this._ProductoService.FiltrarProductos();
  }

  getFiltros(){
    this.categorias = this._RelacionesService.categorias;
    this.marcas = this._RelacionesService.marcas;
  }

  BuscarProducto(event){
    if(event.target.value.length > 0){
      this._ProductoService.FiltrarProductos(event.target.value);
      this.router.navigate(['/catalogo']);
    }
  }

  backToHome(){
    this.router.navigate(['/home']);
  }

}
