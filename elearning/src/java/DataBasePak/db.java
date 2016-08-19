/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBasePak;
import java.sql.*;
import java.util.Properties;

/**
 *
 * @author ksinn
 */
public class db {
    private static db conn = new db();
    private static Connection db_conn;
    private static String RealPath;
    private static String LogPath;
    
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
            stmt = this.db_conn.prepareStatement("select * from sys_conf where name = 'LogPath';");
            rs = stmt.executeQuery();
            if(rs.next()){
                this.LogPath = rs.getString("value");
            }
        }catch (ClassNotFoundException ex) {} 
        catch (Exception ex) {}
    }
    
    public static Connection getConn()
    {
        return db_conn;
    }
    
    public static String getRealPath()
    {
        return RealPath;
    }
    public static String getLogPath()
    {
        return LogPath;
    }
}
