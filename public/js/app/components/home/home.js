// home.js
angular
    .module('chineurs')
    .controller('homeCtrl', homeCtrl);


homeCtrl.$inject = ['homeService','tenArticles','$state'];
function homeCtrl(homeService,tenArticles,$state) {

    var home = this;
    console.log("FUCKTHISSHIT");

    $state.go("menu.article",{ "id": 1});

    home.slides = tenArticles;
    home.articles = tenArticles;
}
