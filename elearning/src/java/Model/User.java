package Model;

import Staff.Log;
import Staff.Storage;  
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.Part;
import auth.GoogleAuthenticator;
import auth.SMSAuthenticator;
import auth.SecondFactor;
import auth.Secret;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.naming.NamingException;


/**
 *
 * @author ksinn
 */
public class User extends Parent implements API.User{

    protected String Mail;
    protected String Name;
    protected String Surname;
    protected String Gender;
    protected boolean Logined;
    protected Date DateRegestration;
    
    @Override
    public String _getType(){
        return "user";
    }
    
    @Override
    public boolean MayChange(){
        return true;
    }
    
    @Override
    protected HashMap<String, Object> _getParams() {
        
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("name", this.Name);
        list.put("surname", this.Surname);
        list.put("gender", this.Gender);
        list.put("mail", this.Mail);
        return list;
        
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        
        this.Name = (String) Params.get("name");
        this.Surname = (String) Params.get("surname");
        this.Gender = (String) Params.get("gender");
        this.Mail = (String) Params.get("mail");
        
    }

    @Override
    protected boolean _isCorrect() {
        
        return true;
    
    }
    
    public void getById(int id) throws Exception{
        if(id>0){
            this.ID = id;
            this._select();
        } else 
            throw new Exception("Invalid input data for user with id="+id);
    }
    
    public User(){
        this.Logined = false;
    }
    
    public boolean Change(String password, String mail, String new_password, String name, String surname, Date birthday, String gender, Part part) throws Exception
    {
        if(!Logined) throw new Exception("Illegal Action! Only logined user can cange user data.");
        return this._update();
    }
    
    public boolean Register() throws Exception
    {
        if(ID==0){
            return this._insert();
        } else 
            return false;
    }
    
    public boolean getByMail(String mail) throws Exception{
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("mail", mail);
        
        ArrayList<HashMap<String, Object>> Params = this.getObjectsParam(param);
        for(int i=0; i<1; i++){
            this.getFromParam(Params.get(i));
        }
        
        this._from_db=true;
        
        return this._isCorrect();
    }
    
    public boolean LogIn(long code, long t, String print) throws Exception{
        if(this._from_db){
            Secret secret = SecondFactor.get2factor(this.ID);
            if(secret!=null){
                switch(secret.Type){
                    case "key":{
                        GoogleAuthenticator ga = new GoogleAuthenticator();
                        this.Logined = ga.check_code(secret.Secret, code, t);
                        UserLog.inKey(this.Mail, print).Write(this.Logined?1:0);
                        break;
                    }
                    case "phone":{
                        SMSAuthenticator sa = new SMSAuthenticator();  
                        this.Logined = sa.check_code(this.ID, code, t);
                        UserLog.inSMS(this.Mail, print).Write(this.Logined?1:0);
                        break;
                    }
                }
            }
                 

                 if(!this.Logined){
                    
                 } else {
                    
                 }
        }
        return this.Logined;
    }
    
    public boolean hasSecondFactor() throws SQLException, NamingException{
        return null != SecondFactor.get2factor(this.ID);
    }
    
    public Secret getSecondFactor() throws SQLException, NamingException{
        return SecondFactor.get2factor(this.ID);
    }
    
    public String setSecretKey() throws SQLException, NamingException{
        String secretKey = GoogleAuthenticator.generateSecretKey(this.ID);
         
         Secret key = new Secret();
         key.Secret = secretKey;
         key.Type = "key";
         
         if(GoogleAuthenticator.put2factor(this.ID, key))
            return "otpauth://totp/tomcat.cyberforum.uz:elearning?secret="+secretKey+
                    "&issuer=tomcat.cyberforum.uz"+
                    "&algorithm=sha1"+
                    "&period=30";
         else return null;
    }
    
    public void LogOut() throws NamingException, SQLException{
        UserLog.out(this.Mail).Write(1);
    }
    
