// home.js
angular
    .module('chineurs')
    .controller('loginCtrl', loginCtrl);


loginCtrl.$inject = ['authService','$state'];
function loginCtrl(authService,$state) {

    var login = this;
    login.correct = true;

    login.auth = function(email,password){
        login.correct = authService.login(email,password);
    }
}
