import { Component, OnInit } from '@angular/core';
import { LoadingController } from '@ionic/angular';
import { ProductoService } from '../../services/producto.service';
import { Producto } from '../../interfaces/interfaces';
import { RelacionesService } from '../../services/relaciones.service'
import { Router } from '@angular/router';

@Component({
  selector: 'app-catalogo',
  templateUrl: './catalogo.page.html',
  styleUrls: ['./catalogo.page.scss'],
})
export class CatalogoPage implements OnInit {

  showProduct = false;
 
  constructor(public _ProductoService: ProductoService, 
              public _RelacionesService: RelacionesService, 
              public router: Router) {  }

  ngOnInit() {
  }

  VerDetalles(producto){
    if(producto.sku.length < 1){
      return;
    }
    this.router.navigate(['/producto', producto.sku])
  }

  ionViewWillLeave(){
    this._ProductoService.resetFiltros();
  }

}
