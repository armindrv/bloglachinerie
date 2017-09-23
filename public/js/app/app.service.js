angular
    .module('chineurs')
    .factory('menuService',menuService)
    .factory('homeService',homeService)
    .factory('articleService',articleService)
    .factory('categorieService',categorieService)
    .factory('blogService',blogService)
    .factory('authService',authService)
    .factory('moderationService',moderationService)
    .factory('disquesService',disquesService)
    .factory('disqueService',disqueService)
    .factory('publicationService',publicationService)
    .factory('artistesService',artistesService)
    .factory('labelService',labelService);



artistesService.$inject = ['$http'];
function artistesService($http){
    var artistesService = {};


    artistesService.getArtisteById = function(id){
        return {
            "id" : 1,
            "image_url" : "resources/img/1/1.png",
            "nom" : "artiste1",
            "biographie" : "Donec sed odio dui. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam id dolor id nibh ultricies vehicula ut id elit. Donec ullamcorper nulla non metus auctor fringilla. Donec sed odio dui.",
            "sc_link" : "https://soundcloud.com/postmalone"
        }
    }

    artistesService.getAllArtistes = function(){

        return {
            "01" : {
                "id" : 1,
                "image_url" : "resources/img/1/1.png",
                "nom" : "artiste1"
            },
            "02" : {
                "id" : 2,
                "image_url" : "resources/img/2/2.png",
                "nom" : "artiste2"
            },
            "03" : {
                "id" : 3,
                "image_url" : "resources/img/3/3.png",
                "nom" : "artiste3"
            },
            "04" : {
                "id" : 4,
                "image_url" : "resources/img/4/4.png",
                "nom" : "artiste4"
            },
            "05" : {
                "id" : 5,
                "image_url" : "resources/img/1/1.png",
                "nom" : "artiste5"
            },
            "06" : {
                "id" : 6,
                "image_url" : "resources/img/2/2.png",
                "nom" : "artiste6"
            },
            "07" : {
                "id" : 7,
                "image_url" : "resources/img/3/3.png",
                "nom" : "artiste7"
            },
            "08" : {
                "id" : 8,
                "image_url" : "resources/img/4/4.png",
                "nom" : "artiste8"
            }
        }
    }
    return artistesService;
}



publicationService.$inject = ['$http'];
function publicationService($http){
    var publicationService = {};

    publicationService.test = "PICKLE RIIICK";

    publicationService.sendArticle = function(titre,image,article,description,categories){
        var data = {
            'titre' : titre,
            'image' : image,
            'article' : article,
            'description' : description,
            'categories' : categories
        };
        $http({
            method: 'POST',
            url: './create_article',
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function (response) {
            console.log(response);
        });
    }
    return publicationService;
}


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

    authService.logout = function(){
        authService.logged = false;
        authService.userData = null;
        $state.go('menu.home')
    }

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
                console.log(authService.userData);
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

    categorieService.getAllCategories = function(){
        return $http.get("all_categories");
    }

    return categorieService;
}

labelService.$inject = ['$http'];
function labelService($http){
    var labelService = {};

    labelService.getLabels = function(){
        return $http.get("label_list");
    }

    return labelService;
}

disquesService.$inject = ['$http'];
function disquesService($http){
    var disquesService = {};

    disquesService.getDisques = function(id){
        return $http.get("label_releases/"+id);
    }

    return disquesService;
}

disqueService.$inject = ['$http'];
function disqueService($http){
    var disqueService = {};

    disqueService.getTitres = function(id){
        return $http.get("disques/"+id);
    }

    return disqueService;
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

