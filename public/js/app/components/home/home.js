// home.js
angular
    .module('chineurs')
    .controller('homeCtrl', homeCtrl);


homeCtrl.$inject = ['homeService','tenArticles','$state'];
function homeCtrl(homeService,tenArticles,$state) {

    var home = this;

    home.goToArticle = function(id){
        $state.go("menu.article",{ "id": id});
    }


    home.slides = tenArticles;
    home.articles = tenArticles;
}
