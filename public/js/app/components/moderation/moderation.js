// home.js
angular
    .module('chineurs')
    .controller('moderationCtrl', moderationCtrl);


moderationCtrl.$inject = ['authService','$state','articles'];
function moderationCtrl(authService,$state,articles) {

    var moderation = this;
    moderation.articles = [ { "id": "3", "title": "Kerry Chandler de retour à Lyon !", "categorie_id": "4", "statut": null }, { "id": "3", "title": "Kerry Chandler de retour à Lyon !", "categorie_id": "3", "statut": null }, { "id": "1", "title": "CHOC : Ben Klock n'a jamais su mixer !", "categorie_id": "2", "statut": null } ];

}
