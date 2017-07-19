// home.js
angular
    .module('chineurs')
    .controller('menuCtrl', menuCtrl);

menuCtrl.$inject = ['menuService','blogCategories','sceneCategories','$state'];
function menuCtrl(menuService,blogCategories,sceneCategories,$state) {

    var menu = this;

    menu.blogItems = blogCategories;
    menu.sceneItems  = sceneCategories;

    menu.goToCategorie = function(categorieId,categorieLib){
        $state.go("menu.categorie",{"id" : categorieId, "lib" : categorieLib});
    }
}