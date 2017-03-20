import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { URLSearchParams } from '@angular/http';

import { Configuration } from '../../shared/app.configuration';
import { ArticleDataService, CategoryDataService, SlideDataService } from '../../shared';
declare let $: any;

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
	){ }

	ngOnInit(){
		var params: URLSearchParams = new URLSearchParams();
		params.set('status', 'active');

		this._ArticleDataService.getAll(params).subscribe(res => {
			this.articles = res.data;
		});

		this._SlideDataService.getAll(params).subscribe(res => {
			this.slides = res.data;
		});

		params.set('is_count_category','true');
		this._CategoryDataService.getAll(params).subscribe(res => {
			this.categories = res.data;
		});

		setTimeout(() => {
			/*-----------------------------------------------------------------------------------*/
			/*	SWIPER
			/*-----------------------------------------------------------------------------------*/
			$('.swiper-container.image-blog-wide').each(function() {
				$(this).swiper({
					pagination: '.image-blog-wide-wrapper .swiper-pagination',
					nextButton: '.image-blog-wide-wrapper .swiper-button-next',
					prevButton: '.image-blog-wide-wrapper .swiper-button-prev',
					slidesPerView: 3,
					breakpoints: {
						991: {
							slidesPerView: 1
						},
						1681: {
							slidesPerView: 2
						}
					},
					centeredSlides: false,
					paginationClickable: true,
					spaceBetween: 10,
					grabCursor: true
				});
				var $swipers = $(this);
			});
			$('.swiper-container.image-blog').each(function() {
				$(this).swiper({
					pagination: '.image-blog-wrapper .swiper-pagination',
					nextButton: '.image-blog-wrapper .swiper-button-next',
					prevButton: '.image-blog-wrapper .swiper-button-prev',
					slidesPerView: 2,
					breakpoints: {
						991: {
							slidesPerView: 1
						},
						1681: {
							slidesPerView: 2
						}
					},
					centeredSlides: false,
					paginationClickable: true,
					spaceBetween: 10,
					grabCursor: true
				});
				var $swipers = $(this);
			});
		}, 1000);
	}


}