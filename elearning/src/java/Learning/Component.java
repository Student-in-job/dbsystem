/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.Log;
import java.io.File;
import java.io.IOException;
import org.apache.tomcat.util.http.fileupload.FileItem;

/**
 *
 * @author ksinn
 */
public class Component {
    
    protected String ID;
    protected String Name;
    protected String Inventory;
    protected int Day;
    protected String ProgramID;
    
    public boolean Write(String user_id){
        return false;
    }
    
    public boolean ReWrite(String user_id){
        return false;
    }
    
    
    protected void setProgramID(String program){
    
        this.ProgramID = program;
    }
    
    public String getProgramID(){
    
        return this.ProgramID;
    } 
    
    public Program getProgram(){
    
        return new Program(this.ProgramID);
    } 
    
    public String getName(){
    
    return this.Name;
    }
    
    public String getInventory(){
    
    return this.Inventory;
    }
    
    public String getID(){
    
    return this.ID;
    }
    
    public int getDay(){
    
    return this.Day;
    }
    
    public void setName(String name){
        
        if(!"".equals(name)&&name!=null)
            this.Name = name;
    }
    
    public void setInventory(String inventory){
        
        if(!"".equals(inventory)&&inventory!=null)    
            this.Inventory = inventory;
    }
    
    public void setDay(int day){
        
        if(day>0&&day<=this.getProgram().getDuration())
            this.Day = day;
    }
    
}
