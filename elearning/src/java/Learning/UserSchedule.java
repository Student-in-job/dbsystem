/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class UserSchedule {
    
    private HashMap<String,Day> List;
    protected SimpleDateFormat Form;
                        
    
    
    
    public UserSchedule(){
        List = new HashMap<String, Day>();
        Form = new SimpleDateFormat();
        Form.applyPattern("yyyy-MM-dd");
    }
    
    public Day getDay(Calendar date){
        return List.get(Form.format(date.getTime()));
    }
    
    
    
   public void addSchedule(Schedule schedule){
       
       if(schedule==null) return; 
       ArrayList<Component> sch = schedule.getList();
        Day day = null;
        Component mat = null;
        for(int i=0; i<sch.size(); i++){
            mat = sch.get(i);
            Date dd = mat.getDate();
            day = List.get(Form.format(dd));
            if(day==null){
                
                day = new Day(dd);
                day.put(mat);
                List.put(Form.format(dd), day);
            }
            else{
                day.put(mat);
            }
        }
   }
   
   public boolean isEmpty(){
       return List.isEmpty();
   }
    
    
}
