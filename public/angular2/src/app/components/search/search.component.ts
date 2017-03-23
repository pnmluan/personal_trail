import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { URLSearchParams } from '@angular/http';
import { Subscription } from 'rxjs/Rx';

import { ArticleDataService, CategoryDataService } from '../../shared';

@Component({
	selector: 'app-search',
	templateUrl: './search.component.html',
	providers: [ ArticleDataService, CategoryDataService ]
})

export class SearchComponent implements OnInit {
	private subscriptionEvents: Subscription;
	private subscriptionParam: Subscription;

	ngOnInit(){ }
}