<%-- 
    Document   : peticionesRegistro
    Created on : Sep 22, 2021, 6:14:13 PM
    Author     : bryan
--%>

<%@page import="logica.Registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String respuesta="{";
    String proceso=request.getParameter("proceso");
    switch(proceso){
        case "guardarRegistro":
            Registro registro=new Registro();
            System.out.println("guardarRegistro exitoso");
            registro.setPlaca(request.getParameter("placa"));
            registro.setModelo(request.getParameter("modelo"));
            registro.setColor(request.getParameter("color"));
            registro.setVehiculo(request.getParameter("vehiculo"));
            if(registro.guardarRegistro()){
                respuesta += "\"" + proceso + "\": true";
            }else{
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "actualizarRegistro":
        case "listarRegistros":
        default:
    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>
