var app = angular.module('easyparking',[]);
app.controller('registroControlador',function($scope, $http){
    $scope.guardarRegistro = function(){
        console.log('Entra guardar registro');
        let registro ={
            proceso:'guardarRegistro',
            placa: $scope.placa,
            modelo: $scope.modelo,
            color: $scope.color,
            vehiculo: $scope.vehiculo
        };
        
        $http({
            method: 'POST',
            url: 'peticionesRegistro.jsp',
            params: registro
        }).then(function(respuesta){
            console.log(respuesta);
            alert("Guardado con Exito");
        });
    }
});

