import { NgModule } from '@angular/core';
import { BrowserModule, Title } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';

// Third party
import { ToasterModule, ToasterService } from 'angular2-toaster';
import { TabsModule } from "ng2-tabs";
import { SelectModule } from 'angular2-select';
// import { LocalStorageService, LOCAL_STORAGE_SERVICE_CONFIG } from 'angular-2-local-storage';
import { LocalStorageModule } from 'angular-2-local-storage';
import { MomentModule } from 'angular2-moment';
import { HTTP_INTERCEPTOR_PROVIDER } from 'ng2-http-interceptor';
import { LoadingAnimateModule, LoadingAnimateService } from 'ng2-loading-animate';
import { Ng2Bs3ModalModule } from 'ng2-bs3-modal/ng2-bs3-modal';
import { DatePickerModule } from 'ng2-datepicker';
import { AgmCoreModule } from 'angular2-google-maps/core';
// import { SidebarModule } from 'ng-sidebar';
 
// Create config options (see ILocalStorageServiceConfigOptions) for deets:
// let localStorageServiceConfig = {
//     prefix: 'my-app',
//     storageType: 'localStorage'
// };

import { Configuration } from './shared/app.configuration';
import { HttpClient } from './shared/http-client';
/*
 * Platform and Environment providers/directives/pipes
 */
import { routing } from './app.routing';

// App is our top level component
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header';
import { FooterComponent } from './components/footer';
import { HomeComponent } from './components/home';
import { AboutComponent } from './components/about';
import { ArticleComponent } from './components/article';
import { CategoryComponent } from './components/category';
import { ContactComponent } from './components/contact';
import { SearchComponent } from './components/search';


@NgModule({
	declarations: [
		AppComponent,
		HeaderComponent,
		FooterComponent,
		HomeComponent,
		AboutComponent,
		ArticleComponent,
		CategoryComponent,
		ContactComponent,
		SearchComponent
	],
	imports: [
		BrowserModule,
		FormsModule,
		HttpModule,
		routing,
		ReactiveFormsModule,
		SelectModule,
		MomentModule,
		LoadingAnimateModule.forRoot(),
		Ng2Bs3ModalModule,
		TabsModule,
		DatePickerModule,
		ToasterModule,
		AgmCoreModule.forRoot({
		    apiKey: 'AIzaSyA-KHUk6ARqo3uBome6suVzr-Na9nAooZA'
		}),
		LocalStorageModule.withConfig({
		    prefix: 'my-app',
		    storageType: 'localStorage'
		}),
		// SidebarModule
	],
	providers: [
		Configuration,
		HttpClient,
		...HTTP_INTERCEPTOR_PROVIDER,
		LoadingAnimateService,
		Title
		// LocalStorageService,
		// {
		//   provide: LOCAL_STORAGE_SERVICE_CONFIG, useValue: localStorageServiceConfig
		// }
	],
	bootstrap: [AppComponent]
})

export class AppModule { }
