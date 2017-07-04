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
    homeService.test = "homeservice";
    return homeService;
};

function blogService(){
    var blogService = {};
    blogService.test = "blog service is working!";
    return blogService;
};

