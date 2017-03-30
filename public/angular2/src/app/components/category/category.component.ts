import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router, ActivatedRoute } from '@angular/router';
import { URLSearchParams } from '@angular/http';
import { Subscription } from 'rxjs/Rx';
import { ArticleDataService, CategoryDataService } from '../../shared';

declare let $: any;
declare let instagramFeed: any;
declare let instagramFeed2: any;

@Component({
	selector: 'app-category',
	templateUrl: './category.component.html',
	providers: [ ArticleDataService, CategoryDataService ]
})

export class CategoryComponent implements OnInit {
	private subscriptionEvents: Subscription;
	private subscriptionParam: Subscription;
	curRouting?: string;
	_params = {};
	articles: Array<any> = [];
	colors = ['blue','brown','forest','orange','pink','purple','lime','navy','rose'];
	imgPath: string = this._ArticleDataService.imgPath;

	constructor(
		private _ArticleDataService: ArticleDataService,
		private _CategoryDataService: CategoryDataService,
		private _Router: Router,
		private _ActivatedRoute: ActivatedRoute,
		private _Title: Title
	){
		// subscribe to router event
		this.subscriptionParam = _ActivatedRoute.params.subscribe(
			(param: any) => {
				this._params = param;
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
		setTimeout(() => {
			$('#instafeed-widget').each(function() {
				instagramFeed.run();
			});

			$('#instafeed').each(function() {
				instagramFeed2.run();
			});
		}, 500)
	}

	initData(){
		let params: URLSearchParams = new URLSearchParams();
		params.set('clean_url', this._params['clean_url']);
		params.set('is_count_category', String(true));
		params.set('limit','1');
		this._CategoryDataService.getAll(params).subscribe(res => {
			if(res.data){
				let categories = res.data;
				let category = categories.shift();
				this._Title.setTitle('Category: ' + category.name);
				let params: URLSearchParams = new URLSearchParams();
				params.set('category_id',category.id);
				params.set('status','active');
				this._ArticleDataService.getAll(params).subscribe(res => {
					for(let i in res.data){
						res.data[i].em_tag = this.onSetClassEmTag();
					}
					this.articles = res.data;
				});
			}else{
				this._Router.navigate(['/']);
			}
		});
	}

	onSetClassEmTag(){
		let index = Math.floor(Math.random()*9);
		return this.colors[index];
	}

	ngOnDestroy() {
		this.subscriptionParam.unsubscribe();
		this.subscriptionEvents.unsubscribe();
	}
}