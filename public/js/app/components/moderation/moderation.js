// home.js
angular
    .module('chineurs')
    .controller('moderationCtrl', moderationCtrl);


moderationCtrl.$inject = ['authService','$state','articles'];
function moderationCtrl(authService,$state,articles) {

    var moderation = this;

    moderation.articles = articles;

    moderation.goToArticle = function(id){
        $state.go("menu.article-moderation",{ "id": id});
    }
}
