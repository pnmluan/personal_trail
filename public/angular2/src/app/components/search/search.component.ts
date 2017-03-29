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
	imgPath: string = this._ArticleDataService.imgPath;

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
		params.set('tag', this._params['tag']);
		this._ArticleDataService.getAll(params).subscribe(res => {
			this.articles = res.data;
		});
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