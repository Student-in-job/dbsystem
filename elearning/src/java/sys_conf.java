
import DataBasePak.Log;
import DataBasePak.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Web application lifecycle listener.
 *
 * @author ksinn
 */



public class sys_conf implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
                    
/*        try {
            
            Connection conn = db.getConn();
            PreparedStatement stmt = null;
            
            stmt = conn.prepareStatement("delete from sys_conf where name = 'RealPath';");
            stmt.executeUpdate();
            
            stmt = conn.prepareStatement("insert into sys_conf(name, value) values ('RealPath', ?);");
            stmt.setString(1, sce.getServletContext().getRealPath("/"));
            stmt.executeUpdate();
            
            stmt = conn.prepareStatement("delete from sys_conf where name = 'LogPath';");
            stmt.executeUpdate();
            
            stmt = conn.prepareStatement("insert into sys_conf(name, value) values ('LogPath', ?);");
            stmt.setString(1, sce.getServletContext().getInitParameter("LogPath"));
            stmt.executeUpdate();
            
            stmt = conn.prepareStatement("delete from sys_conf where name = 'FileDir';");
            stmt.executeUpdate();
            
            stmt = conn.prepareStatement("insert into sys_conf(name, value) values ('FileDir', ?);");
            stmt.setString(1, sce.getServletContext().getInitParameter("FileDir"));
            stmt.executeUpdate();
        
        } catch (SQLException ex) {
            Log.getOut(ex.getMessage());
        }*/
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
