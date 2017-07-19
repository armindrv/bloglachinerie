// home.js
angular
    .module('chineurs')
    .controller('loginCtrl', loginCtrl);


loginCtrl.$inject = ['authService','$state'];
function loginCtrl(authService,$state) {

    var login = this;

    login.auth = function(email,password){
        authService.login(email,password);
    }
}
