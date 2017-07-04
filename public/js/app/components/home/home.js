// home.js
angular
    .module('chineurs')
    .controller('homeCtrl', homeCtrl);


homeCtrl.$inject = ['homeService'];
function homeCtrl(homeService) {

    var home = this;
    home.test = "home";
    home.slides = {};
    home.slides["1"] = {image: "res/slides/1.png"};
    home.slides["2"] = {image: "res/slides/2.png"};
    home.slides["3"] = {image: "res/slides/3.png"};
    console.log(home.slides);

}
