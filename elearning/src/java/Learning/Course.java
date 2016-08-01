/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.DataBase;
import DataBase.Log;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ksinn
 */
public class Course extends Parent {

    private Date Date;
    private boolean Public;
    private int ProgramID;

    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 8;
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
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    SimpleDateFormat format = new SimpleDateFormat();
                    format.applyPattern("yyyy-MM-dd");
                    this.Date = format.parse(rs.getString("course_date"));
                    this.Public = rs.getInt("course_public")==1;
                    this.ProgramID = rs.getInt("program");

                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else throw new Error();
    }
   
    public Program getProgram() throws Exception{
    
        return new Program(this.ProgramID);
    } 
    
    public Schedule getSchadule() throws Exception{
        
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("schedules");
        if(db.Done()&&rs!=null){
                if(rs.next())
                    return new Schedule(rs.getInt("course"));
        }
        return null;
    }
    
}