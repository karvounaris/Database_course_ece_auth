import { Disaster } from 'src/app/interfaces/disaster';
import { RequestsService } from './../../services/requests.service';
import { Component } from '@angular/core';
import { lastValueFrom } from 'rxjs';

@Component({
  selector: 'app-disaster',
  templateUrl: './disaster.component.html',
  styleUrls: ['./disaster.component.css']
})

export class DisasterComponent {
  
  public disasters!: Disaster[] ; 
  constructor(
    private RequestsService: RequestsService,

  ) {}

  async ngOnInit(): Promise<void> {
    //this.downloadUrl = "api/buckets/_global/files/objects/";
    this.disasters = await lastValueFrom(
      this.RequestsService.getDisasters()
    );

    console.log(this.disasters)
  }

}
