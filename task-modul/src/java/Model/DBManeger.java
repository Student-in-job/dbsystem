/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class DBManeger extends DBConnect{
    
    @Override
    protected String getDataSourseName(){
        return "tuter";
    }
    
    private String Message;
    private String Prefix;
    private File file;
    
    public DBManeger(String query, TaskGroup group) throws Exception{
        
        Prefix = String.valueOf(group.getID())+"_";
        
        this.GenerateUniqName();
        this.file.createNewFile();
        try{
            FileWriter fileWriter = new FileWriter(file.getPath());
            fileWriter.write(query);
            fileWriter.flush();
            fileWriter.close();

            this.execut();
        } catch(Exception ex){
            Log.Write(ex.getLocalizedMessage());
            throw ex;
        }
    }
    
    public DBManeger(Part sqript, TaskGroup group) throws Exception{
        
        Prefix = String.valueOf(group.getID())+"_";
        
        this.GenerateUniqName();
        sqript.write(file.getName());
        
        this.execut();
        
    }
    
    public String getMessage(){
        return Message;
    }
    
    private void RewriteQuery() throws Exception {
        
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
        this.Message = this.Message.replaceAll(file.getPath(), "script.sql");
    
    }

    private void execut() throws Exception {
        
        this.Message = "";
        this.RewriteQuery();
        this.executFile();  
        file.delete();
    
    }
    
    private String Normalize(String str){
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
    
    private void GenerateUniqName(){
        String testName = InitParams.RealPath +"/tmp/task_modul/sql";
        int i=0;
        while((this.file = new File(testName+String.valueOf(i))).exists())
                i++;
    }
    
}
