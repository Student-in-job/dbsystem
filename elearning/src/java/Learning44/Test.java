/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import Model.Program;
import Model.User;
import Staff.Log;
import Staff.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Test extends Component {

    protected int Time;
    protected int Ball;
    
    @Override
    public int getId(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 4;
    }
    
    @Override
    public String _getType(){
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
        this.getBallfromDB();
        
        

  }
   
    
    @Override
    public boolean Write(Program program, User user) throws Exception{
        
        if(user.getId()!=program.getTeacherID()) throw new IllegalAction();
        if(!program.MayChange()) throw new IllegalAction();
        
        if(!program.MayAddTest()) throw new IllegalAction();
        if(Day>program.getDuration()) throw new InvalidParameter();
        
        Program = program;
        return this.write();
    }
    
    public boolean Change(String name, String inventory, int day, User user, int time) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getId()) throw new IllegalAction();
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
                        } catch (Exception ex) {Log.Write(ex.getLocalizedMessage());;}
                }
            }
        }catch (Exception ex) { Log.Write(ex.getLocalizedMessage());;}
        
        return list;
    }
    
    public int getTime(){
        return Time;
    }
    
    public HashMap<User, Integer> getStatistic(){
        
        HashMap<User, Integer> list = new HashMap<User, Integer>();   
        try{
                PreparedStatement stmt = Staff.Storage.getConn().prepareStatement(
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
                
        }catch(SQLException ex){Log.Write(ex.getLocalizedMessage());;}
        
        return list;
            
    }
    
    public int getBall(){
        
        return Ball;
    }

    private void getBallfromDB() {
        try{
                PreparedStatement stmt = Staff.Storage.getConn().prepareStatement("select sum(test_task_ball) from test_task where test=?;");
                stmt.setInt(1, this.ID);
                ResultSet rs = stmt.executeQuery();
                rs.next();
                Ball = rs.getInt("sum(test_task_ball)");
                
        }catch(SQLException ex){Log.Write(ex.getLocalizedMessage());;}
    }

    public boolean isExem() {
        return "Exem".equals(Name);
    }

}
