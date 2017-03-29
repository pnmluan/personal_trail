import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { URLSearchParams } from '@angular/http';
import { AgmCoreModule } from 'angular2-google-maps/core';
import { Configuration } from '../../shared/app.configuration';
import { ContactDataService, MailService  } from '../../shared';

@Component({
	selector: 'app-contact',
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
			let params: URLSearchParams = new URLSearchParams();
			params.set('name', this.contact['name']);
			params.set('email', this.contact['email']);
			params.set('phone', this.contact['phone']);
			params.set('title', this.contact['title']);
			params.set('content', this.contact['content']);
			this._ContactDataService.save(params);
			this._MailService.sendConfirmInfo(params);
		}
	}

}