
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;


public class Registro {
    private String placa;
    private String modelo;
    private String color;
    private String vehiculo;

    public Registro() {
        
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(String vehiculo) {
        this.vehiculo = vehiculo;
    }
    
    //Metodos para el CRUD de Registro
    
    public boolean guardarRegistro(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO registro(placa, modelo, color, vehiculo)"
                + " VALUES ( '" + this.placa + "','" + this.modelo + "','"
                + "'" + this.color + "','" + this.vehiculo +  "');  ";
        //Vamos a configurar el setAutocommit de la conexionBD a falso
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{ //si no logro insertar en la BD
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean borrarRegistro(String placa){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM registro WHERE placa = '" + placa + "'";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.borrarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean actualizarRegistro(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `registro` SET modelo='" + this.modelo + "',color='" + this.color + "',vehiculo='" + this.vehiculo
                +  "' WHERE placa=" + this.placa + ";";

        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
           
        } else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public List<Registro> listarRegistros() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM registro ORDER BY placa ASC;";
        List<Registro> listaRegistros = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        
        Registro registro;
        while (datos.next()) {
            registro = new Registro();
            
            registro.setPlaca(datos.getString("placa"));
            registro.setModelo(datos.getString("modelo"));
            registro.setColor(datos.getString("color"));
            registro.setVehiculo(datos.getString("vehiculo"));
  
            listaRegistros.add(registro);
            
        }
        conexion.closeConnection();
        return listaRegistros;
    }
    
    public Registro obtenerRegistro(String placa) throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM registro WHERE placa = '" + placa + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        if(datos.next()){
            Registro registro = new Registro();
            
            registro.setPlaca(datos.getString("placa"));
            registro.setModelo(datos.getString("modelo"));
            registro.setColor(datos.getString("color"));
            registro.setVehiculo(datos.getString("vehiculo"));
            return registro;
        } else{
            conexion.closeConnection();
            return null; //no hay registros
        }
    
    }

}
