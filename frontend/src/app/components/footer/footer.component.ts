import { Component, OnInit } from '@angular/core';
import {  Platform } from '@ionic/angular';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
})
export class FooterComponent implements OnInit {
  showComponent: boolean = true;

  constructor(public platform: Platform,) { }

  ngOnInit() {
    this.setView();
    var main = this;
    window.addEventListener("orientationchange", function() {
      main.setView()
   }, false);

  }

  setView(){
    if(this.platform.isLandscape()){
      console.log('landscape')
      this.showComponent = false;
    }else{
      console.log('no land')
      this.showComponent = true;
    }
  }

}
