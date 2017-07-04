// home.js
angular
    .module('chineurs')
    .controller('menuCtrl', menuCtrl);

menuCtrl.$inject = ['menuService'];
function menuCtrl(menuService) {

    var menu = this;

    console.log(menuService.test);
    menu.blogItems = menuService.getCategoriesBlog();
    menu.sceneItems  = menuService.getCategoriesScene();
}