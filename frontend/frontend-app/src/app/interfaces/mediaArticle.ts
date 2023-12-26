// Media Article Interface
export interface MediaArticle {
    title: string;
    author: string;
    media_type: 'Print' | 'Online' | 'TV' | 'Radio';
    publication_date: Date;
    origin_country: string;
    disaster_id: number;
}