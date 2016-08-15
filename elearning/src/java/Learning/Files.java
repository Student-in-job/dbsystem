/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Files extends Parent{
    
    protected String Name;
    protected String Extension;
    protected Material Material;
    protected Part Part;
    protected final String Path = db.getRealPath() + "uploadFiles/materials/";
    
    
    

    public boolean CorrectExtension(){
        return (
                ("mp4".equals(Extension)
                ||"pdf".equals(Extension)
                ||"doc".equals(Extension)
                ||"docx".equals(Extension)
                ||"ppt".equals(Extension)
                ||"pptx".equals(Extension))
              );
              
    }
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 6;
    }
    
    @Override
    public String getType(){
        return "files";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getMaterial().getProgram().isPublished();
    }
    
    public Files(int id) throws Exception{
    
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Name = rs.getString("files_name");
                    this.Extension = rs.getString("files_type");
                    this.Material = new Material(rs.getInt("material"));

    }
    
    public Files(Part part){
        
        Name = extractFileName(part);
        Extension = extractFileExtension(Name);
        Part = part;
    }
    
    
    public boolean Write(Material material, User user) throws Exception{
        
        if(user.getID()!=material.getProgram().getTeacherID()) throw new IllegalAction();
        if(!material.MayChange()) throw new IllegalAction();
        
        if(!this.CorrectExtension()) throw new InvalidParameter();
        
        Material = material;   
        this.write();
        if(this.SaveFile()) return true;
        else{
            DataBase db = new DataBase(this);
            db.Delete();
            return false;
        }
        
            
    }
    
    protected boolean SaveFile() throws IOException{
        
        
        String path = Path + this.getMaterial().getProgramID() + "/";
        new File(path).mkdirs();
        path += ID + "." + Extension;
        Part.write(path);
        return new File(path).exists();
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
    
    public String getName(){
        return Name;
    }
    
    public String getExtension(){
        return Extension;
    }
    
    public int getMaterialID(){
        return Material.getID();
    }
    
    public Material getMaterial(){
        return Material;
    }
        
    public String getURL() throws Exception{
        
        return Path + this.getMaterial().getProgramID() + "/" + ID + "." + Extension;
    }
       
}
