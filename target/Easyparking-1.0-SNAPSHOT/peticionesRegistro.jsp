<%-- 
    Document   : peticionesRegistro
    Created on : Sep 22, 2021, 6:14:13 PM
    Author     : bryan
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String respuesta="";
    String proceso=request.getParameter("proceso");
    //a los request se les puede pasar parámetros
    //se va a validar el tipo de proceso
    Registro r=new Registro(); //se piden los parámetros del registro que se quiere guardar
    switch(proceso){
        case "guardarRegistro":
            
            System.out.println("guardar Registro");
            r.setPlaca(request.getParameter("placa"));
            r.setModelo(request.getParameter("modelo"));
            r.setColor(request.getParameter("color"));
            r.setVehiculo(request.getParameter("vehiculo"));
            if(r.guardarRegistro()){
                //si guarda bien el registro, se concatena otros datos para el json
                respuesta += "\"" + proceso + "\": true"; // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
            }else{
                respuesta += "\"" + proceso + "\": false"; // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
            }
            break;
            
        case "actualizarRegistro":
            
            System.out.println("Actualizar Registro");
            r.setId_registro(Integer.parseInt(request.getParameter("id_registro"))); //a este hay que convertirlo de entero a string
            r.setPlaca(request.getParameter("placa"));
            r.setModelo(request.getParameter("modelo"));
            r.setColor(request.getParameter("color"));
            r.setVehiculo(request.getParameter("vehiculo"));
            
            if(r.actualizarRegistro()){
            //si guarda bien el registro, se concatena otros datos para el json
            respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
            } else{
                respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
            }
            break;
            
        case "eliminarRegistro":
            System.out.println("Eliminar registro");
            String placa = request.getParameter("placa");
            if(r.borrarRegistro(placa)){
             respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
            }else{
                respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
            }

            break;
            
        case "listarRegistros":
            System.out.println("Listar Contactos");
            List<Registro> listaRegistros = r.listarRegistros();
            if(listaRegistros.isEmpty()){
                respuesta += "\"" + proceso + "\": true,\"Contactos\":[]"; //genera una lista vacía en el json
            } else{
                respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(listaRegistros); //guarda la lista en el json
            }

            break;
        

        default:
            respuesta += "\"ok\": false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                    + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    
    //Cierra la respuesta
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>
