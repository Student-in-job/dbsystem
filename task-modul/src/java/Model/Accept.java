/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Accept extends Parant{
    
    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("work_id", this.Work.getId());
        list.put("result", this.Result);
        list.put("task_id", this.Task.getId());
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        this.WorkId = (int) list.get("work_id");
        this.TaskId = (int) list.get("task_id");
        this.Result = (int) list.get("result");
    }

    @Override
    protected String _getTableName() {
        return "task_result";
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }
    
    protected int WorkId;
    protected int TaskId;
    protected int Result;
    protected Work Work;
    protected Task Task;
    protected Exception Ex;
    protected ArrayList ResultArray;

    public Accept(){
        this._from_db = false;
    }
    
    public Accept(int id) throws Exception{
        this._from_db = false;
        this.getById(id);
    }
    
    public boolean Write() throws Exception{
        return this._insert();
    }
    
    public boolean putAnswer(String answer) throws Exception{
        StudentConnect conn_stud = new StudentConnect();
        StudentConnect conn_tut = new StudentConnect();
        ResultSet stud, tut;
        
        if(!conn_stud.exequtQuery(answer)){
            this.Ex = conn_stud.getException();
            return false;
        } else {
            this.ResultArray = conn_stud.getResultArray();
            if(!conn_tut.exequtQuery(this.Task.getAnswer())){
                throw conn_stud.getException();
            }

            tut = conn_tut.getResultSet();
            stud = conn_stud.getResultSet();

            try{
                this.Result = this.Compear(tut, stud)?1:0;
            } catch(Exception ex){
                this.Ex = ex;
                return false;
            }
            return true;
        }
        
        
    }
    
    private boolean Compear(ResultSet r1, ResultSet r2) throws SQLException{
        
        r1.beforeFirst();
        r2.beforeFirst();
        for(int i=1; i<=r1.getMetaData().getColumnCount(); i++)
            if(!r1.getMetaData().getColumnName(i).equals(r2.getMetaData().getColumnName(i)))
                return false;
        
        while(r1.next()){
            r2.next();
            for(int i=1; i<=r1.getMetaData().getColumnCount(); i++)
            if(!r1.getString(i).equals(r2.getString(i)))
                return false;
        }
        
        if(r2.next()) 
            return false;
        return true;
    }
    
    public void getById(int id) throws Exception{
        this._id = id;
        this._select();
        this.ReadTaskFromDB();
        this.ReadWorkFromDB();
    }
    
    public void ReadTaskFromDB() throws Exception{
        this.Task = new Task(this.TaskId);
    }
    
    public void ReadWorkFromDB() throws Exception{
        this.Work = new Work(this.WorkId);
    }
    
    public void setTask(Task task){
        this.TaskId = task.getId();
        this.Task = task;
        this._from_db = false;
    }
    
    public void setWork(Work data){
        this.WorkId = data.getId();
        this.Work = data;
        this._from_db = false;
    }
    
    public int getResult(){
        return this.Result;
    }
    
    public Task getTask(){
        return this.Task;
    }
    
    public Work getWork(){
        return this.Work;
    }
    
    public Exception getException(){
        return this.Ex;
    }
    
    public ArrayList getResultArray(){
        return this.ResultArray;
    }
        
    
    
    
}
