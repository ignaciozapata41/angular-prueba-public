import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router'
import { ProductoService } from '../../services/producto.service';
import { RelacionesService } from '../../services/relaciones.service'
import { Producto } from '../../interfaces/interfaces'

@Component({
  selector: 'app-producto',
  templateUrl: './producto.page.html',
  styleUrls: ['./producto.page.scss'],
})
export class ProductoPage implements OnInit {

  producto: Producto;

  constructor(public route: ActivatedRoute, public _ProductoService: ProductoService, public _RelacionesService: RelacionesService) { }

  ngOnInit() {
    this.route.params.subscribe( params => {
      console.log(params['sku']);
      if(params['sku'].length > 0){
        this.getDatosProducto(params['sku'])
      }
    })
  }

  // Obtenemos los datos del recurso mediante la sku.
  getDatosProducto(sku: string){
    this._ProductoService.getProductoBySku(sku).subscribe( 
      response => {
        this.producto = response[0];
        console.log(this.producto);
      },
      error => {
        console.log(error)
      })
  }
}
