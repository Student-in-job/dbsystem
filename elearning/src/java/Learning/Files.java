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
    protected int MaterialID;
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
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    this.Name = rs.getString("files_name");
                    this.Extension = rs.getString("files_type");
                    this.MaterialID = rs.getInt("material");

                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else throw new Error();
    }
    
    public Files(Part part){
        
        Name = extractFileName(part);
        Extension = extractFileExtension(Name);
        Part = part;
    }
    
    
    public String Write(Material material, User user) throws Exception{
        
        if(user.getID()!=material.getProgram().getTeacherID()) return "Вы не можете этого сделать";
        if(!material.MayChange()) return "Вы не можете менять опублекованную программу";
        
        if(!this.CorrectExtension()) return "Invalid extension file. Valid only .mp4, .pdf, .doc/.dox, .ppt/.pptx; ";
        
        MaterialID = material.getID();    
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()){
            DataBase db2 = new DataBase(material);
            ResultSet rs2 = db2.FindLast("files");
            if(db2.Done()&&rs2!=null){
                try{
                    rs2.next();
                    this.ID = rs2.getInt("files_id");
                    String mark = this.SaveFile();
                if(mark==null)
                    return null;
                else{
                    db.Delete();
                    return mark;
                }
                }
                catch(Exception ex){
                    db.Delete();
                    return "Error; ";
                }
                
            }
            else return db2.Message();
        }
        else return db.Message();
        
            
    }
    
    protected String SaveFile() throws IOException, Exception{
        
        
        String path = Path + this.getMaterial().getProgramID() + "/";
        new File(path).mkdirs();
        path += ID + "." + Extension;
        Part.write(path);
        if(new File(path).exists())
            return null;
        else{
            return "File not writen; ";
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
    
    public String getName(){
        return Name;
    }
    
    public String getExtension(){
        return Extension;
    }
    
    public int getMaterialID(){
        return MaterialID;
    }
    
    public Material getMaterial(){
        try{return new Material(MaterialID);}
        catch(Exception ex){return null;}
    }
        
    public String getURL() throws Exception{
        
        return "/elearning/uploadFiles/materials/" + this.getMaterial().getProgramID() + "/" + ID + "." + Extension;
    }
       
}
