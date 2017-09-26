angular
    .module('chineurs')
    .controller('inscriptionCtrl', inscriptionCtrl);

inscriptionCtrl.$inject = ['inscriptionService'];
function inscriptionCtrl(inscriptionService){

    var inscription = this;
    inscription.test = "page inscription";
    inscription.data = {};
    inscription.complete = true;


    inscription.sendInscription = function(){
        console.log(inscription.data);
        if(donnesCompletes()){
            inscription.complete = true;
            inscriptionService.inscription(inscription.data);
        }else{
            inscription.complete = false;
        }
    }

    function donnesCompletes(){
        return (
            inscription.data.email.length > 0 &&
            inscription.data.nom.length > 0 &&
            inscription.data.prenom.length > 0 &&
            inscription.data.email.pass > 0 &&
            inscription.data.email.passverif > 0 &&
            (inscription.data.email.passverif === inscription.data.email.pass)
        )
    }

}