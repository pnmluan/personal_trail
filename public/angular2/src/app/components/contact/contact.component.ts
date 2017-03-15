import { Component, OnInit } from '@angular/core';

import { AgmCoreModule } from 'angular2-google-maps/core';
import { Configuration } from '../../shared/app.configuration';

@Component({
	selector: 'app-contact',
	templateUrl: './contact.component.html',
})

export class ContactComponent implements OnInit {
	lat: number = 51.211215;
	lng: number = 3.226287;

	constructor(){ }

	ngOnInit(){ }

}