import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AgmCoreModule } from 'angular2-google-maps/core';
import { Configuration } from '../../shared/app.configuration';
import { ContactDataService, MailService  } from '../../shared';

@Component({
	selector: 'app-contact',
	styles: ['.sebm-google-map-container {height: 450px;}'],
	templateUrl: './contact.component.html',
	providers: [ ContactDataService, MailService ]
})

export class ContactComponent implements OnInit {
	lat: number = 10.787560;
	lng: number = 106.697295;
	contact: any = {};

	constructor(
		private _ContactDataService: ContactDataService,
		private _MailService: MailService
	){ }

	ngOnInit(){ }

	onSubmit(form: NgForm){
		if(form.valid){
			this._ContactDataService.save(this.contact);
			this._MailService.sendConfirmInfo(this.contact);
		}
	}

}