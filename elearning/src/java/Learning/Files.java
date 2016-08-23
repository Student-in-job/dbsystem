/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.*;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Files extends Parent{
    
    protected String Name;
    protected String Title;
    protected String FileType;
    protected Material Material;
    protected Part Part;
    protected final String Derectory = db.getFileDir() + "material/";
    protected final String Path = db.getRealPath() + Derectory;
    
    
    

    public boolean CorrectExtension(){
        String Extension = extractFileExtension(Name);
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
                    this.Title = rs.getString("files_title");
                    this.Name = rs.getString("files_name");
                    this.FileType = rs.getString("files_type");
                    this.Material = new Material(rs.getInt("material"));

    }
    
    public Files(Part part, String title){
        
        Name = extractFileName(part);
        Part = part;
        Title = title;
    }
    
    public Files(String name, String title){
        
        Name = name;
        Title = title;
    }
    
    
    public void Write(Material material, User user) throws Exception{
        
        
        if(user.getID()!=material.getProgram().getTeacherID()) throw new IllegalAction();
        if(!material.MayChange()) throw new IllegalAction();
        if(!this.CorrectExtension()) throw new InvalidParameter();
        
        FileType = extractFileExtension(Name).equals("mp4")?"video":"document";
        Material = material;
        this.write();
        if(Part!=null){
            if(!this.SaveFile()) {
                DataBase db = new DataBase(this);
                db.Delete();
            }
        }
        
    }
    
    protected boolean SaveFile() throws IOException{
        
        
        String path = Path + this.getMaterial().getProgramID() + File.pathSeparator;
        new File(path).mkdirs();
        path += Name;
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
        if(s.contains(".")){
            while(s.contains(".")){
                s = s.substring(s.indexOf(".")+1, s.length());
            }
            return s;
        }
        else return "";
    }
    
    public String getName(){
        return Name;
    }
    
    public String getTitle(){
        return Title;
    }
    
    public String getFileType(){
        return FileType;
    }
    
    public int getMaterialID(){
        return Material.getID();
    }
    
    public Material getMaterial(){
        return Material;
    }
        
    public String getURL() throws Exception{
        
        return Derectory + this.getMaterial().getProgramID() + "/" + Name;
    }
       
}
