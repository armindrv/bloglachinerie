angular
    .module('chineurs')
    .factory('menuService',menuService)
    .factory('homeService',homeService)
    .factory('blogService',blogService);

menuService.$inject = ['$http']
function menuService($http){

    var menuService = {};

    menuService.test = "menu service test";

    menuService.getCategoriesBlog = function(){
        return $http.get("categories");
    }

    menuService.getCategoriesScene = function(){
        var categories = {
            "Lyon" : {
                "lib" : "Lyon",
                "id" : 1
            },
            "Paris" : {
                "lib" : "Paris",
                "id" : 2
            },
            "Marseille" : {
                "lib" : "Marseille",
                "id" : 3
            },
            "Toulouse" : {
                "lib" : "Toulouse",
                "id" : 4
            }
        };
        return  categories;
    }

    return menuService;
};

function homeService(){
    var homeService = {};
    homeService.getSlideArticles = function(){
        return {
            "s1" : {
                "imageUrl" : 'public/js/res/slides/1.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "1"
            },
            "s2" : {
                "imageUrl" : 'public/js/res/slides/2.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "2"
            },
            "s3" : {
                "imageUrl" : 'public/js/res/slides/3.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "3"
            },
            "s4" : {
                "imageUrl" : 'public/js/res/slides/4.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "4"
            },
            "s5" : {
                "imageUrl" : 'public/js/res/slides/5.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "5"
            },
        }
    }

    homeService.getPreviewArticlesRecents = function(){
        return {
            "ar1" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "public/js/res/img/1.png",
                "id" : "1"
            },
            "ar2" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "public/js/res/img/2.png",
                "id" : "2"
            },
            "ar3" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "public/js/res/img/3.png",
                "id" : "3"
            },
            "ar4" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "public/js/res/img/4.png",
                "id" : "4"
            },
            "ar5" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "public/js/res/img/5.png",
                "id" : "5"
            },
        }
    }
    return homeService;
};

function blogService(){
    var blogService = {};
    return blogService;
};

