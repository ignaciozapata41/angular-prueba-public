import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular'
import { ProductosSlidesComponent } from './productos-slides/productos-slides.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { FiltrosComponent } from './filtros/filtros.component';
import { FiltroComponent } from './filtro/filtro.component';
import { FormsModule } from '@angular/forms'


@NgModule({
  declarations: [
    ProductosSlidesComponent,
    FooterComponent,
    HeaderComponent,
    FiltrosComponent,
    FiltroComponent,
  ],
  imports: [
    CommonModule,
    IonicModule,
    FormsModule,
  ], 
  exports: [
    ProductosSlidesComponent,
    HeaderComponent,
    FooterComponent,
    FiltrosComponent,
    FiltroComponent,
  ],
})
export class ComponentsModule { }
