// home.js
angular
    .module('chineurs')
    .controller('disqueCtrl', disquesCtrl);

disquesCtrl.$inject = ['titres','$state','$scope'];
function disquesCtrl(titres,$state,$scope) {

    var disque = this;

    disque.selectedTrack = {
        "index" : -1,
        "status" : 'pause',
        "audio" : null
    };

    disque.info = titres[0];
    disque.titres = titres;
    console.log(disque.titres);

    disque.togglePlay = function(url,trackindex){
        if(disque.selectedTrack.index != trackindex){
            if(disque.selectedTrack.audio != null){
                disque.selectedTrack.audio.pause();
                disque.selectedTrack.status = 'pause';
            }
            disque.selectedTrack.audio = new Audio(url + ".mp3");
                disque.selectedTrack.audio.addEventListener("ended", function(){
                // console.log(disque.titres[trackindex+1]);
                // console.log(disque.titres[trackindex+2].mp3_url,trackindex+1);
                if(disque.titres[trackindex+2] != undefined){
                    disque.togglePlay(disque.titres[trackindex+2].mp3_url,trackindex+1);
                    $scope.$apply();
                }
            });
        }

        if(disque.selectedTrack.status == 'pause'){
            disque.selectedTrack.audio.play();
            disque.selectedTrack.status = 'play';
            console.log("play");
        }else{
            disque.selectedTrack.audio.pause();
            disque.selectedTrack.status = 'pause';
            console.log("pause");
        }



        disque.selectedTrack.index = trackindex;
        // switchPlayStatus();
        // console.log(disque.selectedTrack.status)
    }

    // function switchPlayStatus(){
    //     if(disque.selectedTrack.status == 'pause'){
    //         disque.selectedTrack.status = 'play';
    //     }else {
    //         disque.selectedTrack.status = 'pause';
    //     }
    // }

    // disques.goTodisques = function(idLabel){
    //     console.log("id label : " + idLabel);
    // }

    function playNextTrack(){
        console.log("ended");
    }

}