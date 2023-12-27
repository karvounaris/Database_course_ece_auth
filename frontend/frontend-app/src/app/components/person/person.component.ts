import { Component } from '@angular/core';
import { lastValueFrom } from 'rxjs';
import { Person } from 'src/app/interfaces/disaster';
import { RequestsService } from 'src/app/services/requests.service';

@Component({
  selector: 'app-person',
  templateUrl: './person.component.html',
  styleUrls: ['./person.component.css']
})
export class PersonComponent {

  public people!: Person[] ; 
  constructor(
    private RequestsService: RequestsService,

  ) {}

  async ngOnInit(): Promise<void> {
    //this.downloadUrl = "api/buckets/_global/files/objects/";
    this.people = await lastValueFrom(
      this.RequestsService.getPerson()
    );

    console.log(this.people)
  }

}
