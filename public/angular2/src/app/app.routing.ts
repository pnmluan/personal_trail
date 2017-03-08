import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home';
import { AboutComponent } from './components/about';
import { ArticleComponent } from './components/article';
import { CategoryComponent } from './components/category';
import { ContactComponent } from './components/contact';

const APP_ROUTES: Routes = [
	{ path: '', redirectTo: 'home', pathMatch: 'full' },
	{ path: 'home', component: HomeComponent },
	{ path: 'about', component: AboutComponent },
	{ path: 'article/:id', component: ArticleComponent },
	{ path: 'category/:id',component: CategoryComponent },
	{ path: 'contact', component: ContactComponent },
	//{ path: '**', component: PageNotFoundComponent },
];

export const routing = RouterModule.forRoot(APP_ROUTES);