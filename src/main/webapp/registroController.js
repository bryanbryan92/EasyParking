var app = angular.module('easyparking', []);
app.controller('registroControlador', function ($scope, $http) {

    $scope.guardarRegistro = function () {
        console.log('Entra guardar registro');
        let regexNumbers = /^[0-9]*$/;
        let regexLetters = /^[A-Za-z]+$/;
        if ($scope.placa === undefined || $scope.modelo === undefined || $scope.color === undefined || $scope.vehiculo === undefined) {
            alert("Todos los campos son obligatorios");
        } else if (!regexNumbers.test($scope.modelo)) {
            alert("El modelo debe ser un año");
        } else if (!regexLetters.test($scope.color)) {
            alert("El color debe ser escrito en letras");
        } else if (!regexLetters.test($scope.vehiculo)) {
            alert("El vehiculo debe ser escrito en letras");
        } else {
            let registro = {
                proceso: 'guardarRegistro',
                placa: $scope.placa,
                modelo: $scope.modelo,
                color: $scope.color,
                vehiculo: $scope.vehiculo
            };
            $http({
                method: 'POST',
                url: 'peticionesRegistro.jsp',
                params: registro
            }).then(function (respuesta) {
                console.log(respuesta);
                alert("Guardado con Exito");
            }).catch(function (error) {
                alert("Servicio no disponible, intente mas tarde");
                console.log(error);
            });
        }
    };

    $scope.listarRegistros = function () {
        $scope.mostrarListaRegistros = true;
        let params = {
            proceso: 'listarRegistros'
        };

        $http({
            method: 'GET',
            url: 'peticionesRegistro.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.registros = respuesta.data.Registros;
//            console.log(respuesta);
        });
    };

    $scope.borrarRegistro = function () {
        let params = {
            proceso: 'borrarRegistro',
            placa: $scope.idParaEliminar
        };
        console.log(params);
        $http({
            method: 'GET',
            url: 'peticionesRegistro.jsp',
            params: params
        }).then(function (respuesta) {
            console.log(respuesta);
            if (respuesta.data.borrarRegistro) {
                alert("Borrado Exitoso");
                $scope.listarRegistros();
            } else {
                alert("Falla al borrar registro");
            }
        });
    };

    $scope.actualizarRegistro = function () {
        let params = {
            proceso: 'actualizarRegistro',
//            id_registro: $scope.id_registro,
            placa: $scope.placa,
            modelo: $scope.modelo,
            color: $scope.color,
            vehiculo: $scope.vehiculo
        };
//        console.log(params);
        $http({
            method: 'GET',
            url: 'peticionesRegistro.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarRegistro) {
                alert("Actualizado Exitoso");
                $scope.listarRegistros();
            } else {
                alert("Falla al actualizar registro");
            }
        });
    };

    $scope.mostrarFormulario = function () {
        $scope.mostrarListaRegistros = false;
        $scope.actualizar = false;
        $scope.placa = undefined;
        $scope.modelo = undefined;
        $scope.color = undefined;
        $scope.vehiculo = undefined;
    };

    $scope.mostrarFormularioActualizar = function (registro) {
        $scope.mostrarListaRegistros = false;
        $scope.actualizar = true;
        $scope.placa = registro.placa;
        $scope.modelo = registro.modelo;
        $scope.color = registro.color;
        $scope.vehiculo = registro.vehiculo;
    };
    
    $scope.abrirModal = function (placa) {
        $scope.idParaEliminar = placa;
        var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
            keyboard: false
        });
        myModal.show();
    };
});

