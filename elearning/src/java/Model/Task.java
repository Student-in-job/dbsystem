/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Staff.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import Learning.Component;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author ksinn
 */
public class Task extends Component {

    protected int Period;
    protected int Time;
    protected int StartTime;
    protected int Group;
    protected int Count;

    Task() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    Task() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public int getId(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 11;
    }
    
    @Override
    public String _getType(){
        return "task";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public Task(String name, String inventory, int day, int period, int time, int starttime, int group, int count){
        
        this.Name=name;
        this.Day=day; 
        this.Inventory=inventory; 
        Time=time;
        Period = period;
        StartTime = starttime;
        Group = group;
        Count = count;
    }
    
    
    public Task(int id) throws Exception{
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Name = rs.getString("task_name");
                    this.Day = rs.getInt("task_day");
                    this.Period = rs.getInt("task_period");
                    this.Program = new Program(rs.getInt("program"));
                    this.Inventory = rs.getString("task_text");
                    this.Time = rs.getInt("task_time");
                    this.StartTime = rs.getInt("task_starttime");
                    this.Group = rs.getInt("task_group");
                    this.Count = rs.getInt("task_count");
  }
    
    public boolean canStart(){
        return true;
    }
   
    
    @Override
    public boolean Write(Program program, User user) throws Exception{
        
        if(user.getId()!=program.getTeacherID()) throw new IllegalAction();
        if(!program.MayChange()) throw new IllegalAction();
        
        if(Day+Period>program.getDuration()) throw new InvalidParameter();
        
        Program = program;
        return this.write();
    }
    
    public boolean Change(User user, String name, String inventory, int day, int period, int time, int starttime, int group, int count) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getId()) throw new IllegalAction();
        if(this.getProgram().isPublished()) throw new IllegalAction();
        Task task = new Task(name, inventory, day, period, time, starttime, group, count);
        task.Program = this.Program;
        task.ID = this.ID;
        DataBase db = new DataBase(task);
        db.ReWrite();
        return db.Done();
    }
    
    public int getTime(){
        return Time;
    }
    
    public int getStartTime(){
        return StartTime;
    }
    
    public int getPeriod(){
        
        return Period;
    }
    
    public int getCount(){
        return Count;
    }
    
    public int getGroup(){
        return Group;
    }

    boolean canStartNow(User_courses uhc) {
        
        Calendar now = Calendar.getInstance();
        Calendar time = Calendar.getInstance();
        
        time.set(Calendar.HOUR_OF_DAY, this.StartTime);
        if(now.before(time))
            return false;
        
        time.add(Calendar.MINUTE, this.Time);
        if(now.after(time))
            return false;
        
        
        time.setTime(uhc.getCourse().getDate());
        
        time.add(Calendar.DAY_OF_YEAR, this.Day-1);
        if(now.before(time))
            return false;

        time.add(Calendar.DAY_OF_YEAR, this.Period-1);
        if(now.after(time))
            return false;
        
        
        return true;
    }


}
