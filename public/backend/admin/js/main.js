/***
Metronic AngularJS App Main Script
***/

/* Metronic App */
var MetronicApp = angular.module("MetronicApp", [
    "base64",       // Basic Auth
    "ui.router",    // Router
    "ui.bootstrap", // Bootstrap
    "oc.lazyLoad",  // Lazy Loading
    "ngSanitize",
    "ngDialog",     // Model Popup
    "toastr",       // Toastr
    "datatables",   // Datatable
    'ngFileUpload', // ng-file-upload
]); 

/* Configure API */
MetronicApp.config(['$httpProvider', '$base64', 'toastrConfig', function($httpProvider, $base64, toastrConfig) {
    let token = localStorage.getItem('token');
    if(token) {
        $httpProvider.defaults.headers.common['Authorization'] = 'Bearer ' + token;
    }
    

    angular.extend(toastrConfig, {
        autoDismiss: false,
        containerId: 'toast-container',
        maxOpened: 0,    
        newestOnTop: true,
        positionClass: 'toast-bottom-right',
        preventDuplicates: false,
        preventOpenDuplicates: false,
        target: 'body'
      });
}]);
// MetronicApp.config(function($httpProvider, $base64) {
//     var auth = $base64.encode("datvesieure:balobooking");
//     $httpProvider.defaults.headers.common['Authorization'] = 'Basic ' + auth;
// });


/* Configure ocLazyLoader(refer: https://github.com/ocombe/ocLazyLoad) */
MetronicApp.config(['$ocLazyLoadProvider', function($ocLazyLoadProvider) {
    $ocLazyLoadProvider.config({
        // global configs go here
    });
}]);

//AngularJS v1.3.x workaround for old style controller declarition in HTML
MetronicApp.config(['$controllerProvider', function($controllerProvider) {
  // this option might be handy for migrating old apps, but please don't use it
  // in new ones!
  $controllerProvider.allowGlobals();
}]);

/********************************************
 END: BREAKING CHANGE in AngularJS v1.3.x:
*********************************************/

/* Setup global settings */
MetronicApp.factory('settings', ['$rootScope', function($rootScope) {
    // supported languages
    var settings = {
        layout: {
            pageSidebarClosed: false, // sidebar menu state
            pageContentWhite: true, // set page content layout
            pageBodySolid: false, // solid body color state
            pageAutoScrollOnLoad: 1000 // auto scroll to top on page load
        },
        assetsPath: '../assets',
        globalPath: '../assets/global',
        layoutPath: '../assets/layouts/layout',
        apiPath: '/personal_trail/public/api/',
        baseUrl: '/personal_trail/public/backend/admin/#/',
        imgPath: '../assets/apps/img/',
        btnUpdate: `<button class="btn btn-sm green btn-outline filter-submit margin-bottom clickToUpdate"><i class="fa fa-edit"></i> Edit</button>`,
        btnDelete: `<button class="btn btn-sm red btn-outline filter-cancel clickToDelete"><i class="fa fa-trash"></i> Delete</button>`,
        btnView: `<button class="btn btn-sm blue btn-outline filter-cancel clickToView"><i class="fa fa-book"></i> View</button>`,
        statePending: `<span class="label label-sm label-info"> Pending </span>`,
        stateApproved: `<span class="label label-sm label-success"> Approved </span>`,
            
    };

    $rootScope.settings = settings;

    return settings;
}]);

/* Setup App Main Controller */
MetronicApp.controller('AppController', ['$scope', '$rootScope', '$http', '$window', function($scope, $rootScope, $http, $window) {
    $scope.$on('$viewContentLoaded', function() {

        if($rootScope.settings.state != 'login') {
            var urlBase = $rootScope.settings.apiPath + 'auth';
            $http.get(urlBase + '/user').then(function(res) {
                if(res.status == 200) {
                    // localStorage.removeItem('token');
                    
                    // $window.location.reload();
                }

            }, function(res) {
                if(res.status == 401) {
                    $window.location.href = $rootScope.settings.baseUrl + 'login.html';
                }
            });
        }
        //App.initComponents(); // init core components
        //Layout.init(); //  Init entire layout(header, footer, sidebar, etc) on page load if the partials included in server side instead of loading with ng-include directive 
    });

    
    

    /* Logout system */
    $scope.onLogout = function() {
        var urlBase = $rootScope.settings.apiPath + 'auth';
        $http.delete(urlBase + '/logout').then(function(res) {

            if(res.status == 200) {
                localStorage.removeItem('token');
                $window.location.href = $rootScope.settings.baseUrl + 'login.html';
                // $window.location.reload();
            }

        });
    }
}]);

/* Format Number Input */
MetronicApp.directive('format', ['$filter', function ($filter) {
    return {
        require: '?ngModel',
        link: function (scope, elem, attrs, ctrl) {
            if (!ctrl) return;


            ctrl.$formatters.unshift(function (a) {
                return $filter(attrs.format)(ctrl.$modelValue)
            });


            ctrl.$parsers.unshift(function (viewValue) {
                var plainNumber = viewValue.replace(/[^\d|\-+|\.+]/g, '');
                elem.val($filter(attrs.format)(plainNumber));
                return plainNumber;
            });
        }
    };
}]);

