/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.Log;
import DataBasePak.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ksinn
 */
public class Test extends Component {

    protected int Time;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 4;
    }
    
    @Override
    public String getType(){
        return "test";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public Test(String name, int day, String inventory, int time){
        
        this.Name=name;
        this.Day=day;
        this.Inventory=inventory;  
        Time=time;
    }
    
    
    public Test(int id) throws Exception{
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Name = rs.getString("test_name");
                    this.Day = rs.getInt("test_day");
                    this.Program = new Program(rs.getInt("program"));
                    this.Inventory = rs.getString("test_text");
                    this.Time = rs.getInt("test_time");
        
        
        

  }
   
    
    @Override
    public boolean Write(Program program, User user) throws Exception{
        
        if(user.getID()!=program.getTeacherID()) throw new IllegalAction();
        if(!program.MayChange()) throw new IllegalAction();
        
        if(!program.MayAddTest()) throw new IllegalAction();
        if(Day>program.getDuration()) throw new InvalidParameter();
        
        Program = program;
        return this.write();
    }
    
    public boolean Change(String name, String inventory, int day, User user, int time) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) throw new IllegalAction();
        if(this.getProgram().isPublished()) throw new IllegalAction();
        Test test = new Test(name, day, inventory, time);
        test.Program = this.Program;
        test.ID = this.ID;
        DataBase db = new DataBase(test);
        db.ReWrite();
        return db.Done();
    }
    
    public ArrayList<TestTask> getTask(){
        ArrayList<TestTask> list = new ArrayList<TestTask>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("test_task");
            if(db.Done()&&rs!=null){
                while(rs.next()){
                        try {
                            int i = rs.getInt("test_task_id");
                            TestTask task = new TestTask(i);
                            list.add(task);
                        } catch (Exception ex) {Log.getOut(ex.getMessage());}
                }
            }
        }catch (Exception ex) { Log.getOut(ex.getMessage());}
        
        return list;
    }
    
    public int getTime(){
        return Time;
    }
    
    public HashMap<String, String> getStatistic(){
        
        HashMap<String, String> inf = new HashMap<String, String>();
                inf.put("MaxBall", "Unknown");
                inf.put("MinBall", "Unknown");
                inf.put("AverageBall", "Unknown");
                inf.put("CountOfPass", "Unknown");
                inf.put("CountOfUserWhoPass", "Unknown");    
        try{
                Statement stmt = DataBasePak.db.getConn().createStatement();
                ResultSet rs;
                
                try{rs = stmt.executeQuery("select max(accept_test_ball) as 'inf' from accept_test where test=2;");
                rs.next(); inf.put("MaxBall", rs.getString("inf"));
                }catch(Exception ex){}
                
                try{rs = stmt.executeQuery("select min(accept_test_ball)  as 'inf' from accept_test where test=2;");
                rs.next(); inf.put("MinBall", rs.getString("inf"));
                }catch(Exception ex){}
                
                try{rs = stmt.executeQuery("select avg(accept_test_ball)  as 'inf' from accept_test where test=2;");
                rs.next(); inf.put("AverageBall", rs.getString("inf"));
                }catch(Exception ex){}
                
                try{rs = stmt.executeQuery("select count(accept_test_id)  as 'inf' from accept_test where not accept_test_ball is null and test=2;");
                rs.next(); inf.put("CountOfPass", rs.getString("inf"));
                }catch(Exception ex){}
                
                try{rs = stmt.executeQuery("select count(DISTINCT user_has_course)  as 'inf' from accept_test where not accept_test_ball is null and test=2;");
                rs.next(); inf.put("CountOfUserWhoPass", rs.getString("inf"));
                }catch(Exception ex){}
                
            }catch(SQLException ex){Log.getOut(ex.getMessage());}
        
        return inf;
            
    }

}
