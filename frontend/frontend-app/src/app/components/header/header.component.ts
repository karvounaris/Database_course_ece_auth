import { RequestsService } from './../../services/requests.service';
import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {

  greekTime!: Date;

  constructor(
    private RequestsService: RequestsService
  ) {}
  async ngOnInit(): Promise<void> {

    this.RequestsService.currentgreekTime.subscribe((time) => {
      this.greekTime = time;
    });

  } 

}
