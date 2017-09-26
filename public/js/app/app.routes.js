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
                diggingCategories : function(menuService){
                    return menuService.getCategoriesDigging()
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

        .state('menu.artistes',{
            url : '/artistes',
            templateUrl : 'public/js/app/components/artistes/artistes.html',
            controller : 'artistesCtrl as artistes',
            resolve : {
                artistes : function(artistesService){
                    return artistesService.getAllArtistes()
                    .then(function(response){
                        return response.data;
                    });
                }
            }
        })


        .state('menu.digging',{
            url : '/digging/:id:lib',
            templateUrl : 'public/js/app/components/digging/digging.html',
            controller : 'diggingCtrl as digging',
            resolve : {
                playlists : function(diggingService,$stateParams){
                    return diggingService.getChannelId($stateParams.id)
                    .then(function(response){
                        var channelId = response.data[0].url_channel;
                        return diggingService.getPlaylistByChannelId(channelId)
                        .then(function(response){
                            return response.data.items;
                        });
                    });
                }
            }

        })

        .state('menu.artiste',{
            url : '/artiste/:id',
            templateUrl : 'public/js/app/components/artiste/artiste.html',
            controller : 'artisteCtrl as artiste',
            resolve : {
                artiste : function(artistesService,$stateParams){
                    return artistesService.getArtisteById($stateParams.id)
                    .then(function(response){
                        return response.data[0];
                    })
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

        .state('menu.label',{
            url : '/label',
            templateUrl : 'public/js/app/components/label/label.html',
            controller : 'labelCtrl as label',
            resolve : {
                labels : function(labelService){
                    return labelService.getLabels()
                    .then(function(response){
                        console.log(response);
                        return response.data;
                    });
                }
            }
        })

        .state('menu.disques',{
            url : '/disques/:id',
            templateUrl : 'public/js/app/components/disques/disques.html',
            controller : 'disquesCtrl as disques',
            resolve : {
                disques : function(disquesService,$stateParams){
                    return disquesService.getDisques($stateParams.id)
                    .then(function(response){
                        console.log(response);
                        return response.data;
                    })
                }
            }
        })

        .state('menu.disque',{
            url : '/disque/:id',
            templateUrl : 'public/js/app/components/disque/disque.html',
            controller : 'disqueCtrl as disque',
            resolve : {
                titres : function(disqueService,$stateParams){
                    return disqueService.getTitres($stateParams.id)
                    .then(function(response){
                        console.log(response);
                        return response.data;
                    })
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
                            "content" : response.data[1].content,
                            "titre" : response.data[0].titre,
                            "imageUrl" : response.data[2].content,
                            "id" : response.data[0].id
                        }
                        return res;
                    });
                }
             }
        })

        .state('menu.article-moderation',{
            url : '/article-moderation/:id',
            templateUrl : 'public/js/app/components/moderation/article-moderation/article-moderation.html',
            controller : 'articleModerationCtrl as articleModeration',
            resolve: {
                // auth: function(authService,$state){
                //     userId = authService.userData[0].user_id;
                //     if(userId != 1 && userId != 2 && userId != 3){
                //         $state.go('menu.home');
                //     }
                // },
                moderation : function(moderationService){
                    return moderationService;
                },
                articleData: function(articleService, $stateParams) {
                    return articleService.getArticle($stateParams.id)
                    .then(function(response){
                        var res = {
                            "content" : response.data[1].content,
                            "titre" : response.data[0].titre,
                            "imageUrl" : response.data[2].content,
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
                moderation : function(moderationService){
                    return moderationService;
                },
                articles : function(moderationService,authService){
                    userId = 2//authService.userData[0].user_id;
                    return moderationService.getArticles(userId)
                    .then(function(response){
                        return response.data;
                    });
                }
            }
        })


        // .state('admin',{
        //     url : '/admin',
        //     templateUrl : 'public/js/app/components/login/login.html',
        //     controller : 'loginCtrl as login',
        //     resolve: {
        //         auth: function(authService,$state){
        //             if(authService.logged){

        //                 console.log("logged");
        //             }
        //         }
        //     }
        // })


        .state('inscription',{
            url : '/inscription',
            templateUrl : 'public/js/app/components/inscription/inscription.html',
            controller : 'inscriptionCtrl as inscription',
            resolve : {
                inscriptionService: function(inscriptionService){
                    return inscriptionService;
                },
            }
        })


        .state('login',{
            url : '/login',
            templateUrl : 'public/js/app/components/login/login.html',
            controller : 'loginCtrl as login',
        })

        .state('menu.merci',{
            url : '/merci',
            templateUrl : 'public/js/app/components/publication/merci.html',
            controller : 'publicationCtrl as publication'
        })

        .state('menu.publication',{
            url : '/publication',
            templateUrl : 'public/js/app/components/publication/publication.html',
            controller : 'publicationCtrl as publication',
            resolve: {
                publicationService: function(publicationService){
                    return publicationService;
                },
                categories : function(categorieService){
                    return categorieService.getAllCategories()
                    .then(function(response){
                        return response.data;
                    });
                }
            }

        });


    $urlRouterProvider.otherwise('/menu/home');
}


]);