/* Plugin ckEditor */
MetronicApp.directive('ckEditor', function() {
  return {
    require: '?ngModel',
    link: function(scope, elm, attr, ngModel) {
      var ck = CKEDITOR.replace(elm[0]);

      if (!ngModel) return;

      ck.on('instanceReady', function() {
        ck.setData(ngModel.$viewValue);
      });

      function updateModel() {
          scope.$apply(function() {
              ngModel.$setViewValue(ck.getData());
          });
      }

      ck.on('change', updateModel);
      ck.on('key', updateModel);
      ck.on('dataReady', updateModel);

      ngModel.$render = function(value) {
        ck.setData(ngModel.$viewValue);
      };
    }
  };
});

/* Capitalize filter */
MetronicApp.filter('capitalize', function() {
    return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    }
});

/***
Layout Partials.
By default the partials are loaded through AngularJS ng-include directive. In case they loaded in server side(e.g: PHP include function) then below partial 
initialization can be disabled and Layout.init() should be called on page load complete as explained above.
***/

/* Setup Layout Part - Header */
MetronicApp.controller('HeaderController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        // Layout.initHeader(); // init header
    });
}]);

/* Setup Layout Part - Sidebar */
MetronicApp.controller('SidebarController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initSidebar(); // init sidebar
    });
}]);

/* Setup Layout Part - Quick Sidebar */
MetronicApp.controller('QuickSidebarController', ['$scope', function($scope) {    
    $scope.$on('$includeContentLoaded', function() {
       setTimeout(function(){
            QuickSidebar.init(); // init quick sidebar        
        }, 2000)
    });
}]);

/* Setup Layout Part - Theme Panel */
MetronicApp.controller('ThemePanelController', ['$scope', function($scope, $state) {    
    $scope.$on('$includeContentLoaded', function() {
        Demo.init(); // init theme panel
    });
}]);

/* Setup Layout Part - Footer */
MetronicApp.controller('FooterController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initFooter(); // init footer
    });
}]);

/* Setup Rounting For All Pages */
MetronicApp.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    // Redirect any unmatched url
    $urlRouterProvider.otherwise("/login.html");  

    $stateProvider

        // Login
        .state('login', {
            url: "/login.html",
            templateUrl: "views/login/main.html",            
            data: {pageTitle: 'Admin Category Template'},
            controller: "AuthController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            '../assets/global/plugins/dropzone/dropzone.min.js',
                            'js/controllers/AuthController.js',
                            'js/services/auth.service.js'
                        ] 
                    });
                }]
            }
        })

         // categoryticket
        .state('category', {
            url: "/category.html",
            templateUrl: "views/category/main.html",            
            data: {pageTitle: 'Admin Category Template'},
            controller: "CategoryController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            '../assets/global/plugins/dropzone/dropzone.min.js',
                            'js/controllers/CategoryController.js',
                            'js/services/category.service.js'
                        ] 
                    });
                }]
            }
        })

        // Article
        .state('article', {
            url: "/article.html",
            templateUrl: "views/article/main.html",            
            data: {pageTitle: 'Admin Article Template'},
            controller: "ArticleController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            '../assets/global/plugins/dropzone/dropzone.min.js',
                            '../assets/global/plugins/ckeditor/ckeditor.js',
                            'js/controllers/ArticleController.js',
                            'js/services/article.service.js',
                            'js/services/category.service.js',
                            'js/services/picture.service.js'
                        ] 
                    });
                }]
            }
        })


        // Slide
        .state('slide', {
            url: "/slide.html",
            templateUrl: "views/slide/main.html",            
            data: {pageTitle: 'Admin Slide Template'},
            controller: "SlideController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            '../assets/global/plugins/dropzone/dropzone.min.js',
                            'js/controllers/SlideController.js',
                            'js/services/slide.service.js'
                        ] 
                    });
                }]
            }
        })

        // Blank Page
        .state('blank', {
            url: "/blank",
            templateUrl: "views/blank.html",            
            data: {pageTitle: 'Blank Page Template'},
            controller: "BlankController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'js/controllers/BlankController.js'
                        ] 
                    });
                }]
            }
        })


        // User Profile
        .state("profile", {
            url: "/profile",
            templateUrl: "views/profile/main.html",
            data: {pageTitle: 'User Profile'},
            controller: "UserProfileController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',  
                        insertBefore: '#ng_load_plugins_before', // load the above css files before '#ng_load_plugins_before'
                        files: [
                            '../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css',
                            '../assets/pages/css/profile.css',
                            
                            '../assets/global/plugins/jquery.sparkline.min.js',
                            '../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js',

                            '../assets/pages/scripts/profile.min.js',

                            'js/controllers/UserProfileController.js'
                        ]                    
                    });
                }]
            }
        })

        

}]);

/* Init global settings and run the app */
MetronicApp.run(["$rootScope", "settings", "$state", function($rootScope, settings, $state) {
    $rootScope.$state = $state; // state to be accessed from view
    $rootScope.$settings = settings; // state to be accessed from view

}]);