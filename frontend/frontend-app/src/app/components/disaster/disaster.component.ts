import { Disaster } from 'src/app/interfaces/disaster';
import { RequestsService } from './../../services/requests.service';
import { Component, ViewChild } from '@angular/core';
import { lastValueFrom } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-disaster',
  templateUrl: './disaster.component.html',
  styleUrls: ['./disaster.component.css']
})

export class DisasterComponent {
  
  public disasters!: Disaster[] ; 
  displayedColumns: string[] = ['disaster_name', 'deaths', 'injured', 'continent'];
  dataSource!: MatTableDataSource<Disaster>;

  @ViewChild(MatSort) sort!: MatSort;
  
  constructor(
    private RequestsService: RequestsService,

  ) {}

  async ngOnInit(): Promise<void> {
   
    this.disasters = await lastValueFrom(
      this.RequestsService.getDisasters()
    );
    this.dataSource = new MatTableDataSource(this.disasters)

    

    console.log(this.disasters)
    
  }

  applyFilter(event: Event): void {
    /**
     * this is the filter for the search input in the 2nd step
     */
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}
