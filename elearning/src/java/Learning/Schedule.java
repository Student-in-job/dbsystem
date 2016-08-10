package Learning;


import DataBase.DataBase;
import DataBase.Log;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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
    private int CourseID;

    public Schedule(ArrayList<Component> comp){
        List = (ArrayList<Component>) comp.clone();
    }
    
    public Schedule(Course course) throws Exception{
        
        List = new ArrayList<Component>();
        DataBase db = new DataBase(course);
        ResultSet rs = db.Find("schedule_has_material");
                if(db.Done()&&rs!=null){
                    while(rs.next()){
                        try{
                            Material mat = new Material(rs.getInt("material"));
                            SimpleDateFormat format = new SimpleDateFormat();
                            format.applyPattern("yyyy-MM-dd hh:mm:ss");
                            mat.setDate(format.parse(rs.getString("date_time")));
                            mat.setCourse(course.getID());
                            List.add(mat);
                        }
                        catch(Exception ex){ Log.getOut(ex.getMessage());}
                    }
                }
                
                rs = db.Find("schedule_has_test");
                if(db.Done()&&rs!=null){
                    while(rs.next()){
                        try{
                            Test test = new Test(rs.getInt("test"));
                            SimpleDateFormat format = new SimpleDateFormat();
                            format.applyPattern("yyyy-MM-dd hh:mm:ss");
                            test.setDate(format.parse(rs.getString("date_time")));
                            test.setCourse(course.getID());
                            List.add(test);
                        }
                        catch(Exception ex){ Log.getOut(ex.getMessage());}
                    }
                }
                
        else throw new Exception();
        
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
        return CourseID;
    }
    
    
    
}
