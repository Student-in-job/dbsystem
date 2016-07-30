package Learning;


import DataBase.DataBase;
import DataBase.Log;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ksinn
 */
public class Schedule extends Parent{
    
    private ArrayList<Component> List;
    private int CourseID;

    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 9;
    }
    
    @Override
    public String getType(){
        return "schedules";
    }
    
    public Schedule(int id) throws Exception{
        
        this.ID = id;
        List = new ArrayList<Component>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    this.CourseID = rs.getInt("course");
                    

                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
            
                rs = db.Find("material_has_schedule");
                if(db.Done()&&rs!=null){
                    while(rs.next()){
                        try{
                            Material mat = new Material(rs.getInt("material"));
                            SimpleDateFormat format = new SimpleDateFormat();
                            format.applyPattern("yyyy-MM-dd hh:mm:ss");
                            mat.setDate(format.parse(rs.getString("date_time")));
                            List.add(mat);
                        }
                        catch(Exception ex){ Log.getOut(ex.getMessage());}
                    }
                }
                
        }
        else throw new Exception();
        
        
    }
    
    public ArrayList<Component> getList(){
        return List;
    }
    
}
