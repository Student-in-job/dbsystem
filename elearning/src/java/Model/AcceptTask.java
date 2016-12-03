/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;


/**
 *
 * @author ksinn
 */
public class AcceptTask  extends Parent implements API.Work{
    
    private Date CreateDate;
    private Teaching Teaching;
    private int TeachingId;
    private UUID WORK_KEY;
    private Task Task;
    private int TaskId;
    private int Completed;
    
    public AcceptTask(){
        this.Teaching = new Teaching();
        this.Task = new Task();
    }
    
    public void ReadTaskFromDB() throws Exception{
        this.Task.getById(this.TaskId);
    }
    
    public void ReadTeachingFromDB() throws Exception{
        this.Teaching.getById(this.TeachingId);
    }
    
    @Override
    protected HashMap<String, Object> _getParams() {
        
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("completed", this.Completed);
        list.put("task", this.Task.getId());
        list.put("teaching", this.Teaching.getId());
        list.put("work_key", this.WORK_KEY.toString());
        return list;
    }
    
    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        
        this.CreateDate = (Date) Params.get("addDate");
        this.WORK_KEY = UUID.fromString((String) Params.get("work_key"));
        this.TeachingId = (int) Params.get("teaching");
        this.TaskId = (int) Params.get("task");
        this.Completed = (int) Params.get("completed");
        
    }

    @Override
    protected boolean _isCorrect() {
       return true; 
    }
    
    @Override
    public String _getType(){
        return "accept_task";
    }
    
    public void getById(int id) throws Exception{
        if(id>0){
            this.ID = id;
            this._select();
            this.ReadTaskFromDB();
            this.ReadTeachingFromDB();
        } else 
            throw new Exception("Invalid input data!");
    }  
    
    public void getByKey() throws Exception{
            HashMap<String, Object> param = new HashMap<String, Object>();
            param.put("work_key", this.WORK_KEY.toString());

            ArrayList<HashMap<String, Object>> Params = this.getObjectsParam(param);
            for(int i=0; i<1; i++){
                this.getFromParam(Params.get(i));
            }
            this.ReadTaskFromDB();
            this.ReadTeachingFromDB();
            this._from_db=true;
        
    }  
    
    public boolean Write() throws Exception{
        this.WORK_KEY = UUID.randomUUID();
        this.Completed=0;
        this.ReadTaskFromDB();
        this.ReadTeachingFromDB();
        return this._insert();
    }
    
    public Teaching getTeaching(){
        return this.Teaching;
    }
    
    @Override
    public int getCompleted(){
        return this.Completed;
    }
    
    public Task getTask(){
        return this.Task;
    }

    @Override
    public boolean MayChange() {
        return false;
    }

    @Override
    public String getWorkKey() {
        return WORK_KEY.toString();
    }

    @Override
    public int getUser() {
        return this.Teaching.getUser().getId();
    }

    @Override
    public long getCreateTime() {
        return CreateDate.getTime();
    }

    @Override
    public int getGroupId() {
        return Task.getGroupId();
    }

    @Override
    public int getCount() {
        return Task.getTotalCount();
    }

    @Override
    public long getLiveTime() {
        return Task.getTime()*60*1000;
    }

    @Override
    public void setWorkKey(String data) {
        this._from_db = false;
        WORK_KEY=UUID.fromString(data);
    }

    @Override
    public void setUser(int data) {
        
    }

    @Override
    public void setGroup(int data) {
    }

    @Override
    public void setCount(int data) {
        
    }

    @Override
    public void setLiveTime(long data) {
        
    }

    @Override
    public void setCompleted(int data) {
        this._from_db = false;
        this.Completed = data;
    }

    public void putMark(int parseInt) throws Exception {
        this.Completed = parseInt;
        this._update();
    }

    @Override
    public void setCreateTime(long data) {
        
    }
    
    public void setTeaching(int data){
        this.TeachingId = data;
    }
    
    public void setTask(int data){
        this.TaskId=data;
    }

    

}
