import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { URLSearchParams } from '@angular/http';

import { Configuration } from '../../shared/app.configuration';
import { ArticleDataService, CategoryDataService, SlideDataService } from '../../shared';

@Component({
	selector: 'app-home',
	templateUrl: './home.component.html',
	providers: [ ArticleDataService, CategoryDataService, SlideDataService ]
})

export class HomeComponent implements OnInit {
	articles: Array<any> = [];
	categories: Array<any> = [];
	slides: Array<any> = [];
	imgPath: string = this._SlideDataService.imgPath;

	constructor(
		private _ArticleDataService: ArticleDataService,
		private _CategoryDataService: CategoryDataService,
		private _SlideDataService: SlideDataService,
	){
		var params: URLSearchParams = new URLSearchParams();
		params.set('status', 'active');

		this._ArticleDataService.getAll(params).subscribe(res => {
			this.articles = res.data;
		});
		
		/*this._CategoryDataService.getAll(params).subscribe(res => {
			this.categories = res.data;
		});*/

		this._SlideDataService.getAll(params).subscribe(res => {
			this.slides = res.data;
		});
	}

	ngOnInit(){ }


}