angular.module('MetronicApp')
    .factory('AuthService', ['$http', '$rootScope', function($http, $rootScope) {

    var urlBase = $rootScope.settings.apiPath + 'auth';
    var service = {};

    service.logout = function () {
        return $http.get(urlBase + '/logout');
    };

    service.login = function (cust) {
        return $http.post(urlBase + '/login', cust);
    };

    service.logout = function (cust) {
        return $http.delete(urlBase + '/logout', cust);
    };


    return service;
}]);