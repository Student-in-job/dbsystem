/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import java.sql.ResultSet;

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
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 11;
    }
    
    @Override
    public String getType(){
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
        
        if(user.getID()!=program.getTeacherID()) throw new IllegalAction();
        if(!program.MayChange()) throw new IllegalAction();
        
        if(Day+Period>program.getDuration()) throw new InvalidParameter();
        
        Program = program;
        return this.write();
    }
    
    public boolean Change(User user, String name, String inventory, int day, int period, int time, int starttime, int group, int count) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) throw new IllegalAction();
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


}
