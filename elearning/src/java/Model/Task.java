/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Calendar;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Task extends Component  {

    private int GroupId;
    private int TitalCount;
    private int PassingCount;
    private int Time;
    private int StartTime;
    private int Period;

    public Task() {
        
    }
    
    @Override
    public String _getType(){
        return "task";
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
    
    public int getTotalCount(){
        return this.TitalCount;
    }
    
    public int getPassingCount(){
        return this.PassingCount;
    }
    
    public int getGroupId(){
        return GroupId;
    }
    
    public void setTime(int data){
        this._from_db=false;
        Time=data;
    }
    
    public void setStartTime(int starttime){
        this._from_db=false;
        StartTime = starttime;
    }
    
    public void setPeriod(int period){
        this._from_db=false;
        Period = period;
    }
    
    public void setTotalCount(int count){
        this._from_db=false;
        this.TitalCount = count;
    }
    
    public void setPassingCount(int count){
        this._from_db=false;
        this.PassingCount = count;
    }
    
    public void setGroupId(int groupId){
        this._from_db=false;
        this.GroupId = groupId;
    }

    boolean canStartNow(Course course) {
        
        Calendar now = Calendar.getInstance();
        Calendar time = Calendar.getInstance();
        
        time.set(Calendar.HOUR_OF_DAY, this.StartTime);
        if(now.before(time))
            return false;
        
        time.add(Calendar.MINUTE, this.Time);
        if(now.after(time))
            return false;
        
        
        time.setTime(course.getStartDate());
        
        time.add(Calendar.DAY_OF_YEAR, this.Day-1);
        if(now.before(time))
            return false;

        time.add(Calendar.DAY_OF_YEAR, this.Period-1);
        if(now.after(time))
            return false;
        
        
        return true;
    }

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("group_id", this.GroupId);
        list.put("name", this.Name);
        list.put("day", this.Day);
        list.put("program", this.ProgramId);
        list.put("total_count", this.TitalCount);
        list.put("passing_count", this.PassingCount);
        list.put("time", this.Time);
        list.put("starttime", this.StartTime);
        list.put("period", this.Period);
        
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.Name = (String) Params.get("name");
        this.GroupId = (int) Params.get("group_id");
        this.Day = (int) Params.get("day");
        this.ProgramId = (int) Params.get("program");
        this.TitalCount = (int) Params.get("total_count");
        this.PassingCount = (int) Params.get("passing_count");
        this.Time = (int) Params.get("time");
        this.StartTime = (int) Params.get("starttime");
        this.Period = (int) Params.get("period");
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }


}
