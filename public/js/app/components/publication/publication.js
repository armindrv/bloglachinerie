// home.js
angular
    .module('chineurs')
    .controller('publicationCtrl', publicationCtrl);

publicationCtrl.$inject = ['publicationService','$scope','categories'];
function publicationCtrl(publicationService,$scope,categories) {

    var publication = this;

    publication.image = null;
    publication.titre = "";
    publication.selectedCategories = {};
    publication.description = "";
    publication.htmlVar = "";
    publication.formIncomplete = false;


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


        console.log("categories : " + (categoriesArray.length > 0));
        console.log("titre : " + (publication.titre.length > 0));
        console.log("image : " + (publication.image != null));
        console.log("html : " + (publication.htmlVar.length > 0));
        console.log("description : " + (publication.description > 0));


        if(
            publication.titre.length > 0 &&
            publication.image != null &&
            publication.htmlVar.length > 0 &&
            publication.description.length > 0 &&
            categoriesArray.length > 0
        ){
            publication.formIncomplete = false;
            publicationService.sendArticle(
                publication.titre,
                publication.image,
                publication.htmlVar,
                publication.description,
                categoriesArray
            );
        }else{
            publication.formIncomplete = true;
        }
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