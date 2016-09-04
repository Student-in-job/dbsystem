/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBasePak;

import java.sql.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author ksinn
 */
public class db {
    private static db conn = new db();
    private static Connection db_conn;
    private static String RealPath;
    private static String LogPath;    
    private static String FileDir;

    
    private db() 
    {
        try {
        /*Properties properties=new Properties();
        properties.setProperty("user","root");
        properties.setProperty("password","qwerty");
        properties.setProperty("useUnicode","true");
        properties.setProperty("characterEncoding","UTF-8"); 
        
            Class.forName("com.mysql.jdbc.Driver");*/
            InitialContext initContext= new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DB");
            this.db_conn = ds.getConnection();//DriverManager.getConnection("jdbc:mysql://localhost/elearning", properties); 
            
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
            
            stmt = this.db_conn.prepareStatement("select * from sys_conf where name = 'FileDir';");
            rs = stmt.executeQuery();
            if(rs.next()){
                this.FileDir = rs.getString("value");
            }
            
        }//catch (ClassNotFoundException ex) {} 
        catch (Exception ex) {}
    }
    
    public static Connection getConn()
    {
        
        /*InitialContext initContext= new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/dbconnect");
        return ds.getConnection();*/
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
    public static String getFileDir()
    {
        return FileDir;
    }
}
