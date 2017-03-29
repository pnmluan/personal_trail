import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AgmCoreModule } from 'angular2-google-maps/core';
import { Configuration } from '../../shared/app.configuration';

@Component({
	selector: 'app-contact',
	styles: ['.sebm-google-map-container {height: 450px;}'],
	templateUrl: './contact.component.html',
})

export class ContactComponent implements OnInit {
	lat: number = 10.787560;
	lng: number = 106.697295;
	contact: any = {};

	constructor(){ }

	ngOnInit(){ }

	onSubmit(form: NgForm){
		if(form.valid){
			console.log(this.contact);
		}
	}

}