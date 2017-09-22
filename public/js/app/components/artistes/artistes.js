angular
    .module('chineurs')
    .controller('artistesCtrl', artistesCtrl);

artistesCtrl.$inject = [];
function artistesCtrl(){

    var artistes = this;
    artistes.test = "page artistes !"

}