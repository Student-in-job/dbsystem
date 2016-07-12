/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.Log;
import com.ibm.useful.http.FileData;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ksinn
 */
public class NewComp {
    
    String Name;
    String Inventory;
    int Day;
    Program Program;
    
    
    
    
    public boolean UploadFile(FileData tempFile){
        
        FileOutputStream fos = null;
        try {
            File f = new File("/home/ksinn/NetBeansProjects/" + tempFile.getFileName());
            fos = new FileOutputStream(f);
            fos.write(tempFile.getByteData());
            fos.close();
            return true;
        } catch (FileNotFoundException ex) {
            Log.getOut(ex.getMessage());
            return false;
        } catch (IOException ex) {
            Log.getOut(ex.getMessage());
            return false;
        } 
        
    }
    
    public void setProgram(Program program){
    
        this.Program = program;
    }
    
    public Program getProgram(){
    
        return this.Program;
    } 
    
    public String getName(){
    
    return this.Name;
    }
    
    public String getInventory(){
    
    return this.Inventory;
    }
    
    public int getDay(){
    
    return this.Day;
    }
    
    public void setName(String name){
        
        this.Name = name;
    }
    
    public void setInventory(String inventory){
        
        this.Inventory = inventory;
    }
    
    public void setDay(int day){
        
        this.Day = day;
    }
            
}
