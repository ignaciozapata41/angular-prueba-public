import { Component, OnInit, Input } from '@angular/core';
import { Producto } from '../../interfaces/interfaces';
import { Router } from '@angular/router';

@Component({
  selector: 'app-productos-slides',
  templateUrl: './productos-slides.component.html',
  styleUrls: ['./productos-slides.component.scss'],
})
export class ProductosSlidesComponent implements OnInit {
  @Input() productos: Producto[] = [];
  slidesPerView: Number = 1;
  
  slideOpts = {
    slidesPerView: 2,
    freeMode: true,
  };

  constructor(public router: Router) { }

  ngOnInit() {
    var mainClass = this;
    window.addEventListener("resize", function(){
      if(window.screen.availWidth < 750){
        mainClass.slidesPerView = 2;
      }else{
        mainClass.slidesPerView = 4;
      }
    }, true);
  }

  VerDetalles(producto){
    if(producto.sku.length < 1){
      return;
    }
    this.router.navigate(['/producto', producto.sku])
  }


}
