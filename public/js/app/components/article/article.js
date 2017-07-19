// home.js
angular
    .module('chineurs')
    .controller('articleCtrl', articleCtrl);

articleCtrl.$inject = ['articleData'];
function articleCtrl(articleData) {

    var article = this;
    article.articleData = articleData;
}