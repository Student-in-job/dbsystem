/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ksinn
 */
public class Log {
    private static Log logs = new Log();
    private static FileWriter out;
    
    private Log() 
    {
        try {
        
            this.out = new FileWriter("/home/ksinn/NetBeansProjects/ProgramLogs.txt", true);
            
        } catch (IOException ex) {
            Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void getOut(String massage)
    {
        try {
            
            
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM.dd 'at' HH:mm:ss z");
            out.write("\n"+dateFormat.format(date)+"\n");
            out.write(massage);
            out.flush();
        } catch (Exception ex) {
            Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
