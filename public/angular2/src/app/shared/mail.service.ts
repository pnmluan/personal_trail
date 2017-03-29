import { Injectable } from '@angular/core';
import { Http, Headers, Response } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Configuration } from '../shared/app.configuration';

@Injectable()
export class MailService {
	private actionUrl: string;

	constructor(private _Http: Http, private _Configuration: Configuration) {
		this.actionUrl = _Configuration.apiUrl + 'mail/';
	}

	createAuthorizationHeader(headers: Headers) {
		headers.append('Content-Type', 'application/x-www-form-urlencoded');
		headers.append('Authorization', 'Basic ' + this._Configuration.authentic);
	}

	public sendConfirmInfo(params = null) {
		let headers = new Headers();
		this.createAuthorizationHeader(headers);
		return this._Http.post(this.actionUrl + 'sendConfirmInfo', params, { 
			headers: headers
		})
		.map(res => res.json())
		.catch(this.handleError);
	}

	private handleError(error: Response) {
		return Observable.throw(error.json().error || 'Server error');
	}

}