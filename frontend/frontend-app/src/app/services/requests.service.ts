import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Disaster } from '../interfaces/disaster';
import { HttpClient, HttpErrorResponse } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class RequestsService {

  public baseUrl = "http://localhost:3000/disasters"

  greekTime = new BehaviorSubject<Date>(new Date());
  currentgreekTime = this.greekTime.asObservable();

  constructor(private http: HttpClient) { }

  getDisasters():Observable<Disaster[]>{ 
    
    console.log(this.baseUrl)
    return this.http.get<Disaster[]>(this.baseUrl);
    
  }

  changeTime(time: Date): void {
    this.greekTime.next(new Date(time.getTime()));

  }
}
