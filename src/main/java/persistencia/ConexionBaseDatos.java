
package persistencia;

import java.sql.*;


public class ConexionBaseDatos {
    private String DB_driver="";
    private String url="";
    private String db="";
    private String host="";
    private String username="";
    private String password="";
    private ResultSet resultset=null;
    public Connection conexion=null;
    private Statement stmt=null;
    
    public ConexionBaseDatos() {
        DB_driver="com.mysql.jdbc.Driver";
        host="localhost:3306";
        db="easyparking";
        url="jdbc:mysql://"+host+"/"+db;
        username="root";
        password="!A3F9xj%";
        
        try{
            //Asignacion driver
            Class.forName(DB_driver);
        }catch(ClassNotFoundException ex){
            System.out.println("Error en la asignacion del driver");
        }
        
        try{
            //Realizar la conexion
            conexion=DriverManager.getConnection(url,username,password);
            System.out.println("Conexion Exitosa");
        }catch(SQLException ex){
            System.out.println("Error en la conexion a Base de Datos");
        }
    }
    
    //Retornar conexion
    public Connection getConnection(){
        return conexion;
    }
    
    //Cerrar conexion
    public void closeConnection(){
        if(conexion !=null){
            try{
                conexion.close();
            }catch(SQLException ex){
                System.out.println("Error al cerrar la conexion");
            }
        }
    }
    
    public ResultSet consultarBD(String sentencia){
        try{
            stmt=conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            resultset=stmt.executeQuery(sentencia);
        }catch(SQLException ex){
            System.out.println("Error al cosultar en la base de datos");
        }
        return resultset;
    }
    
    public boolean insertarDB(String sentencia){
        try{
            stmt=conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al insertar en la base de datos");
            return false;
        }
    }
    
    public boolean borrarBD(String sentencia){
        try{
            stmt=conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al borrar en la base de datos");
            return false;
        }
    }
    
    public boolean actualizarBD(String sentencia){
        try{
            stmt=conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al actualizar en la base de datos");
            return false;
        }
    }
    
    public boolean setAutoCommitBD(boolean commit){
        try{
            conexion.setAutoCommit(commit);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al hacer SetAutoCommitBD");
            return false;
        }
    }
    public boolean commitBD(){
        try{
            conexion.commit();
            return true;
        }catch(SQLException ex){
            System.out.println("Error al hacer un commit");
            return false;
        }
    }  
    public boolean rollbackBD(){
        try{
            conexion.rollback();
            return true;
        }catch(SQLException ex){
            System.out.println("Error al hacer un rollback");
            return false;
        }
    }
}
