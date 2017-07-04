angular
    .module('chineurs')
    .config(['$stateProvider','$urlRouterProvider','$locationProvider',


function ($stateProvider,$urlRouterProvider,$locationProvider){
    $stateProvider
        .state('menu',{
            url : '/menu',
            templateUrl : '/app/components/menu/menu.html',
            controller : 'menuCtrl as menu',
            resolve: {
                menuService : function(menuService){
                    return menuService;
                }
            }
        })

        .state('menu.home',{
            url : '/home',
            templateUrl : '/app/components/home/home.html',
            controller : 'homeCtrl as home',
            resolve: {
                homeService : function(homeService){
                    return homeService;
                }
            }
        })


        .state('menu.blog',{
            url : '/blog',
            templateUrl : '/app/components/blog/blog.html',
            controller : 'blogCtrl as blog',
            resolve: {
                blogService : function(blogService){
                    return blogService;
                }
            }
        })


    $urlRouterProvider.otherwise('/menu/home');
}


]);