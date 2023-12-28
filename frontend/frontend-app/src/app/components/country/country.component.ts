import { Component } from '@angular/core';
import { lastValueFrom } from 'rxjs';
import { Country } from 'src/app/interfaces/disaster';
import { RequestsService } from 'src/app/services/requests.service';


@Component({
  selector: 'app-country',
  templateUrl: './country.component.html',
  styleUrls: ['./country.component.css']
})
export class CountryComponent {

  public countries!: Country[] ; 

  constructor(
    private RequestsService: RequestsService,

  ) {
    
  }

  async ngOnInit(): Promise<void> {
    //this.downloadUrl = "api/buckets/_global/files/objects/";
    this.countries = await lastValueFrom(
      this.RequestsService.getCountry()
    );
    
    
    console.log(this.countries) ; 

  } 

  deleteCountry(countryName: string) {
    const confirmation = confirm(`Are you sure you want to delete ${countryName}?`);
    if (confirmation) {
      this.RequestsService.deleteCountry(countryName).subscribe(
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
