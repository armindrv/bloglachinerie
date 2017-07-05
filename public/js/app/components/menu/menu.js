// home.js
angular
    .module('chineurs')
    .controller('menuCtrl', menuCtrl);

menuCtrl.$inject = ['menuService','blogCategories','sceneCategories'];
function menuCtrl(menuService,blogCategories,sceneCategories) {

    var menu = this;

    menu.blogItems = blogCategories;
    menu.sceneItems  = sceneCategories;
}