import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Country, Disaster, Person } from '../interfaces/disaster';
import { HttpClient, HttpErrorResponse } from "@angular/common/http";
import { MediaArticle } from '../interfaces/mediaArticle';

@Injectable({
  providedIn: 'root'
})
export class RequestsService {

  public baseUrl = "http://localhost:3000"

  greekTime = new BehaviorSubject<Date>(new Date());
  currentgreekTime = this.greekTime.asObservable();

  constructor(private http: HttpClient) { }

  getDisasters():Observable<Disaster[]>{ 
    
    console.log(this.baseUrl)
    return this.http.get<Disaster[]>(`${this.baseUrl}/disasters`);
    
  }

  getMediaArticles():Observable<MediaArticle[]>{ 
    
    console.log(this.baseUrl)
    return this.http.get<MediaArticle[]>(`${this.baseUrl}/media_article`);
    
  }

  getPerson():Observable<Person[]>{ 
    
    console.log(this.baseUrl)
    return this.http.get<Person[]>(`${this.baseUrl}/person`);
    
  }

  getCountry():Observable<Country[]>{ 
    
    console.log(this.baseUrl)
    return this.http.get<Country[]>(`${this.baseUrl}/country`);
    
  }

  changeTime(time: Date): void {
    this.greekTime.next(new Date(time.getTime()));

  }
}
