import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AgmCoreModule } from 'angular2-google-maps/core';
import { Configuration } from '../../shared/app.configuration';
import { ContactDataService } from '../../shared';

@Component({
	selector: 'app-contact',
	templateUrl: './contact.component.html',
	providers: [ ContactDataService ]
})

export class ContactComponent implements OnInit {
	lat: number = 10.787560;
	lng: number = 106.697295;
	contact: any = {};

	constructor(
		private _ContactDataService: ContactDataService
	){ }

	ngOnInit(){ }

	onSubmit(form: NgForm){
		if(form.valid){
			this._ContactDataService.save(this.contact).subscribe(res => {

			})
		}
	}

}