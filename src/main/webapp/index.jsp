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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>

        <title>Registro</title>
    </head>
    <body>
        <div ng-app="easyparking" ng-controller="registroControlador">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="mostrarFormulario()">Guardar registro</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listarRegistros()">Listar registros</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container-fluid" ng-show="!mostrarListaRegistros">
                <div class="row d-flex justify-content-center">     
                    <div class="col-6" style="text-align: center" ng-show="!actualizar"><h1>FORMULARIO DE REGISTRO</h1></div>  
                    <div class="col-6" style="text-align: center" ng-show="actualizar"><h1>ACTUALIZAR REGISTRO</h1></div>  
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Placa*</label>
                            <input type="text" class="form-control" placeholder="Escriba la placa" ng-model="placa" ng-disabled="actualizar">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Modelo*</label>
                            <input type="text" class="form-control" placeholder="Escriba el modelo" ng-model="modelo">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Color*</label>
                            <input type="text" class="form-control" placeholder="Escriba su color" ng-model="color">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Vehiculo*</label>
                            <input type="text" class="form-control" placeholder="Que vehiculo es?" ng-model="vehiculo">
                        </div>
                        <button type="button" class="btn btn-success" ng-click="guardarRegistro()" ng-show="!actualizar">Guardar</button>
                        <button type="button" class="btn btn-success" ng-click="actualizarRegistro()" ng-show="actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
            <div class="container-fluid" ng-show="mostrarListaRegistros">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center"><h1>Lista de registros</h1></div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            
                            <th scope="col">Placa</th>
                            <th scope="col">Modelo</th>
                            <th scope="col">Color</th>
                            <th scope="col">Vehiculo</th>
                            <th scope="col">Actualizar</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="registro in registros">
                            
                            <td>{{registro.placa}}</td>      
                            <td>{{registro.modelo}}</td>
                            <td>{{registro.color}}</td>
                            <td>{{registro.vehiculo}}</td>
                            <td style="cursor: pointer" ng-click="mostrarFormularioActualizar(registro)">Actualizar</td>
                            <td style="cursor: pointer" ng-click="abrirModal(registro.placa)">Borrar</td>
                        </tr>
                    </tbody>
                </table>
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Borrar registro</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Está seguro que desea eliminar el registro?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" ng-click="borrarRegistro()">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="registroController.js"></script>
</html>
