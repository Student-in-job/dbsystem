/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.db;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.NamingException;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class DBManeger {
    
    private int TypeQuery; 
            /*alter 1 create 2 drop 3 select 4 delete 5 index 6 update 7*/
    private String Query;
    private Part Part;
    private String Message;
    private String Prefix;
    private SQLException Ex;
        private Connection conn;
    
    public DBManeger(String query, Program prog) throws NamingException, SQLException, IOException{
        Message="";
        Query = query.toLowerCase();
        Prefix = String.valueOf(prog.getID())+"_";
        conn = db.getTuterConn();
        this.execut();
        conn.close();
    }
    
    public DBManeger(Part sqript, Program prog) throws NamingException, SQLException, IOException{
        Message="";
        Part = sqript;
        Prefix = String.valueOf(prog.getID())+"_";
        this.execut();
        conn.close();
    }

    public boolean Complite(){
        return Message.equals("");
    }
    
    public Exception getException(){
        return Ex;
    }
    
    public String getMessage(){
        return Message;
    }
    
    private void setType() {
        
    }

    private String RewriteQuery(String query) {
        StringBuffer sb = new StringBuffer(query);
        Pattern p = Pattern.compile("(create)|(alter)|(drop) [a-z]* table[ ]+[^"+Prefix+"][a-z|0-9]*", Pattern.CASE_INSENSITIVE);
        Matcher matcher = p.matcher(query);
        if(matcher.find()){
            Pattern p1 = Pattern.compile("table[ ]+", Pattern.CASE_INSENSITIVE);
            Matcher matcher1 = p1.matcher(query);
            return matcher1.replaceAll("table "+Prefix);
        }
        else return query;
    }
    
    private void executFile(String file_path) throws IOException{
        String[] cmd = new String[]{"mysql",
        "task",
        "--user=" + "tutor",
        "--password=" + "qwerty",
        "-e",
        "\"source " + file_path + "\""
        };
        Process proc = Runtime.getRuntime().exec(cmd);
        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        String line;
        while ((line = bufferedreader.readLine()) != null) {
        Message+=line+"\n";
        }
    }
    
    private void executQuery(String query) throws NamingException, SQLException{
        String[] split = Query.split(";");
        for (String split1 : split) {
            String sub_query = split1;//this.RewriteQuery(split1);
            Statement stmt = conn.createStatement();
            try{
                stmt.executeUpdate(sub_query);
            }catch(SQLException ex){Message+= ex.getMessage()+";<br>";}
        }
    }

    private void execut() throws NamingException, SQLException, IOException {
        
        if(Query!=null){
            this.executQuery(Query);
            
        }
        if(Part!=null){
            String testName = db.getRealPath()+db.getFileDir()+"temp/";
            int i=0;
            File file;
            while((file = new File(testName+String.valueOf(i))).exists())
                i++;
            Part.write(file.getName());
            if(file.exists())
                this.executFile(file.getName());
            else throw new IOException();
        }        
    
    }
    
    
}
