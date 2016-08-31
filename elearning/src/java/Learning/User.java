package Learning;

import DataBasePak.*;  
import java.io.File;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.Part;
import org.apache.commons.codec.digest.DigestUtils;



/**
 *
 * @author ksinn
 */
public class User extends Parent{

    protected String mail;
    protected String password;
    protected String Name;
    protected String Surname;
    protected java.sql.Date Birthday;
    protected String Gender;
    protected boolean Logined;
    protected int Rating;
    protected String Ico;
    protected java.sql.Date DateRegestration;
    
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
     
    public User(int id) throws Exception{
        
        this.ID=id;    
        DataBase db = new DataBase(this);
                ResultSet rs = db.Find(); 
                rs.next();
                            Logined = false;
                            this.Name = rs.getString("user_name");
                            this.Surname = rs.getString("user_surname");
                            this.Gender = rs.getString("gender");
                            Birthday = rs.getDate("birthday");
                            this.DateRegestration = rs.getDate("addDate");

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
    
    public User(){}
    
    /*public ArrayList<Integer> getTestResult(Test test, Course course){
        ArrayList<Integer> list = new ArrayList<Integer>();
        try{
            PreparedStatement stmt = db.getConn().prepareStatement
            ("select accept_test_ball, accept_test_date from accept_test where test=1 and user_has_course=1;");
            stmt.setInt(1, this.ID);
            stmt.setInt(2, this.getHasCours(course).getID());
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                try{
                    list.add(rs.getInt("accept_test_ball"));
                }catch(Exception ex){}
            }
                        
            }catch(Exception ex){ Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage()); return null;}
    
        return list;
    }*/
    
    public Course getActiveCourse(int program){
        try{
            PreparedStatement stmt = db.getConn().prepareStatement
            ("select * from user_has_course where user=? and " +
             "course in (select course_id from course where program=?) and " +
            "user_has_course_complited is null;");
            stmt.setInt(1, this.ID);
            stmt.setInt(2, program);
            ResultSet rs = stmt.executeQuery();
            if(rs.next())
             return new Course(rs.getInt("course"));
            else return null;
                        
            }catch(Exception ex){ Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage()); return null;}
    }
    
    public void SendPassword() throws Exception{
        
        if(this.Logined) throw new IllegalAction();
        DataBase db = new DataBase(this);
        ResultSet rs = db.FindUser();
        rs.next();
        SendMail Mail = new SendMail();
        Mail.send("Reset password", "You password is \n"+rs.getString("passwords"), this.mail);
    }
    
    public ArrayList<User> Find(String find) {
        ArrayList<User> list = new ArrayList<User>();
        try{
            PreparedStatement stmt = db.getConn().prepareStatement
            ("select * from user where user_deleted = 0 and (user_name like ? or user_surname like ?);");
            stmt.setString(1, "%"+find+"%");
            stmt.setString(2, "%"+find+"%");
            ResultSet rs = stmt.executeQuery();
                    while(rs.next()){
                        try {
                            list.add(new User(rs.getInt("user_id")));
                        } catch (SQLException ex) {
                        Log.getOut(ex.getMessage());
                        }
                    }
                }catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
                }
        return list;
    }
    
    public ArrayList<User> getAll(){
        ArrayList<User> list = new ArrayList<User>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.All();
                    while(rs.next()){
                        try {
                            list.add(new User(rs.getInt("user_id")));
                        } catch (SQLException ex) {
                        Log.getOut(ex.getMessage());
                        }
                    }
                }catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
                }
        return list;
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
                            if(rs.getDate("user_has_course_complited")!=null) continue;
                            Course c = new Course(rs.getInt("course"));
                            list.add(c);
                        }catch (SQLException ex) { Log.getOut(ex.getMessage());}
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        return list;
    }
    
    public ArrayList<Course> getLearnedCourses(){
        ArrayList<Course> list = new ArrayList<Course>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("user_has_course");
                    while(rs.next())
                        try{
                            if(rs.getDate("user_has_course_complited")==null) continue;
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
 
    public boolean Change(String password, String mail, String new_password, String name, String surname, Date birthday, String gender, Part part) throws Exception
    {
        if(!Logined) throw new IllegalAction();
        if(!this.password.equals(password)) throw new IllegalAction();
        
        User us = new User(mail, new_password, name, surname, birthday, gender);
        
        if(us.mail==null) us.mail = this.mail;
        if(us.password == null) us.password = this.password;
        if(us.Name==null) us.Name = this.Name;
        if(us.Surname==null) us.Surname = this.Surname;
        if(us.Birthday==null) us.Birthday = this.Birthday;
        if(us.Gender==null) us.Gender = this.Gender;
        
        us.ID = this.ID;
        DataBase db = new DataBase(us);
        db.ReWrite();
        if(part!=null){
            IcoFile file = new IcoFile(part, this);
            file.SaveFile();
        }            
        return db.Done();
    }
    
    public void Register(Part part) throws Exception
    {
        if(!Logined){
            if(this.write()){
                SendMail mail = new SendMail();
                mail.send("Regestration", "blablabla", this.mail);
            }
            IcoFile file = new IcoFile(part, this);
            file.SaveFile();
        }
        else throw new IllegalAction(); 
    }

    public boolean Authorize() throws Exception{
        
            DataBase db = new DataBase(this);
                ResultSet rs = db.FindUser(); 
                rs.next();
                if(password.equals(DigestUtils.md2Hex(rs.getString("passwords")))){
                            Logined = true;
                            this.ID =  rs.getInt("user_id");
                            this.Name = rs.getString("user_name");
                            this.Surname = rs.getString("user_surname");
                            this.Gender = rs.getString("gender");
                            Birthday = rs.getDate("birthday");
                            this.DateRegestration = rs.getDate("addDate");
                            password = rs.getString("passwords");
                    return true;
                }
                else return false;
    }
    
    public String getMail() {
        
        return mail;
    }

    public Date getBirthday() {
        return Birthday;
    }
    
    public Date getDateRegestration() {
        return DateRegestration;
    }

    public String getGender() {
        return Gender;
    }
    
    public String getGenderString() {
        return Gender.equals("w")?"Women":"Men";
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
    
    public String getIco(){
        
        String path = db.getFileDir() + this.getType() + "/" +String.valueOf(ID)+".png";;
        if(new File(db.getRealPath()+path).exists())
            return db.getFileDir() + this.getType() + "/" +String.valueOf(ID)+".png";
        else return "img/default_user_"+this.getGender()+".png";
    } 
}
