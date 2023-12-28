import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DisasterComponent } from './components/disaster/disaster.component';
import { MediaComponent } from './components/media/media.component';
import { PersonComponent } from './components/person/person.component';
import { CountryComponent } from './components/country/country.component';
import { CountryFormComponent } from './components/country-form/country-form.component';

const routes: Routes = [];

const appRoutes: Routes = [
  {
    path: "",
    pathMatch: "full",
    redirectTo: "",
  },
  { path: "disaster", component: DisasterComponent }, 
  { path: "media", component: MediaComponent },
  { path: "person", component: PersonComponent }, 
  { path: "countries", component: CountryComponent }, 
  { path: "country-form", component: CountryFormComponent }
  
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(appRoutes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
export const routingComponents = [];