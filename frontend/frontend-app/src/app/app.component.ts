import { RequestsService } from './services/requests.service';
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'frontend-app';

  time!: Date;
  constructor(
    private RequestsService: RequestsService,
  ) {}  
  async ngOnInit(): Promise<void> {

    this.RequestsService.currentgreekTime.subscribe((time) => {
      this.time = time;
    });
 
    setInterval(() => {
      this.time = new Date();
      this.RequestsService.changeTime(this.time);
    }, 1000);
  
  } 

}

