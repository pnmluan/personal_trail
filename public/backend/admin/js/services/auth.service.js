angular.module('MetronicApp')
    .factory('AuthService', ['$http', '$rootScope', function($http, $rootScope) {

    var urlBase = $rootScope.settings.apiPath + 'auth';
    var AuthService = {};

    AuthService.logout = function () {
        return $http.get(urlBase + '/logout');
    };

    AuthService.login = function (cust) {
        return $http.post(urlBase + '/login', cust);
    };


    return AuthService;
}]);