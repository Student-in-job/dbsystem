/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Staff;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


/**
 *
 * @author ksinn
 */
public class Storage {
    private static Storage conn = new Storage();
    private static String RealPath;
    private static String LogPath;    
    private static String FileDir;

    
    private Storage() 
    {
        try {
            
            Connection db_conn = getConnection();
            
            PreparedStatement stmt = db_conn.prepareStatement("select * from sys_conf where name = 'RealPath';");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                this.RealPath = rs.getString("value");
            }
            stmt = db_conn.prepareStatement("select * from sys_conf where name = 'LogPath';");
            rs = stmt.executeQuery();
            if(rs.next()){
                this.LogPath = rs.getString("value");
            }
            
            stmt = db_conn.prepareStatement("select * from sys_conf where name = 'FileDir';");
            rs = stmt.executeQuery();
            if(rs.next()){
                this.FileDir = rs.getString("value");
            }
            
        }
        catch (NamingException | SQLException ex) {}
    }
    
    public static Connection getConnection() throws NamingException, SQLException{        
             
        InitialContext initContext;
        initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DB");
        return ds.getConnection();
    }
    
  
    public static Connection getTuterConn() throws NamingException, SQLException
    {
        
        InitialContext initContext= new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DBtuter");
        return ds.getConnection();
    }
    
    public static Connection getStudentConn() throws NamingException, SQLException
    {
        
        InitialContext initContext= new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DBstudent");
        return ds.getConnection();
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
