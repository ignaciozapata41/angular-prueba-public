import { Component } from '@angular/core';
import { ProductoService } from '../../services/producto.service';
import { RelacionesService } from '../../services/relaciones.service'

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(public _ProductoService: ProductoService, public _RelacionesService: RelacionesService) {

  }

  

}