    @Override
    public String getMail() {
        return Mail;
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
    
    @Override
    public String getName()
    {
        return this.Name;
    }
    
    @Override
    public String getSurname()
    {
        return this.Surname;
    }
    
    @Override
    public String getIco(){
        
        String path = Storage.getRealPath()+Storage.getFileDir()+ this._getType() + "/" +String.valueOf(ID)+".png";
        if(new File(path).exists())
            return Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";
        else return "img/default_user_"+this.getGender()+".png";
    } 

    @Override
    public int getId() {
        return this.ID;
    }

    @Override
    public void setId(int data) {
        
    }

    @Override
    public void setMail(String data) {
        this._from_db = false;
        this.Mail = data;
    }

    @Override
    public void setName(String data) {
        this._from_db = false;
        this.Name = data;
    }

    @Override
    public void setSurname(String data) {
        this._from_db = false;
        this.Surname = data;
    }
    
    public void setGender(String data) {
        this._from_db = false;
        this.Gender = data;
    }

    @Override
    public void setIco(String data) {
    
    }
    
    public ArrayList<Teaching> getTeachings() throws Exception{
        ArrayList<Teaching> list = new ArrayList<Teaching>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("completed", 0);
        param.put("user", this.ID);
        Teaching teaching = new Teaching();
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = teaching.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                teaching = new Teaching();
                try{
                    teaching.getFromParam(Params.get(i));
                    teaching.ReadCourseFromDB();
                    list.add(teaching);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        return list;
    }
    
    public Teaching getTeaching(Course course) throws Exception{
        ArrayList<Teaching> list = new ArrayList<Teaching>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("user", this.ID);
        param.put("course", course.ID);
        param.put("completed", 0);
        Teaching teaching = new Teaching();
        ArrayList<HashMap<String, Object>> Params;
            Params = teaching.getObjectsParam(param);
            for(int i=0; i<1; i++){
                try{
                    teaching.getFromParam(Params.get(i));
                    teaching.ReadCourseFromDB();
                    list.add(teaching);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                    return null;
                }
            }
        return teaching;
    }
    
    public Teaching getTeaching(Program program) throws Exception{
        Teaching theaching = new Teaching();
        Connection conn = this.getConnection();
        try{
            PreparedStatement stmt = conn.prepareStatement(
                "select * from teaching where \n" +
                "user = ? and \n" +
                "deleted=0 and \n" +
                "completed=0 and \n" +
                "(select program from course where id = course) = ?;");
            stmt.setInt(1, this.ID);
            stmt.setInt(2, program.getId());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                theaching.getById(rs.getByte("id"));
                return theaching;
            } else 
                return null;
        } finally {
            if(conn!=null)
                conn.close();
        }
        
    }
    
    public boolean haveCourse(Course course) throws Exception{
        return this.getTeaching(course)!=null;
    }

    public AcceptTask getAcceptTask(Task task) throws Exception {
        
        AcceptTask accept = new AcceptTask();
        Teaching teach = this.getTeaching(task.Program);
        if(task.canStartNow(teach.getCourse())){
            HashMap<String, Object> param = new HashMap<String, Object>();
            param.put("task", task.getId());
            param.put("teaching", teach.getId());
            param.put("date(addDate)-date(now())", 0);
            //param.put("completed", -1);
            ArrayList<HashMap<String, Object>> Params;
                Params = accept.getObjectsParam(param);
                if(Params.size()>0){
                        accept.getFromParam(Params.get(0));
                        accept.ReadTeachingFromDB();
                        accept.ReadTaskFromDB();
                } else
                    accept =  null;
            if(accept!=null){
                if(accept.getCreateTime()+task.getTime()*60*1000>System.currentTimeMillis())
                    return accept;
                else 
                    return null;
            } else {
                    accept = new AcceptTask();
                    accept.setTask(task.getId());
                    accept.setTeaching(teach.ID);
                    if(accept.Write()){
                        return accept;
                    } else 
                        throw new Exception("Cannot write new accept of task "+task.getId()+"for user "+this.ID);                
            }
        } else 
            return null;
    
    }

    public ArrayList<Course> getCourseICreated() throws Exception {
        ArrayList<Course> list = new ArrayList<Course>();
        Course course;
        Connection conn=null;
        try{
            conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM course where self_study=0 and program in (select id from program where user=?);");
            stmt.setInt(1, this.ID);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                course = new Course();
                course.getById(rs.getByte("id"));
                list.add(course);
            } 
        } finally {
            if(conn!=null)
                conn.close();
        }
                
        return list;
    }

    public ArrayList<Program> getMyProgram() {
        ArrayList<Program> list = new ArrayList<Program>();
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("deleted", 0);
        param.put("user", this.ID);
        Program program = new Program();
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = program.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                program = new Program();
                try{
                    program.getFromParam(Params.get(i));
                    list.add(program);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        return list;
    }

    public ArrayList<User> getAll() {
        
        ArrayList<User> list = new ArrayList<User>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("deleted", 0);
        User user;
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = this.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                user = new User();
                try{
                    user.getFromParam(Params.get(i));
                    list.add(user);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
        return list;
    
    }

    public boolean Update() throws NamingException, SQLException {
        return this._update();
    }
    
}
