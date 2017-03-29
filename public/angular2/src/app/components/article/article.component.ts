import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router, ActivatedRoute } from '@angular/router';
import { URLSearchParams } from '@angular/http';
import { Subscription } from 'rxjs/Rx';

import { Configuration } from '../../shared/app.configuration';
import { ArticleDataService, CategoryDataService, TagDataService } from '../../shared';

declare let $: any;
declare let instagramFeed: any;
declare let instagramFeed2: any;

@Component({
	selector: 'app-article',
	templateUrl: './article.component.html',
	providers: [ ArticleDataService, CategoryDataService, TagDataService ]
})

export class ArticleComponent implements OnInit {
	private subscriptionEvents: Subscription;
	private subscriptionParam: Subscription;
	private subscriptionQueryParam: Subscription;
	curRouting?: string;
	_params = {};
	articles: Array<any> = [];
	categories: Array<any> = [];
	pictures: Array<any> = [];
	posts: Array<any> = [];
	tags: Array<any> = [];
	article = {};
	prev_article = {};
	next_article = {};
	imgPath: string = this._ArticleDataService.imgPath;

	constructor(
		private _ArticleDataService: ArticleDataService,
		private _CategoryDataService: CategoryDataService,
		private _TagDataService: TagDataService, 
		private _Router: Router,
		private _ActivatedRoute: ActivatedRoute,
		private _title: Title
	){
		// subscribe to router event
		this.subscriptionParam = this._ActivatedRoute.params.subscribe(
			(params: any) => {
				this._params = params;
			}
		);

		this.subscriptionEvents = this._Router.events.subscribe((val) => {
			let routing = this._Router.url;
			if (this.curRouting != routing) {
				this.curRouting = routing;
				this.initData();
			}
		});

	}

	ngOnInit(){ }

	ngAfterViewInit(){
		$('#instafeed-widget').each(function() {
			instagramFeed.run();
		});

		$('#instafeed').each(function() {
			instagramFeed2.run();
		});
	}

	initData(){
		//reset previous, next article
		this.prev_article = {};
		this.next_article = {};
		//init data
		let params: URLSearchParams = new URLSearchParams();
		params.set('clean_url', this._params['clean_url']);
		params.set('limit','1');
		params.set('is_count_viewers','true');
		this._ArticleDataService.getAll(params).subscribe(res => {
			if(res.data){
				let articles = res.data;
				this.article = articles.shift();
				this._title.setTitle(this.article['title']);
				this.pictures = this.article['pictures'];
				this.loadRelatedPosts(this.article['category_id'], this.article['id']);
			}else{
				this._Router.navigate(['/']);
			}
		});
	}

	loadRelatedPosts(category_id: number, except_id: number){
		let key: number;
		let prev_key: number;
		let next_key: number;
		let params: URLSearchParams = new URLSearchParams();
		params.set('category_id', String(category_id));
		params.set('status', 'active');
		this._ArticleDataService.getAll(params).subscribe(res => {
			if(res.data){
				let posts = res.data;
				for(let k in posts){
					if(posts[k].id == except_id){
						key = +k;
						if(posts[key - 1]){
							prev_key = key - 1;
							this.prev_article = posts[prev_key];
						}
						if(posts[key + 1]){
							next_key = key + 1;
							this.next_article = posts[next_key];
						}

					}
				}

				if(key > -1) posts.splice(key,1);
				if(prev_key > -1) posts.splice(prev_key,1);
				if(next_key > -1) posts.splice(next_key,1);

				this.articles = posts;
			}
		});
	}
}