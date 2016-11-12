/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ksinn
 */
public class Course extends Parent {

    private Date StartDate;
    private Date EndDate;
    private boolean Public;
    private Program Program;
    private Schedule Schedule;

    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 9;
    }
    
    @Override
    public String getType(){
        return "course";
    }
    
       
    /*public Test(String name, int day, String inventory){
        
        this.Name=name;
        this.Day=day;
        this.Inventory=inventory;       
    }*/
    
    
    public Course(int id) throws Exception{
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
        rs.next();
                    this.StartDate = rs.getDate("course_start_date");
                    this.EndDate = rs.getDate("course_end_date");
                    this.Public = rs.getInt("course_public")==1;
                    this.Program = new Program(rs.getInt("program"));

        //this.Schedule = new Schedule(this);
    }
    
    public Course(Date date, Program program){
        StartDate = date;
        Program = program;
    }
   
    public Program getProgram(){
    
        return this.Program;
    } 
    
    public boolean Write(Date date, User user, ArrayList<Component> comp) throws Exception{
        this.EndDate = date;
        this.Schedule =  new Schedule(comp);
        this.Public = user.getID() == this.getProgram().getTeacherID();
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            ID = db.ID();
            if(!Public) {
                User_courses uhc = new User_courses();
                uhc.setCourse(this);
                uhc.setUser(user);
                return uhc.Write();
            }
            return true;
        }
        else return false;
    }
    
    public Schedule getSchadule(){
        return  this.Schedule;
    }
    
    public Date getDate(){
        return StartDate;
    }
    
    public Date getEndDate(){
        return EndDate;
    }
    
    public boolean getPublic(){
        return Public;
    }
    
    public int getProgramID(){
        return Program.getID();
    }

    @Override
    public boolean MayChange() {
        return false;
    }
}
