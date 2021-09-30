<%-- 
    Document   : index
    Created on : Sep 20, 2021, 12:27:06 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>

        <title>Registro</title>
    </head>
    <body>
        <div class="container-fluid" ng-app="easyparking" ng-controller="registroControlador">
            <div class="row d-flex justify-content-center">     
                <div class="col-6" style="text-align: center"><h1>REGISTRO</h1></div>  
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-6">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Placa</label>
                        <input type="text" class="form-control" placeholder="Escriba la placa" ng-model="placa">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Modelo</label>
                        <input type="text" class="form-control" placeholder="Escriba el modelo" ng-model="modelo">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Color</label>
                        <input type="text" class="form-control" placeholder="Escriba su color" ng-model="color">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Vehiculo</label>
                        <input type="text" class="form-control" placeholder="Que vehiculo es?" ng-model="vehiculo">
                    </div>
                    <button type="button" class="btn btn-success" ng-click="guardarRegistro()">Guardar</button>
                </div>
            </div>
    </body>
    <script src="registroCtrl.js"></script>
</html>
