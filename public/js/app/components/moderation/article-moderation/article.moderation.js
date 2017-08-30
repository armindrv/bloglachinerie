// home.js
angular
    .module('chineurs')
    .controller('articleModerationCtrl', articleModerationCtrl);

articleModerationCtrl.$inject = ['articleData','moderation'];
function articleModerationCtrl(articleData,moderation) {


    var articleModeration = this;
    articleModeration.articleData = articleData;

    articleModeration.changeStatut = function(statut){
        console.log(statut);
        moderation.changeStatut(articleModeration.articleData.id,statut);
    }


    console.log(articleData);
}