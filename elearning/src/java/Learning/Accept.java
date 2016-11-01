/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.util.Date;

/**
 *
 * @author ksinn
 */
public abstract class Accept extends Parent{
    
    
    protected Date StartTime;
    protected User_courses UserHasCourse;
    
    
    abstract public int getBall();
    
    public User_courses getUserHasCourse(){
        return this.UserHasCourse;
    }
        
    public Date getStartTime(){
        return StartTime;
    }
    
    @Override
    public boolean MayChange(){
        return false;
    }
    
    abstract public Date getEndTime();
}