angular.module('MetronicApp')
    .factory('CategoryService', ['$http', '$rootScope', function($http, $rootScope) {

    var urlBase = $rootScope.settings.apiPath + 'category';
    var CategoryService = {};

    CategoryService.getAll = function (params = null) {
        return $http.get(urlBase + '/index?'+ params);
    };

    CategoryService.save = function (cust, id = null) {
        if(id) {
            return $http.post(urlBase + '/save/' + cust.id, cust)
        } else {
            return $http.post(urlBase + '/save', cust)
        }
        
    };

    CategoryService.delete = function (id) {
        return $http.delete(urlBase + '/delete/' + id);
    };

    return CategoryService;
}]);