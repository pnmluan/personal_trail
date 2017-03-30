import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { URLSearchParams } from '@angular/http';
import { Title } from '@angular/platform-browser';
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
		private _MailService: MailService,
		private _Title: Title
	){ }

	ngOnInit(){
		this._Title.setTitle('Contact | Lighthouse');
	}

	onSubmit(form: NgForm) {
		if(form.valid){
			let params: URLSearchParams = new URLSearchParams();
			params.set('first_name', this.contact['first_name']);
			params.set('last_name', this.contact['last_name']);
			params.set('email', this.contact['email']);
			params.set('phone', this.contact['phone']);
			params.set('title', this.contact['title']);
			params.set('content', this.contact['content']);
			//save contact info and send mail
			this._ContactDataService.save(params).subscribe(res => {});
			this._MailService.sendConfirmInfo(params).subscribe(res => {});
		}
	}

}