
import Model.InitParams;
import Model.Log;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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
public class ServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
       /* try {
            sce.getServletContext().getRealPath("/");
            InitialContext InitialContext = new InitialContext();
            Context compCtx = (Context)InitialContext.lookup("java:comp");
            compCtx.addToEnvironment("com.ksinn.real", "134679");
            String RealPath =  (String) compCtx.lookup("com.ksinn.real");
            RealPath.chars();
        } catch (NamingException ex) {
            Logger.getLogger(ServletListener.class.getName()).log(Level.SEVERE, null, ex);
        }*/
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
