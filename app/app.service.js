angular
    .module('chineurs')
    .factory('menuService',menuService)
    .factory('homeService',homeService)
    .factory('blogService',blogService);


function menuService(){

    var menuService = {};

    menuService.test = "menu service test";

    menuService.getCategoriesBlog = function(){

        var categories = {
            "hiphop" : {
                "lib" : "Hip Hop",
                "id" : 1
            },
            "techno" : {
                "lib" : "Techno",
                "id" : 2
            },
            "soul" : {
                "lib" : "Soul",
                "id" : 3
            },
            "house" : {
                "lib" : "House",
                "id" : 4
            },
            "raggae" : {
                "lib" : "Raggae",
                "id" : 5
            }
        };
        return  categories;
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
                "imageUrl" : 'res/slides/1.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "1"
            },
            "s2" : {
                "imageUrl" : 'res/slides/2.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "2"
            },
            "s3" : {
                "imageUrl" : 'res/slides/3.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "3"
            },
            "s4" : {
                "imageUrl" : 'res/slides/4.png',
                "titre" : "Tellus Commodo Pharetra",
                "id" : "4"
            },
            "s5" : {
                "imageUrl" : 'res/slides/5.png',
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
                "imageUrl" : "res/img/1.png",
                "id" : "1"
            },
            "ar2" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "res/img/2.png",
                "id" : "2"
            },
            "ar3" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "res/img/3.png",
                "id" : "3"
            },
            "ar4" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "res/img/4.png",
                "id" : "4"
            },
            "ar5" : {
                "titre" : "Tellus Commodo Pharetra",
                "preview" : "Nulla vitae elit libero, a pharetra augue.",
                "imageUrl" : "res/img/5.png",
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

