/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class InitParams {
    
    static public String getLogPath() throws NamingException{
        InitialContext initialContext = new InitialContext();
        return (String) initialContext.lookup("java:/comp/env/path/log");
    }
    
    static public String getAppFile() throws NamingException{
        InitialContext initialContext = new InitialContext();
        return (String) initialContext.lookup("java:/comp/env/path/log");
    }
    
}
