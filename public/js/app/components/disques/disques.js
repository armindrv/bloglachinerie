// home.js
angular
    .module('chineurs')
    .controller('disquesCtrl', disquesCtrl);

disquesCtrl.$inject = ['disques','$state'];
function disquesCtrl(disquesData,$state) {

    var disques = this;
    disques.disques = disquesData;

    console.log(disques.disques);

    disques.goTodisque = function(idDisque){
        $state.go("menu.disque",{ "id": idDisque});
    }
}