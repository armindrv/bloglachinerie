angular
    .module('chineurs')
    .controller('artisteCtrl', artisteCtrl);

artisteCtrl.$inject = ['artiste'];
function artisteCtrl(artisteData){

    var artiste = this;
    artiste.artistesData = artisteData;
    console.log(artiste.artistesData);

}