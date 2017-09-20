// home.js
angular
    .module('chineurs')
    .controller('menuCtrl', menuCtrl);

menuCtrl.$inject = ['menuService','blogCategories','sceneCategories','$state','authService'];
function menuCtrl(menuService,blogCategories,sceneCategories,$state,authService) {

    var menu = this;

    if(authService.userData)
        menu.userRole = authService.userData[0].user_id;

    menu.userRole = 2; //TEMPORAIRE SUPPRIMER APRES


    menu.blogItems = blogCategories;
    menu.sceneItems  = sceneCategories;

    menu.moderation = function(){
        $state.go("menu.moderation",{"id":menu.userRole});
    }

    menu.goToCategorie = function(categorieId,categorieLib){
        $state.go("menu.categorie",{"id" : categorieId, "lib" : categorieLib});
    }

    menu.goToLabels = function(){
        $state.go("menu.label");
    }

    menu.goToPublication = function(){
        console.log("go to publication");
        $state.go("menu.publication");
    }
}