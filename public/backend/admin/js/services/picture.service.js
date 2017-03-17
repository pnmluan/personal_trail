angular.module('MetronicApp')
    .factory('PictureService', ['$http', '$rootScope', 'Upload', function($http, $rootScope, Upload) {

    var urlBase = $rootScope.settings.apiPath + 'picture';
    var service = {};

    service.getAll = function (params = null) {
        console.log(params);
        return $http.get(urlBase + '/index?' + params);
    };

    service.save = function (imgs, cust, id = null) {
        if(id) {
            return Upload.upload({
                url: urlBase + '/save/' + cust.id,
                data: {
                    data: cust,
                    filepaths: imgs
                },
            });
        } else {
            return Upload.upload({
                url: urlBase + '/save',
                data: {
                    data: cust,
                    filepaths: imgs
                },
            });
        }
        
    };

    service.delete = function (id) {
        return $http.delete(urlBase + '/delete/' + id);
    };

    return service;
}]);