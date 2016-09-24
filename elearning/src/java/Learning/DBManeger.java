/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.db;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.NamingException;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class DBManeger {
    
    private String Message;
    private String Prefix;
    private File file;
    
    public DBManeger(String query, Program prog) throws NamingException, IOException{
        Message="";
        
        String testName = db.getRealPath()+db.getFileDir()+"temp/sq";
        int i=0;
        while((file = new File(testName+String.valueOf(i))).exists())
                i++;
        FileWriter fileWriter = new FileWriter(file.getPath());
        fileWriter.write(query);
        fileWriter.flush();
        fileWriter.close();
        
        Prefix = String.valueOf(prog.getID())+"_";
        this.execut();
    }
    
    public DBManeger(Part sqript, Program prog) throws NamingException, IOException{
        String testName = db.getRealPath()+db.getFileDir()+"temp/";
        int i=0;
        File file;
        while((file = new File(testName+String.valueOf(i))).exists())
            i++;
        sqript.write(file.getName());
        
        Prefix = String.valueOf(prog.getID())+"_";
        
        this.execut();
        
    }
    
    public String getMessage(){
        return Message;
    }
    

    private void RewriteQuery() throws FileNotFoundException, IOException {
        
        FileReader fileReader = new FileReader(file.getPath());
        char[] buffer = new char[(int)file.length()];
        fileReader.read(buffer);
        String query =  this.Normalize(new String(buffer));
        
        StringBuffer sb = new StringBuffer(query);
        
        HashMap<String, String> names = new HashMap<String, String>();
        
        Pattern p = Pattern.compile("create[ |a-z]+table[ ]+(if not exists)?[ ]*+[a-z|0-9|_|$]+[(| ]", Pattern.CASE_INSENSITIVE);
        Matcher matcher = p.matcher(query);
        while(matcher.find()){
            String create = matcher.group();
            Pattern pp = Pattern.compile("[a-z|0-9|_|$]+[(| ]$", Pattern.CASE_INSENSITIVE);
            Matcher m = pp.matcher(create);
            if(m.find())
                names.put(m.group(), Prefix.concat(m.group()));
        }
        String replacequery = query;
        for(String key : names.keySet()){
            replacequery = replacequery.replaceAll(" "+key, " "+names.get(key));
        }
        
        
        /*names = new HashMap<String, String>();
        p = Pattern.compile("update[ ]+(low_priority)?(ignore)?[ ]*+[a-z|0-9|_|$]+[ ]", Pattern.CASE_INSENSITIVE);
        matcher = p.matcher(query);
        while(matcher.find()){
            String update = matcher.group();
            Pattern pp = Pattern.compile("[a-z|0-9|_|$]+[ ]$", Pattern.CASE_INSENSITIVE);
            Matcher m = pp.matcher(update);
            if(m.find())
                names.put(m.group(), Prefix.concat(m.group()));
        }
        for(String key : names.keySet()){
            replacequery = replacequery.replaceAll(" "+key, " "+names.get(key));
        }      */  
        
        
        FileWriter fileWriter = new FileWriter(file.getPath());
        fileWriter.write(replacequery);
        fileWriter.flush();
        fileWriter.close();
        
    }
    
    private void executFile() throws IOException{
        String[] cmd = new String[]{
            "mysql",
            "task",
            "--user=" + "tuter",
            "--password=" + "qwerty",
            "-e",
            "source " + file.getPath()
        };
        Process proc = Runtime.getRuntime().exec(cmd);
        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        String line;
       
        while ((line = bufferedreader.readLine()) != null) {
            Message+=line+"<br>\n";
        }
        inputstream = proc.getErrorStream();
        inputstreamreader = new InputStreamReader(inputstream);
        bufferedreader = new BufferedReader(inputstreamreader);
        
        while ((line = bufferedreader.readLine()) != null) {
            Message+=line+"<br>\n";
        }
        Message = Message.replaceAll(db.getRealPath(), "");
        
        
    }

    private void execut() throws NamingException, IOException {
        
        this.RewriteQuery();
        this.executFile();  
        file.delete();
    
    }
    
    
    String Normalize(String str){
        String norm_string;
        norm_string = str.toLowerCase();
        norm_string = norm_string.replaceAll("\n", " ");
        norm_string = norm_string.replaceAll("\t", " ");
        norm_string = norm_string.replaceAll("\r", " ");
        norm_string = norm_string.replaceAll("\f", " ");
        
        norm_string = norm_string.replaceAll("\\(", " ( ");
        norm_string = norm_string.replaceAll("\\)", " ) ");
        
        return norm_string;
    }
    
}
