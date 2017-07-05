angular
    .module('chineurs')
    .config(['$stateProvider','$urlRouterProvider','$locationProvider',


function ($stateProvider,$urlRouterProvider,$locationProvider){
    $stateProvider
        .state('menu',{
            url : '/menu',
            templateUrl : 'public/js/app/components/menu/menu.html',
            controller : 'menuCtrl as menu',
            resolve: {
                blogCategories : function(menuService){
                    return menuService.getCategoriesBlog()
                    .then(function(response){
                        return response.data;
                    });
                },
                menuService : function(menuService){
                    menuService.getCategoriesBlog()
                    return menuService;
                }
            }
        })

        .state('menu.home',{
            url : '/home',
            templateUrl : 'public/js/app/components/home/home.html',
            controller : 'homeCtrl as home',
            resolve: {
                homeService : function(homeService){
                    return homeService;
                }
            }
        })


        .state('menu.blog',{
            url : '/blog',
            templateUrl : 'public/js/app/components/blog/blog.html',
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