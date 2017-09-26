angular
    .module('chineurs')
    .controller('diggingCtrl', diggingCtrl);

diggingCtrl.$inject = ['playlists','$sce','$stateParams'];
function diggingCtrl(playlists,$sce,$stateParams){

    var digging = this;
    digging.playlists = playlists;
    digging.playlistUrls = [];


    console.log(digging.playlists);


    digging.title = $stateParams.lib;
    // console.log(digging.playlists.length);
    for(var i = 0; i<digging.playlists.length; i++){
        digging.playlistUrls.push({
        "titre" : digging.playlists[i].snippet.title,
        "url" : $sce.trustAsResourceUrl("https://www.youtube.com/embed/?listType=playlist&list="+digging.playlists[i].id)
        });
    }

}