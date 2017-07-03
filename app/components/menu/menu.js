// home.js
angular
    .module('chineurs')
    .controller('menuCtrl', menuCtrl);

menuCtrl.$inject = ['menuService'];
function menuCtrl(menuService) {

    var menu = this;


    menu.blogItems = menuService.getCategoriesBlog();

    console.log(menu.blogItems);
    menu.sceneItems  = menuService.getCategoriesScene();
    menu.title = "this is menu!"
}