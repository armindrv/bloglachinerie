// blog.js
angular
    .module('chineurs')
    .controller('blogCtrl', blogCtrl);

blogCtrl.$inject = ['blogService'];
function blogCtrl(blogService) {

    var blog = this;
    blog.test = "BLOG BITCH!"
}