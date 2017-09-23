angular
    .module('chineurs')
    .controller('categorieCtrl', categorieCtrl);

categorieCtrl.$inject = ['articles','$state','$stateParams']
function categorieCtrl(articles,$state,$stateParams) {


    var categorie = this;
    categorie.articles = articles;
    console.log(categorie.articles);
    categorie.lib = $stateParams.lib;

    categorie.goToArticle = function(id){
        $state.go("menu.article",{ "id": id});
    }
}
