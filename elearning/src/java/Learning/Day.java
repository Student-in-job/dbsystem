/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ksinn
 */
public class Day {
    
    private Date Day;
    private ArrayList<Component> List;
    
    public Day(Date day){
        Day = day;
        List = new ArrayList<Component>();
    
    }
    
    public String getDateString(){
        SimpleDateFormat Form = new SimpleDateFormat();
        Form.applyPattern("dd.MM");
        return Form.format(Day);
    }
    
    public Component get(int i){
        return List.get(i);
    }
    
    public int Size(){
        return List.size();
    }
    
    public void put(Component comp){
            //if(0==comp.getDate().compareTo(Day))
                List.add(comp);
            
    }
            
    
}
