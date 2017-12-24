/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entety;


/**
 *
 * @author ksinn
 */
public abstract class Component extends Parent{
    
    protected String Name;
    protected int Day;
    protected Course Course;
    protected int CourseId;
    
    {
        this.Course = new Course();
    }
    
    @Override
    public boolean MayChange(){
        return true;
    }
    
    public boolean Write() throws Exception{
            return this._insert();
    }
    
    public boolean Update() throws Exception{
            return this._update();
    }
    
    public void getById(int id) throws Exception{
               
       if(id>0){
            this.ID = id;
            this._select();
        } else 
            throw new Exception("Invalid input data for component");
    }
    
    public Course getCourse(){
        return this.Course;
    } 
    
    public String getName(){
        return this.Name;
    }
    
    public int getDay(){
        return this.Day;
    }
    
    public void setCourseId(int data){
        this._from_db=false;
        this.CourseId = data;
    }
    
    public void setDay(int data){
        this._from_db=false;
        this.Day = data;
    }
    
    public void setName(String data){
        this._from_db=false;
        this.Name = data;
    }
    
    public void ReadCourseFromDB() throws Exception{
        this.Course.getById(this.CourseId);
    }
}
