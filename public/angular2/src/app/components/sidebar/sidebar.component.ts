import { Component, OnInit } from '@angular/core';
import { URLSearchParams } from '@angular/http';
import { ArticleDataService, CategoryDataService, TagDataService } from '../../shared';
declare let $: any;

@Component({
	selector: 'app-sidebar',
	templateUrl: './sidebar.component.html',
	providers: [ ArticleDataService, CategoryDataService, TagDataService ]
})

export class SidebarComponent implements OnInit {
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
	}
}