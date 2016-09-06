/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.db;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class AcceptTask extends Parent{
    
    private Task Task;
    private User_courses UserHasCourse;
    private int Ball;
    private Date StartTime;
    private String UserAnswer;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 12;
    }
    
    @Override
    public String getType(){
        return "accept_task";
    }
    
    public AcceptTask(User_courses user_course, Task task) throws Exception{
        this.Task = task;
        this.UserHasCourse = user_course;
        StartTime=new Date();
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            ID = db.ID();
        }
        else throw new Exception();
        
    }
    
    public void Final() throws Exception{
        Ball=0;
        
        DataBase db = new DataBase(this);
        db.ReWrite();
        
        
    }
    
    public void putAnswer(String answer) throws NamingException, SQLException{
        
        UserAnswer=answer;
        ResultSet stud, tut;
            try{
                Statement stmt = db.getStudentConn().createStatement();
                stud =  stmt.executeQuery(UserAnswer);
            } catch(SQLException ex){Ball=0; return;}
            
            tut = Task.getAnswerResult();
            if(tut.equals(stud)) 
                Ball = Task.getBall();      
            
    }
    
    public boolean isRight(){
       return Ball>0;
    }
    
    public String getAnswer(){
        return UserAnswer;
    }
    
    public ResultSet getAnswerResult() throws SQLException, NamingException{
        Statement stmt = db.getStudentConn().createStatement();
        return stmt.executeQuery(UserAnswer);
        
    }
    
    public int getBall(){
        return Ball;
    }
    
    public User_courses getUserHasCourse(){
        return UserHasCourse;
    }
    
    public int getTaskID(){
        return Task.getID();
    }
    
    public Learning.Task getTask(){
        return Task;
    }
    
    public Date getStartTime(){
        return StartTime;
    }
    
    public Date getEndTime(){
        return new Date(StartTime.getTime()+Task.getTime()*60*1000);
    }

    @Override
    public boolean MayChange(){
        return false;
    }
    
}
