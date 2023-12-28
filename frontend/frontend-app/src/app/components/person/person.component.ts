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

  deletePerson(person_id?: number) {
    const confirmation = confirm(`Are you sure you want to delete ${person_id}?`);
    if (confirmation) {
      this.RequestsService.deletePerson(person_id!).subscribe(
        () => {
          // Update your countries array or fetch data again after successful delete
          // For example, this.countries = this.countries.filter(country => country.country_name !== countryName);
        },
        error => {
          console.error('Error deleting country:', error);
          // Handle error, show a message, etc.
        }
      );
    }
  }

}
