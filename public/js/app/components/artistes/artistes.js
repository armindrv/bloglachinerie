angular
    .module('chineurs')
    .controller('artistesCtrl', artistesCtrl);

artistesCtrl.$inject = ['artistes','$state'];
function artistesCtrl(artistesData,$state){

    var artistes = this;
    artistes.artistesData = artistesData;
    artistes.test = "page artistes !"

    artistes.gotToArtiste = function(idArtiste){
        $state.go("menu.artiste",{ "id": idArtiste});
    }
}