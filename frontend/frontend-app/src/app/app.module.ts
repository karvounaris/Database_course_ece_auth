import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DisasterComponent } from './components/disaster/disaster.component';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './components/material/material.module';
import { HeaderComponent } from './components/header/header.component';
import { SidenavComponent } from './components/sidenav/sidenav.component';
import { MediaComponent } from './components/media/media.component';
import { PersonComponent } from './components/person/person.component';
import { CountryComponent } from './components/country/country.component';

@NgModule({
  declarations: [
    AppComponent,
    DisasterComponent, 
    HeaderComponent, SidenavComponent, MediaComponent, PersonComponent, CountryComponent
  ],
  imports: [
    AppRoutingModule,
    BrowserModule,
    AppRoutingModule, 
    HttpClientModule, BrowserAnimationsModule, MaterialModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
