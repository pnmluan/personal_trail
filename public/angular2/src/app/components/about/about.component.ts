import { Component, OnInit } from '@angular/core';

declare let $: any;
declare let instagramFeed: any;
declare let instagramFeed2: any;

@Component({
	selector: 'app-about',
	templateUrl: './about.component.html',
})

export class AboutComponent implements OnInit {
	constructor(){ }

	ngOnInit(){ }

	ngAfterViewInit(){
		setTimeout(() => {
			$('#instafeed-widget').each(function() {
				instagramFeed.run();
			});

			$('#instafeed').each(function() {
				instagramFeed2.run();
			});
		}, 200)
	}
}