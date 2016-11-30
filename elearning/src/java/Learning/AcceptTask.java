/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

/**
 *
 * @author ksinn
 */
public class AcceptTask  extends Parent implements API.Work{
    
    private Date StartTime;
    private User_courses UserHasCourse;
    private Task Task;
    private int Ball;
    private UUID WORK_KEY;
    
    @Override
    protected HashMap<String, Object> _getParams() {
        
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("ball", this.Ball);
        list.put("times", this.Time);
        list.put("question", this.Question);
        list.put("answer", this.Answer);
        list.put("group_id", this.GroupId);
        list.put("img", this.Img);
        return list;
        
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        
        this.Ball = (int) Params.get("ball");
        this.Time = (int) Params.get("times");
        this.Question = (String) Params.get("question");
        this.Answer = (String) Params.get("answer");
        this.GroupId = (int) Params.get("group_id");
        this.Img = (String) Params.get("img");
        
    }

    @Override
    protected boolean _isCorrect() {
        
    }
    

    public AcceptTask() {
        
    }
    
    @Override
    public String _getType(){
        return "accept_task";
    }
    
    public AcceptTask(User_courses user_course, Task task) throws Exception{
        this.Task = task;
        this.UserHasCourse = user_course;
        this.WORK_KEY = UUID.randomUUID();
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            ID = db.ID();
        }
        else throw new Exception();

        
    }
    
    public void getByKey() throws Exception{
        DataBase db = new DataBase(this);
        ResultSet rs = db.FindWork();
        rs.next();
        this.ID=rs.getInt("accept_task_id");
        this.StartTime=new Date(rs.getTimestamp("accept_task_date").getTime());
        this.UserHasCourse = new User_courses(rs.getInt("user_has_course"));
        this.Task= new Task(rs.getInt("task"));
        this.Ball=rs.getInt("accept_task_ball");
        
    }        
    
    public User_courses getUserHasCourse(){
        return this.UserHasCourse;
    }
    
    public int getBall(){
        return Ball;
    }
    
    public int getTaskID(){
        return Task.getID();
    }
    
    public Task getTask(){
        return Task;
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
        return UserHasCourse.getUser_id();
    }

    @Override
    public long getTime() {
        return StartTime.getTime();
    }

    @Override
    public int getGroup() {
        return Task.Group;
    }

    @Override
    public int getCount() {
        return Task.Count;
    }

    @Override
    public long getLiveTime() {
        return Task.Time*60*1000;
    }

    @Override
    public void setWorkKey(String data) {
        WORK_KEY=UUID.fromString(data);
    }

    @Override
    public void setUser(int data) {
        
    }

    @Override
    public void setTime(long data) {
        
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
    public int getResult() {
       return this.Ball;
    }

    @Override
    public void setResult(int data) {
        this.Ball = data;
    }

    public void putMark(int parseInt) throws Exception {
        this.Ball = parseInt;
        DataBase db = new DataBase(this);
        db.ReWrite();
    }

}
