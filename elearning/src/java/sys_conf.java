
import DataBasePak.Log;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

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
                    
        try {
            
            InitialContext initContext= new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DB");
            Connection conn= ds.getConnection();
            PreparedStatement stmt;
            
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
            conn.close();
        
        } catch (SQLException ex) {
            Log.getOut(ex.getMessage());
        } catch (NamingException ex) {
            Logger.getLogger(sys_conf.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
