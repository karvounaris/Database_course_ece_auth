import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DisasterComponent } from './components/disaster/disaster.component';

const routes: Routes = [];

const appRoutes: Routes = [
  {
    path: "",
    pathMatch: "full",
    redirectTo: "",
  },
  { path: "disaster", component: DisasterComponent }
  
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(appRoutes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
export const routingComponents = [];