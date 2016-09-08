package Learning;


import DataBasePak.DataBase;
import DataBasePak.Log;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ksinn
 */
public class Schedule{
    
    private ArrayList<Component> List;
    private Course Course;

    public Schedule(ArrayList<Component> comp){
        List = (ArrayList<Component>) comp.clone();
    }
    
    public Schedule(Course course){
        this.Course = course;
        List = new ArrayList<Component>();
        DataBase db = new DataBase(course);
        ResultSet rs;
        try{
            rs = db.Find("schedule_has_material");
                        while(rs.next()){
                            try{
                                Material mat = new Material(rs.getInt("material"));
                                mat.setDate(new Date(rs.getDate("date_time").getTime()));
                                List.add(mat);
                            }
                            catch(Exception ex){ Log.getOut(ex.getMessage());}
                        }
        } catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        try{
                    rs = db.Find("schedule_has_test");
                        while(rs.next()){
                            try{
                                Test test = new Test(rs.getInt("test"));
                                SimpleDateFormat format = new SimpleDateFormat();
                                test.setDate(new Date(rs.getDate("date_time").getTime()));
                                List.add(test);
                            }
                            catch(Exception ex){ Log.getOut(ex.getMessage());}
                        } 
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        try{
                    rs = db.Find("schedule_has_task");
                        while(rs.next()){
                            try{
                                Task task = new Task(rs.getInt("task"));
                                task.setDate(new Date(rs.getDate("date_time").getTime()));
                                List.add(task);
                            }
                            catch(Exception ex){ Log.getOut(ex.getMessage());}
                        } 
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
                    
        Collections.sort(List, new Comparator<Component>() {
            public int compare(Component o1, Component o2) {
                return o1.getDate().compareTo(o2.getDate());
            }
        });
    
    }
        
    public ArrayList<Component> getList(){
        return List;
    }
    
    public int getCourseID(){
        return Course.getID();
    }
    
    public Course getCourse(){
        return Course;
    }
    
    public Date getDateOf(Component comp){
        for(int i=0; i<List.size(); i++){
            if(List.get(i).getTypeIndex()==comp.getTypeIndex()&&List.get(i).ID==comp.getID()){
                return List.get(i).getDate();
            }
        }
        return null;
    }
    
}
