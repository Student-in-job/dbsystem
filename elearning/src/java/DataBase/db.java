/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ksinn
 */
public class db {
    private static db conn = new db();
    private static Connection db_conn;
    private static String RealPath;
    
    private db() 
    {
        Properties properties=new Properties();
        properties.setProperty("user","root");
        properties.setProperty("password","qwerty");
        properties.setProperty("useUnicode","true");
        properties.setProperty("characterEncoding","UTF-8"); 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.db_conn = DriverManager.getConnection("jdbc:mysql://localhost/elearning", properties); 
            
            PreparedStatement stmt = this.db_conn.prepareStatement("select * from sys_conf where name = 'RealPath';");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                this.RealPath = rs.getString("value");
            }
            } 
        catch (ClassNotFoundException ex) {
            Log.getOut(ex.getMessage());
        } catch (SQLException ex) {
            Log.getOut(ex.getMessage());
        }
    }
    
    public static Connection getConn()
    {
        return db_conn;
    }
    
    public static String getRealPath()
    {
        return RealPath;
    }
}
