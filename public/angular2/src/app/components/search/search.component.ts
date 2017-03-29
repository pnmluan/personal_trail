import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { URLSearchParams } from '@angular/http';
import { Subscription } from 'rxjs/Rx';
import { ArticleDataService, CategoryDataService, TagDataService } from '../../shared';

declare let $: any;
declare let instagramFeed: any;
declare let instagramFeed2: any;

@Component({
	selector: 'app-search',
	templateUrl: './search.component.html',
	providers: [ ArticleDataService, CategoryDataService, TagDataService ]
})

export class SearchComponent implements OnInit {
	private subscription: Subscription;
	private subscriptionParam: Subscription;
	_params: {};
	articles: Array<any> = [];
	categories: Array<any> = [];
	posts: Array<any> = [];
	tags: Array<any> = [];

	constructor(
		private _ActivatedRoute: ActivatedRoute,
		private _ArticleDataService: ArticleDataService,
		private _CategoryDataService: CategoryDataService,
		private _TagDataService: TagDataService
	){
		this.subscription = this._ActivatedRoute.queryParams.subscribe((param: any) => {
			this._params = param
		})
	}

	ngOnInit(){
		let params: URLSearchParams = new URLSearchParams();
		params.set('status', 'active');
		this._TagDataService.getAll(params).subscribe(res => {
			this.tags = res.data;
		});

		this._ArticleDataService.getPopularPosts().subscribe(res => {
			this.posts = res.data;
		});
		
		params.set('is_count_category','true');
		this._CategoryDataService.getAll(params).subscribe(res => {
			this.categories = res.data;
		});

		params.set('clean_url', this._params['tag']);
		this._ArticleDataService.getAll().subscribe();
	}

	ngAfterViewInit(){
		setTimeout(() => {
			$('#instafeed-widget').each(function() {
				instagramFeed.run();
			});

			$('#instafeed').each(function() {
				instagramFeed2.run();
			});
		}, 500)
	}

	ngOnDestroy() {
		this.subscription.unsubscribe();
	}
}