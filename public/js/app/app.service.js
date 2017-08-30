angular
    .module('chineurs')
    .factory('menuService',menuService)
    .factory('homeService',homeService)
    .factory('articleService',articleService)
    .factory('categorieService',categorieService)
    .factory('blogService',blogService)
    .factory('authService',authService)
    .factory('moderationService',moderationService);


moderationService.$inject = ['$http','$state'];
function moderationService($http,$state){

    var moderationService = {};

    //modifie le statut de l'article
    moderationService.changeStatut = function(idArticle,statut){
        var data = {
            'idArticle' : idArticle,
            'statut' : statut
        };
        $http({
            method: 'POST',
            url: './set_article_status',
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function (response) {
            console.log(response);
        });
    }

    moderationService.getArticles = function(id){
        return $http.get("moderation_article/"+id);
    }


    return moderationService;

}

authService.$inject = ['$http','$state'];
function authService($http,$state){
    var authService = {};

    authService.logged = false;

    authService.userData = null;


    authService.login = function(email,password){
        var FormData = {
            'email' : email,
            'password' : password
        };
        $http({
            method: 'POST',
            url: './login',
            data: FormData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function (response) {
            if(response.data){
                authService.logged = true;
                authService.userData = response.data;
                $state.go('menu.home')
            }else{
                console.log("not logged");
            }
        });
    }

    return authService;
}

categorieService.$inject = ['$http'];
function categorieService($http){
    var categorieService = {};

    categorieService.getArticlesByCategorie = function(idCategorie){
        return $http.get("categorie/"+idCategorie);
    }

    return categorieService;
}

articleService.$inject = ['$http'];
function articleService($http){
    var articleService = {};

    articleService.getArticle = function(id){
        return $http.get("article/"+id);
    }

    return articleService;
}

menuService.$inject = ['$http'];
function menuService($http){

    var menuService = {};

    menuService.test = "menu service test";

    menuService.getCategoriesBlog = function(){
        return $http.get("categoriesBlog");
    }

    menuService.getCategoriesScene = function(){
        return $http.get("categoriesLocale");
    }

    return menuService;
};

menuService.$inject = ['$http'];
function homeService($http){
    var homeService = {};


    homeService.getArticles = function(){
        return $http.get("firstTenArticles");
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

