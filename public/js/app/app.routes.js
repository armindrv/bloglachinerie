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
                sceneCategories : function(menuService){
                    return  menuService.getCategoriesScene()
                    .then(function(response){
                        return response.data;
                    });
                },
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
                },
                tenArticles : function(homeService){
                    return homeService.getArticles()
                    .then(function(response){
                        console.log(response);
                        return response.data;
                    });
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

        .state('menu.article',{
            url : '/article/:id',
            templateUrl : 'public/js/app/components/article/article.html',
            controller : 'articleCtrl as article',
            // resolve: {
            //     articleData: function(articleService, $stateParams) {
            //         return articleService.getArticle($stateParams.id)
            //         .then(function(response){
            //             return response.data;
            //         });
            //     }
            //  }
        })


    $urlRouterProvider.otherwise('/menu/home');
}


]);