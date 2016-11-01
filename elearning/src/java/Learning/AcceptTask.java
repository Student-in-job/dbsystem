/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author ksinn
 */
public class AcceptTask  extends Parent{
    
    private Date StartTime;
    private User_courses UserHasCourse;
    private Task Task;
    private int Ball;
    private UUID WORK_KEY;
    
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
        this.WORK_KEY = UUID.randomUUID();
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            ID = db.ID();
        }
        else throw new Exception();

        
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
    
    public String getKey(){
        return WORK_KEY.toString();
    }

    @Override
    public boolean MayChange() {
        return false;
    }
    
}
