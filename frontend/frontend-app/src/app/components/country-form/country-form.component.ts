import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-country-form',
  templateUrl: './country-form.component.html',
  styleUrls: ['./country-form.component.css']
})
export class CountryFormComponent implements OnInit {
    countryForm!: FormGroup;
  
    constructor(private fb: FormBuilder, private http: HttpClient) {}
  
    ngOnInit() {
      this.countryForm = this.fb.group({
        country_name: ['', [Validators.required]],
        population: [null, [Validators.required, Validators.min(0)]],
        GDP: [null, [Validators.required, Validators.min(0)]]
        // Add more form controls as needed
      });
    }
  
    onSubmit() {
      // Check if the form is valid before submitting
      if (this.countryForm.valid) {
        const countryData = this.countryForm.value;
        console.log(countryData) ; 
  
        // Make a POST request to the backend
        this.http.post('http://localhost:3000/country', countryData).subscribe(
          (response) => {
            console.log('Country created successfully:', response);
            // You can redirect or perform additional actions after successful creation
          },
          (error) => {
            console.error('Error creating country:', error);
          }
        );
      }
    }

}
