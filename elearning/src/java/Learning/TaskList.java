 /* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.IllegalAction;
import DataBasePak.InvalidParameter;
import DataBasePak.Log;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
 public class TaskList  extends Component {

    protected int Ball; 
    protected int time;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 13;
    }
    
    @Override
    public String getType(){
        return "task_list";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public TaskList(String name, int day, String inventory){
        
        this.Name=name;
        this.Day=day;
        this.Inventory=inventory;  
    }
    
    
    public TaskList(int id) throws Exception{
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Name = rs.getString("task_list_name");
                    this.Day = rs.getInt("task_list_day");
                    this.Program = new Program(rs.getInt("program"));
                    this.Inventory = rs.getString("task_list_text");
        this.getBallfromDB();
        
        

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
    
    public boolean Change(String name, String inventory, int day, User user) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) throw new IllegalAction();
        if(this.getProgram().isPublished()) throw new IllegalAction();
        TaskList list = new TaskList(name, day, inventory);
        list.Program = this.Program;
        list.ID = this.ID;
        DataBase db = new DataBase(list);
        db.ReWrite();
        return db.Done();
    }
    
    public ArrayList<Task> getTask(){
        ArrayList<Task> list = new ArrayList<Task>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("task");
            if(db.Done()&&rs!=null){
                while(rs.next()){
                        try {
                            int i = rs.getInt("task_id");
                            Task task = new Task(i);
                            list.add(task);
                        } catch (Exception ex) {Log.getOut(ex.getMessage());}
                }
            }
        }catch (Exception ex) { Log.getOut(ex.getMessage());}
        
        return list;
    }
    
    
    public HashMap<User, Integer> getStatistic(){
        
        HashMap<User, Integer> list = new HashMap<User, Integer>();   
        try{
                PreparedStatement stmt = DataBasePak.db.getConn().prepareStatement(
                                        "SELECT (select user from user_has_course where user_has_course_id=accept_test.user_has_course) as 'user', max(accept_test_ball) as 'accept_test_ball' " +
                                        "FROM accept_test  " +
                                        "where test=?  " +
                                        "group by user " +
                                        "order by accept_test_ball desc;");
                stmt.setInt(1, ID);
                ResultSet rs = stmt.executeQuery();
                while(list.size()<3&&rs.next())
                    try{
                        list.put(new User(rs.getInt("user")), rs.getInt("accept_test_ball"));
                    }catch(Exception ex){}
                
        }catch(SQLException ex){Log.getOut(ex.getMessage());}
        
        return list;
            
    }
    
    public int getBall(){
        
        return Ball;
    }

    private void getBallfromDB() {
        try{
                PreparedStatement stmt = DataBasePak.db.getConn().prepareStatement("select sum(task_ball) from task where task_list=?;");
                stmt.setInt(1, this.ID);
                ResultSet rs = stmt.executeQuery();
                rs.next();
                Ball = rs.getInt("sum(task_ball)");
                
        }catch(SQLException ex){Log.getOut(ex.getMessage());}
    }
    
    public int getTime(){
        
        return Ball;
    }

    private void getTimefromDB() {
        try{
                PreparedStatement stmt = DataBasePak.db.getConn().prepareStatement("select sum(task_ball) from task where task_list=?;");
                stmt.setInt(1, this.ID);
                ResultSet rs = stmt.executeQuery();
                rs.next();
                Ball = rs.getInt("sum(task_ball)");
                
        }catch(SQLException ex){Log.getOut(ex.getMessage());}
    }
    

}

