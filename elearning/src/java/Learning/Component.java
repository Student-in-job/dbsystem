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
public abstract class Component extends Parent{
    
    protected String Name;
    protected String Inventory;
    protected int Day;
    protected Program Program;
    protected Course Course;
    
    protected Date Date;
    
    abstract public boolean Write(Program prog, User user) throws Exception;
    
    public int getProgramID(){
    
        return this.Program.getID();
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
    
    public Date getDate(){
    
    return this.Date;
    }
    
    public String getDateString(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM.");
        return dateFormat.format(this.Date);
    }
    
    public void setDate(Date date){
        Date = date;
    }
    
    /*public void setCourse(Course cours){
        Course = cours;
    }
    
    public int getCourseID(){
        return this.Course.getID();
    }
    
    public Course getCourse(){
        return Course;
    }*/
 
}
