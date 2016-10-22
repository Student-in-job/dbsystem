/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.Log;
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
public class AcceptTask extends Accept{
    
    private Task Task;
    private int Ball;
    private String UserAnswer;
    private String Message;
    
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
    public String getErrorMessage(){
        return Message;
    }
    
    public void Final() throws Exception{
        
        if(this.isRight()){        
            DataBase db = new DataBase(this);
            db.ReWrite();
        }   
    }
    
    public void putAnswer(String answer) throws NamingException{
        
            try{
                Ball=0;
                UserAnswer=answer;
                ResultSet stud, tut;
                try{
                    Statement stmt = db.getStudentConn().createStatement();
                    stud =  stmt.executeQuery(UserAnswer);
                } catch(SQLException ex){Message = ex.getMessage(); Ball=0; return;}      
                
                tut = Task.getAnswerResult();
                if(this.Compear(tut, stud))
                    Ball = Task.getBall();
                
            } catch(SQLException ex){Log.getOut(ex.getMessage()); }
            
    }
    
    private boolean Compear(ResultSet r1, ResultSet r2) throws SQLException{
        
        for(int i=1; i<r1.getMetaData().getColumnCount(); i++)
            if(!r1.getMetaData().getColumnName(i).equals(r2.getMetaData().getColumnName(i)))
                return false;
        
        while(r1.next()){
            r2.next();
            for(int i=1; i<r1.getMetaData().getColumnCount(); i++)
            if(!r1.getString(i).equals(r2.getString(i)))
                return false;
        }
        
        if(r2.next()) return false;
        
        return true;
        
        
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
    
    @Override
    public int getBall(){
        return Ball;
    }
    
    public int getTaskID(){
        return Task.getID();
    }
    
    public Learning.Task getTask(){
        return Task;
    }
    
    @Override
    public Date getEndTime(){
        return new Date(StartTime.getTime()+Task.getTime()*60*1000);
    }    
}