angular
    .module('chineurs')
    .config(['$stateProvider','$urlRouterProvider','$locationProvider',


function ($stateProvider,$urlRouterProvider,$locationProvider){
    $stateProvider
        .state('menu',{
            url : '/',
            templateUrl : '/app/components/menu/menu.html',
            controller : 'menuCtrl as menu',
            resolve: {
                menuService : function(menuService){
                    return menuService;
                }
            }
        })
    $urlRouterProvider.otherwise('/');
}


]);