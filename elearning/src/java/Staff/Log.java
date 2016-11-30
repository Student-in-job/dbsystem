/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Staff;

import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

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
            String path = Storage.getLogPath();
            
            File log = new File(path);
            if(!log.exists())
                log.createNewFile();
            Log.out = new FileWriter(path, true);
        } catch (Exception ex) {
        }
        finally{
            
        }        
    }
    
    public static void Write(String massage)
    {
        try {
            
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM.dd 'at' HH:mm:ss");
            out.write("\n--------------------------------");
            out.write("\n"+dateFormat.format(date));
            out.write("\n"+massage+"\n");
            out.flush();
        } catch (Exception ex) {
        }
    }
    
}
