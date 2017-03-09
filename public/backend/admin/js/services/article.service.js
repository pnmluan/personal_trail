angular.module('MetronicApp')
    .factory('ArticleService', ['$http', '$rootScope', function($http, $rootScope) {

    var urlBase = $rootScope.settings.apiPath + 'article';
    var ArticleService = {};

    ArticleService.getAll = function (params = null) {
        return $http.get(urlBase + '/index?'+ params);
    };

    ArticleService.save = function (cust, id = null) {
        if(id) {
            return $http.post(urlBase + '/save/' + cust.id, cust)
        } else {
            return $http.post(urlBase + '/save', cust)
        }
        
    };

    ArticleService.delete = function (id) {
        return $http.delete(urlBase + '/delete/' + id);
    };

    return ArticleService;
}]);