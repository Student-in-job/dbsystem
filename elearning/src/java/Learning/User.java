package Learning;

import java.util.Date;
import DataBase.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



/**
 *
 * @author ksinn
 */
public class User extends Parent{
    
    protected int ID;
    protected String mail;
    protected String password;
    protected String Name;
    protected String Surname;
    protected java.util.Date Birthday;
    protected String Gender;
    protected boolean Logined;
    protected int Rating;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 1;
    }
    
    @Override
    public String getType(){
        return "user";
    }
    
    @Override
    public boolean MayChange(){
        return true;
    }
            
  public User(String mail, String password, String name, String surname, Date birthday, String gender)
    {
        this.Logined = false;
        this.mail = mail;
        this.password = password;
        this.Name = name;
        this.Surname = surname;
        this.Birthday = birthday;
        this.Gender = gender;
        
    }
  
  public User(String mail, String password){
        Logined = false;
        this.mail = mail;
        this.password = password;
    }

  public User_courses getHasCours(Course course) throws Exception{
      
        PreparedStatement stmt = db.getConn().prepareStatement
        ("select * from user_has_course where course = ? and user = ?;");
        stmt.setInt(1, course.getID());
        stmt.setInt(2, this.ID);
        ResultSet rs = stmt.executeQuery();
        if(rs!=null){
            if(rs.next())
                return new User_courses(rs.getInt("user_has_course_id"));
        }
        throw new ObjectNotFind();
  }
  
  public ArrayList<Program> getActivePrograms(){
      
        ArrayList<Program> list = new ArrayList<Program>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("program");
                    while(rs.next())
                        try{
                            if(rs.getString("program_state").equals("active"))
                            list.add(new Program(rs.getInt("program_id")));
                        }catch (SQLException ex) { Log.getOut(ex.getMessage());}
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }

        return list;
    }
  
    public ArrayList<Program> getCreatedPrograms(){
        
        ArrayList<Program> list = new ArrayList<Program>();
        try{
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("program");
            while(rs.next())
                    try{
                        if(rs.getString("program_state").equals("created"))
                        list.add(new Program(rs.getInt("program_id")));
                    }catch (SQLException ex) { Log.getOut(ex.getMessage());}
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        return list;
    }
  
    public UserSchedule getMySchedule(){
        UserSchedule uschedule= new UserSchedule();
        ArrayList<Course> courses = this.getLearningCourses();
        for(int i=0; i<courses.size(); i++)
            uschedule.addSchedule(courses.get(i).getSchadule());
        return uschedule;
    }
  
    public ArrayList<Course> getLearningCourses(){
        ArrayList<Course> list = new ArrayList<Course>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("user_has_course");
                    while(rs.next())
                        try{
                            Course c = new Course(rs.getInt("course"));
                            list.add(c);
                        }catch (SQLException ex) { Log.getOut(ex.getMessage());}
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        return list;
    }
    
    public ArrayList<Course> getTeachengCourses(){
        
        ArrayList<Course> list = new ArrayList<Course>();
        try{
            PreparedStatement stmt = db.getConn().prepareStatement
            ("select * from course where program in (select program_id from program where user = ?) and course_deleted=0;");
            stmt.setInt(1, this.ID);
            ResultSet rs = stmt.executeQuery();
            if(rs!=null){
                    while(rs.next())
                        try{
                            list.add(new Course(rs.getInt("course_id")));
                        }   catch (SQLException ex) { Log.getOut(ex.getMessage());}
            }
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        return list;
    }
 
    public boolean Change(String mail, String password, String name, String surname, Date birthday, String gender) throws Exception
    {
        if(!Logined) throw new IllegalAction();
        User us = new User(mail, password, name, surname, birthday, gender);
        us.ID = this.ID;
        DataBase db = new DataBase(us);
        db.ReWrite();
        return db.Done();
    }
    
    public boolean Register() throws Exception
    {
        if(!Logined){
            return this.write();
        }
        else throw new IllegalAction(); 
    }

    public boolean Authorize() throws Exception{
        
            DataBase db = new DataBase(this);
                ResultSet rs = db.FindUser(); 
                rs.next();
                if(password.equals(rs.getString("passwords"))){
                            Logined = true;
                            this.ID =  rs.getInt("user_id");
                            this.Name = rs.getString("user_name");
                            this.Surname = rs.getString("user_surname");
                            this.Gender = rs.getString("gender");
                            Birthday = new Date(rs.getDate("birthday").getTime());
                            
                    return true;
                }
                else return false;
    }
    
    public String getMail() {
        
        return mail;
    }

    public Date getDirthday() {
        return Birthday;
    }

    public String getGender() {
        return Gender;
    }
    
        public boolean isLogined()
    {
        return this.Logined;
    }
    
    public String getName()
    {
        return this.Name;
    }
    
    public String getSurname()
    {
        return this.Surname;
    }
    
    public int getRating()
    {
        return this.Rating;
    }
    
    public String getPassword()
    {
        return this.password;
    }
    
}
