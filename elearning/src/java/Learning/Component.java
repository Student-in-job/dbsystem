/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ksinn
 */
public class Component extends Parent{
    
    protected String Name;
    protected String Inventory;
    protected int Day;
    protected int ProgramID;
    protected int CourseID;
    
    protected Date Date;
    
    public String Write(Program prog, User user) throws Exception{
        return null;
    }
    
    public int getProgramID(){
    
        return this.ProgramID;
    } 
    
    public Program getProgram(){
    
        try{return new Program(this.ProgramID);}
        catch(Exception ex) {return null;}
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
    
    public Date getDate(){
    
    return this.Date;
    }
    
    public String getDateString(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(this.Date);
    }
    
    public void setDate(Date date){
        Date = date;
    }
    
    public void setCourse(int course){
        CourseID = course;
    }
    
    public int getCourse(){
        return CourseID;
    }
 
}
