// home.js
angular
    .module('chineurs')
    .controller('menuCtrl', menuCtrl);

menuCtrl.$inject = ['menuService','blogCategories','diggingCategories','sceneCategories','$state','authService'];
function menuCtrl(menuService,blogCategories,diggingCategories,sceneCategories,$state,authService) {

    var menu = this;

    getAuthData();

    function getAuthData(){
        menu.logged = authService.logged;

        if(menu.logged){
            menu.userRole = authService.userData[0].user_id;
        }else{
            //non connecté
            menu.userRole = 4; // USER
        }
    }


    menu.blogItems = blogCategories;
    menu.diggingItems = diggingCategories;
    console.log(menu.diggingItems);
    menu.sceneItems  = sceneCategories;

    menu.login = function(){
        $state.go("login");
    }

    menu.logoff = function(){
        authService.logout();
        getAuthData();
    }

    menu.goToDigging = function(id,lib){
        $state.go("menu.digging",{"id":id,"lib":lib});
    }

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

    menu.goToArtistes = function(){
        console.log("go to Artistes");
        $state.go("menu.artistes");
    }
}