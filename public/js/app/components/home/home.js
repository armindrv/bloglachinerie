// home.js
angular
    .module('chineurs')
    .controller('homeCtrl', homeCtrl);


homeCtrl.$inject = ['homeService','tenArticles','$state','authService'];
function homeCtrl(homeService,tenArticles,$state,authService) {

    var home = this;

    console.log(authService.userData);

    home.goToArticle = function(id){
        $state.go("menu.article",{ "id": id});
    }


    home.slides = tenArticles;
    home.articles = tenArticles;
}
