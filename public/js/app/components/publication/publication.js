// home.js
angular
    .module('chineurs')
    .controller('publicationCtrl', publicationCtrl);

publicationCtrl.$inject = [];
function publicationCtrl() {

    var publication = this;
    publication.htmlVar;
    publication.image;


    publication.publier = function(){
        console.log(publication.htmlVar);
        // console.log(publication.image);
    }

}