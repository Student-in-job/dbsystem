/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.Log;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class AcceptTask extends Accept{
    
    private TaskList TaskList;
    private ArrayList<Task> Tasks; 
    private HashMap<Integer, Boolean> Result;
    protected int lowTask;
    private int Ball;
    private String UserAnswer;
    private SQLException Ex;
    private String Message;
    private Connection conn;
    private Date StartTime;
    
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
    
    public AcceptTask(User_courses user_course, TaskList tasklist) throws Exception{
        this.TaskList = tasklist;
        this.UserHasCourse = user_course;
        this.Result = new HashMap<Integer, Boolean>();
        Tasks = this.TaskList.getTask();
        for(int i=0; i<Tasks.size(); i++){
            Result.put(Tasks.get(i).getID(), false);
        }
        lowTask = 0;
        StartTime = new Date();
                
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            ID = db.ID();
        }
        else throw new Exception();
        conn = DataBasePak.db.getStudentConn();
    }
    
    public boolean Next(){
        if(lowTask+1>=Tasks.size())
            return false;
        else{
            lowTask++;
            this.Ex = null;
            this.Message="";
            this.StartTime = new Date();
            this.UserAnswer = "";
                        
            return true;
        }
        
    }
    
    public void Final() throws Exception{
        
        Ball=0;
        for(Map.Entry<Integer, Boolean> entry : Result.entrySet()){
            Ball+= entry.getValue()?Tasks.get(entry.getKey()).getBall():0;
        }
        if(this.isRight()){        
            DataBase db = new DataBase(this);
            db.ReWrite();
        }
        conn.close();
        
        
    }
    
    public void putAnswer(String answer) throws NamingException{
        
            try{
                Result.put(Tasks.get(lowTask).getID(), false);
                Message = "";
                UserAnswer=answer;
                ResultSet stud, tut;
                try{
                    Statement stmt = conn.createStatement();
                    stud =  stmt.executeQuery(UserAnswer);
                } catch(SQLException ex){Message = ex.getMessage(); Ex = ex; return;}      
                
                tut = Tasks.get(lowTask).getAnswerResult();
                if(this.Compear(tut, stud))
                    Result.put(Tasks.get(lowTask).getID(), true);
                
            } catch(SQLException ex){Log.getOut(ex.getMessage()); }
            
    }
    
    private boolean Compear(ResultSet r1, ResultSet r2) throws SQLException{
        
        for(int i=1; i<=r1.getMetaData().getColumnCount(); i++)
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
       return Result.get(Tasks.get(lowTask).getID());
    }
    
    public String getAnswer(){
        return UserAnswer;
    }
    
    public String getErrorMessage(){
        return Message;
    }
    
    public ResultSet getAnswerResult() throws SQLException, NamingException{
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(UserAnswer);
        
    }
    
    @Override
    public int getBall(){
        return Ball;
    }
    
    public int getTaskID(){
        return Tasks.get(lowTask).getID();
    }
    
    public Learning.Task getTask(){
        return Tasks.get(lowTask);
    }
    
    @Override
    public Date getEndTime(){
        return new Date(StartTime.getTime()+Tasks.get(lowTask).getTime()*60*1000);
    }    
}
