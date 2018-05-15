import { Component, OnInit, HostListener } from '@angular/core';
import { URLSearchParams } from '@angular/http';
import { Configuration } from '../../shared/app.configuration';
import { CategoryDataService } from '../../shared';

@Component({
	selector: 'app-header',
	templateUrl: './header.component.html',
	providers: [ CategoryDataService ],
	host: { '(document:keyup)' : 'onEnterForm($event)' }
})

export class HeaderComponent implements OnInit {
	categories: Array<any> = [];

	constructor(
		private _CategoryDataService: CategoryDataService,
	){ }

	ngOnInit(){
		let params: URLSearchParams = new URLSearchParams();
		params.set('status', 'active');
		this._CategoryDataService.getAll(params).subscribe(res => {
			this.categories = res.data;
		});
	}

	onEnterForm($event){
		
	}
}