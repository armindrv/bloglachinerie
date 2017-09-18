// home.js
angular
    .module('chineurs')
    .controller('labelCtrl', labelCtrl);

labelCtrl.$inject = ['labels','$state'];
function labelCtrl(labels,$state) {

    var label = this;
    label.labels = labels;

    label.goTodisques = function(idLabel){
        $state.go("menu.disques",{"id":idLabel});
    }

}