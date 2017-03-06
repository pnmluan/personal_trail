angular.module('MetronicApp')
    .factory('UserService', ['$http', '$rootScope', function($http, $rootScope) {

    var urlBase = $rootScope.settings.apiPath + 'user';
    var UserService = {};

    UserService.getAll = function (params = null) {
        return $http.get(urlBase + '/index?'+ params);
    };

    UserService.save = function (cust, id = null) {
        if(id) {
            return $http.post(urlBase + '/save/' + cust.id, cust)
        } else {
            return $http.post(urlBase + '/save', cust)
        }
        
    };

    UserService.delete = function (id) {
        return $http.delete(urlBase + '/delete/' + id);
    };

    return UserService;
}]);