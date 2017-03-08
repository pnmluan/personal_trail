import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { URLSearchParams } from '@angular/http';
import { Subscription } from 'rxjs/Rx';

import { Configuration } from '../../shared/app.configuration';
import { ArticleDataService, CategoryDataService } from '../../shared';

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

	constructor(
		private _ArticleDataService: ArticleDataService,
		private _CategoryDataService: CategoryDataService,
		private _Router: Router,
		private _ActivatedRoute: ActivatedRoute,
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

	ngOnInit(){
		let params: URLSearchParams = new URLSearchParams();
		this._CategoryDataService.getAll(params).subscribe(res => {
			
		})
	}

	initData(){

	}
}