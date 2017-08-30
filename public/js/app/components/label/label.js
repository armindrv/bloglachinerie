// home.js
angular
    .module('chineurs')
    .controller('labelCtrl', labelCtrl);

labelCtrl.$inject = ['labels'];
function labelCtrl(labels) {

    var label = this;
    label.labels = labels;



}