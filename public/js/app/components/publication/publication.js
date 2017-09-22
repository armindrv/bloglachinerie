// home.js
angular
    .module('chineurs')
    .controller('publicationCtrl', publicationCtrl);

publicationCtrl.$inject = ['publicationService','$scope','categories'];
function publicationCtrl(publicationService,$scope,categories) {

    var publication = this;

    publication.image;
    publication.titre;
    publication.selectedCategories = {};
    publication.description;
    publication.htmlVar;


    publication.categories = categories;

    initSelectedCategories();
    console.log(publication.selectedCategories);

    function initSelectedCategories(){
        var s = publication.categories.length;
        while(s--)
            publication.selectedCategories[s] = {
                "id" : s+1,
                "value" : false
            };
    }

    publication.publier = function(){
        var categoriesArray = toCategoriesArray(publication.selectedCategories);
        publicationService.sendArticle(
            publicatin.titre,
            publicatin.image,
            publication.htmlVar,
            publication.htmlVar,
            publication.description,
            categoriesArray
        );
    }

    $scope.imageUploaded = function(image){
        getBase64(image);
    }

    function toCategoriesArray(cat){
        var categoriesArray = [];
        angular.forEach(cat, function(categorie, key) {
            if (categorie.value)
                categoriesArray.push(categorie.id);
        });
        return categoriesArray;
    }

    function getBase64(file) {
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            publication.image = reader.result;
            console.log(publication.image);

        };
        reader.onerror = function (error) {
        console.log('Error: ', error);
    };
}

}