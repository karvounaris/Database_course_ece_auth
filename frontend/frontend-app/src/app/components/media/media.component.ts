import { Component } from '@angular/core';
import { lastValueFrom } from 'rxjs';
import { MediaArticle } from 'src/app/interfaces/mediaArticle';
import { RequestsService } from 'src/app/services/requests.service';

@Component({
  selector: 'app-media',
  templateUrl: './media.component.html',
  styleUrls: ['./media.component.css']
})
export class MediaComponent {

  public media!: MediaArticle[] ; 
  constructor(
    private RequestsService: RequestsService,

  ) {}

  async ngOnInit(): Promise<void> {
    //this.downloadUrl = "api/buckets/_global/files/objects/";
    this.media = await lastValueFrom(
      this.RequestsService.getMediaArticles()
    );

    console.log(this.media)
  }

}
