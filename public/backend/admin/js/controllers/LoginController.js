angular.module('MetronicApp').controller('LoginController', function($rootScope, $scope, $http, $base64, $timeout, $location, $q, AuthService, ngDialog, toastr) {
    $scope.$on('$viewContentLoaded', function() {
        // initialize core components
        App.initAjax();
        // toastr.info('We are open today from 10 to 22', 'Information');
    });

    mine = $scope;
    initialize();

    $scope.classNameStatus = function(status) {
        switch(status) {
            case 'active':
                return 'label label-sm label-success';
            case 'inactive':
                return 'label label-sm label-danger';
        }
    };

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = false;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;

    function initialize() {
        
    }

    function loadListItem() {
        // BannerService.getBanners().then(function(res) {

        //     if(res.statusText == 'OK') {
        //         $scope.listItem = res.data.data;
        //         return $scope.listItem;
        //     }
        //     return;
            
        // });
    }
});
