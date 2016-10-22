package Model;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author ksinn
 */
public class Log {
    private static Log logs = new Log();
    private static FileWriter out;
    private Connection db_conn;
    
    private Log() 
    {
        try {
            File log = new File("/home/ksinn/task_modul.txt");
            if(!log.exists())
                log.createNewFile();
            Log.out = new FileWriter("/home/ksinn/task_modul.txt", true);
            
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
