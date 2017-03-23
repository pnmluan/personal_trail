import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { URLSearchParams } from '@angular/http';

import { Configuration } from '../../shared/app.configuration';
import { ArticleDataService, CategoryDataService, TagDataService } from '../../shared';
declare let $: any;

@Component({
	selector: 'app-footer',
	templateUrl: './footer.component.html',
	providers: [ ArticleDataService, CategoryDataService, TagDataService ]
})

export class FooterComponent implements OnInit {
	categories: Array<any> = [];
	posts: Array<any> = [];
	tags: Array<any> = [];
	imgPath: string = this._ArticleDataService.imgPath;

	constructor(
		private _ArticleDataService: ArticleDataService,
		private _CategoryDataService: CategoryDataService,
		private _TagDataService: TagDataService,
	){ }

	ngOnInit(){
		var params: URLSearchParams = new URLSearchParams();
		params.set('status', 'active');

		this._ArticleDataService.getPopularPosts().subscribe(res => {
			this.posts = res.data;
		});

		this._TagDataService.getAll(params).subscribe(res => {
			this.tags = res.data;
		});

		params.set('is_count_category','true');
		this._CategoryDataService.getAll(params).subscribe(res => {
			this.categories = res.data;
		});
	}
}