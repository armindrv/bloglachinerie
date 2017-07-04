// home.js
angular
    .module('chineurs')
    .controller('homeCtrl', homeCtrl);


homeCtrl.$inject = ['homeService'];
function homeCtrl(homeService) {

    var home = this;
    home.slides = homeService.getSlideArticles();
    home.articles = homeService.getPreviewArticlesRecents();
}
