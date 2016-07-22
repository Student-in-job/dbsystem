/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Files {
    
    protected String Name;
    protected String Type;
    protected String ProgramID;
    protected String ID;
    static protected String Path = "/var/www/html/dbsystem/uploadFiles/materials";
    
    
    public String getEmbed(){
        
        String s = "";
        if(Type.equals("mp4")){
            s = "<embed src=\""
                    + this.getURL()
                    + "\" type=\"video/mp4\" width=\"400\" height=\"300\"></embed>";
        }
        return s;
    }
    
    public Files(int id){
        
        HashMap<String, String> inf = t_files.get_information(id);
        
                    this.ProgramID = inf.get("program");
                    this.ID = inf.get("id");
                    this.Name = inf.get("name");
                    this.Type = inf.get("type");
            
    }
    
    protected Files(String program, String id, String name, String type){
        
        this.ProgramID = program;
        this.ID = id;
        this.Name = name;
        this.Type = type;
    }
    
    public String getName(){
        return Name;
    }
    
    public String getID(){
        return ID;
    }
    
    public String getURL(){
        
        return "http://localhost/dbsystem/uploadFiles/materials" + "/" + ProgramID + "/" + ID + "." + Type;
    }
    
    static public ArrayList<Files> getFileList(String program){
        
        ArrayList<HashMap<String, String>> inf = t_files.get_information_whis_program(program);
        ArrayList<Files> list = new ArrayList<Files>();
        for(int i=0; i<inf.size(); i++)
            list.add(new Files(
                    inf.get(i).get("program"),
                    inf.get(i).get("id"),
                    inf.get(i).get("name"),
                    inf.get(i).get("type")
            )
            );
        return list;   
            
        
    }
    
    static public boolean Write(Part part, String program_id){
        
        try {
            
            String path = Path + "/" + program_id;
            new File(path).mkdirs();
            String db_name = extractFileName(part);
            String type = extractFileExtension(db_name);
            int id = t_files.set_information(program_id, db_name, type);
            if(id>0){
                String file_name = Integer.toString(id) + "." + type;
                part.write(path + "/" + file_name);
                if(new File(path + "/" + file_name).exists())
                    return true;
                else{
                    t_files.delete(id);
                    return false;
                } 
            }return false;
            
        } catch (IOException ex) {
                    Log.getOut(ex.getMessage());
                    return false;
        } 
    }
        
    
    static private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=")+2, s.length()-1);
            }
        }
        return "";
    }
    
    static private String extractFileExtension(String name) {
        
        String s = name;
        if(s.indexOf(".")!=-1)
            s = extractFileExtension(s.substring(s.indexOf(".")+1, s.length()));
        return s;
            
    }
        
    }
