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
                authService : function(authService){
                    return authService;
                },
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
                authService : function(authService){
                    return authService;
                },
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

        .state('menu.categorie',{
            url : '/categorie/:id:lib',
            templateUrl : 'public/js/app/components/categorie/categorie.html',
            controller : 'categorieCtrl as categorie',
            resolve: {
                articles : function(categorieService,$stateParams){
                    return categorieService.getArticlesByCategorie($stateParams.id)
                    .then(function(response){
                        return response.data;
                    });
                }
            }
        })

        .state('menu.article',{
            url : '/article/:id',
            templateUrl : 'public/js/app/components/article/article.html',
            controller : 'articleCtrl as article',
            resolve: {
                articleData: function(articleService, $stateParams) {
                    return articleService.getArticle($stateParams.id)
                    .then(function(response){
                        var res = {
                            "content" : response.data[0].content,
                            "titre" : response.data[0].titre,
                            "imageUrl" : response.data[1].content,
                            "id" : response.data[0].id
                        }
                        return res;
                    });
                }
             }
        })

        .state('menu.moderation',{
            url : '/moderation',
            templateUrl : 'public/js/app/components/moderation/moderation.html',
            controller : 'moderationCtrl as moderation',
            resolve: {
                // auth: function(authService,$state){
                //     userId = authService.userData[0].user_id;
                //     if(userId != 1 && userId != 2 && userId != 3){
                //         $state.go('menu.home');
                //     }
                // },
                articles : function(moderationService,authService){
                    userId = 3//authService.userData[0].user_id;
                    return moderationService.getArticles(userId)
                    .then(function(response){
                        return response.data;
                    });
                }
            }
        })


        .state('admin',{
            url : '/admin',
            templateUrl : 'public/js/app/components/login/login.html',
            controller : 'loginCtrl as login',
            resolve: {
                auth: function(authService,$state){
                    if(authService.logged){
                        // todo : rediriger vers page d'admin si il est logué
                        console.log("logged");
                    }
                }
            }
        });


    $urlRouterProvider.otherwise('/menu/home');
}


]);