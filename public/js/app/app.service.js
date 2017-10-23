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
    .factory('diggingService',diggingService)
    .factory('inscriptionService',inscriptionService)
    .factory('labelService',labelService);



inscriptionService.$inject = ['$http'];
function inscriptionService($http){
    var inscriptionService = {};

    inscriptionService.inscription = function(data){
        $http({
            method: 'POST',
            url: './signup',
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function (response) {
            console.log(response);
        });
    }

    return inscriptionService;
}


diggingService.$inject = ['$http'];
function diggingService($http){
    var diggingService = {};


    diggingService.getChannelId = function(id){

        // $http.get("get_youtube_channel/"+id).then(function(response){
        //     var channel = response.data[0].url_channel;
        //     return $http.get("https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId="+channel+"&key=AIzaSyAnvhgRi09RUGMxnQoux0WitkqJqEKaM0M");
        // });

        return $http.get("get_youtube_channel/"+id);

    }


    diggingService.getPlaylistByChannelId = function(channelId){
        return $http.get("https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId="+channelId+"&key=AIzaSyAnvhgRi09RUGMxnQoux0WitkqJqEKaM0M");
    }

    return diggingService;
}


artistesService.$inject = ['$http'];
function artistesService($http){
    var artistesService = {};


    artistesService.getArtisteById = function(id){
        console.log(id);
        return $http.get("artiste/"+id);
    }

    artistesService.getAllArtistes = function(){
        return $http.get("artistes/all");
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


    authService.getUserData = function(){
        return $http.get("get_user");
    }


    authService.logout = function(){
        console.log("logout");
        authService.logged = false;
        authService.userData = null;
        $http.get("logout_user");
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
                return false;
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

    menuService.getCategoriesDigging = function(){
        return $http.get("categoriesDigging");
    }

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

