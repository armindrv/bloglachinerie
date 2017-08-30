// home.js
angular
    .module('chineurs')
    .controller('articleModerationCtrl', articleModerationCtrl);

articleModerationCtrl.$inject = ['articleData','moderation','$state'];
function articleModerationCtrl(articleData,moderation,$state) {


    var articleModeration = this;
    articleModeration.articleData = articleData;

    articleModeration.changeStatut = function(statut){
        console.log(statut);
        moderation.changeStatut(articleModeration.articleData.id,statut);
        $state.go("menu.moderation");
    }


    console.log(articleData);
}