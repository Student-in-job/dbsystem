/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import DataBasePak.InvalidQuery;
import DataBasePak.db;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Task extends Component {

    protected int Time;
    protected int Ball;
    protected String Answer;
    protected String Question;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 11;
    }
    
    @Override
    public String getType(){
        return "task";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public Task(String name, int day, String inventory, String answer, int time, int ball){
        
        this.Name=name;
        this.Day=day;
        this.Inventory=inventory;  
        Time=time;
        Ball=ball;
        Answer=answer;
    }
    
    
    public Task(int id) throws Exception{
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Name = rs.getString("task_name");
                    this.Day = rs.getInt("task_day");
                    this.Program = new Program(rs.getInt("program"));
                    this.Inventory = rs.getString("task_text");
                    this.Time = rs.getInt("task_time");
                    this.Ball = rs.getInt("task_ball");
                    this.Answer = rs.getString("task_answer");
                    this.Question = rs.getString("task_text");
  }
   
    
    @Override
    public boolean Write(Program program, User user) throws Exception{
        
        if(user.getID()!=program.getTeacherID()) throw new IllegalAction();
        if(!program.MayChange()) throw new IllegalAction();
        
        if(!program.MayAddTest()) throw new IllegalAction();
        if(Day>program.getDuration()) throw new InvalidParameter();
        Exception e = this.CorrectSQLQuery();
        if(e!=null) throw new InvalidQuery(e);
        
        Program = program;
        return this.write();
    }
    
    public boolean Change(String name, String inventory, int day, User user, int time, int ball, String answer) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) throw new IllegalAction();
        if(this.getProgram().isPublished()) throw new IllegalAction();
        Task task = new Task(name, day, inventory, answer, time, ball);
        task.Program = this.Program;
        task.ID = this.ID;
        DataBase db = new DataBase(task);
        db.ReWrite();
        return db.Done();
    }
    
    public int getTime(){
        return Time;
    }
    
    /*public HashMap<User, Integer> getStatistic(){
        
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
            
    }*/
    
    public int getBall(){
        
        return Ball;
    }

    public String getAnswer() {
        return this.Answer;
    }
    
    public String getQuestion() {
        return this.Question;
    }
    
    private Exception CorrectSQLQuery(){
        try{
            Statement stmt = db.getTuterConn().createStatement();
            stmt.executeQuery(this.Answer);
            return null;
        }catch(NamingException | SQLException ex){return ex;}
        
    }
    
    public ResultSet getAnswerResult() throws SQLException, NamingException{
        
            Connection conn = db.getStudentConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(this.Answer);
            //conn.close();
            return rs;
            
        
        
    }

}

