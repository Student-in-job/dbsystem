package Learning;

import java.util.Date;
import DataBase.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    protected Date Birthday;
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
    public String Correct(){
        if("".equals(mail))
            return "e-Mail";
        if("".equals(Name))
            return "Name";
        if("".equals(Surname))
            return "Surname";
        if("".equals(password))
            return "Password";
        return null;
        
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
        FromDataBase = false;
        
    }
  
  public User(String mail, String password){
        Logined = false;
        this.mail = mail;
        this.password = password;
        FromDataBase = false;
    }

  public ArrayList<Program> getPrograms() throws Exception
    {
        if(!Logined) return null;
        ArrayList<Program> list = new ArrayList<Program>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("program");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        /*{
                       Program pg = new Program(rs.getInt("program_id"));
                       list.add(pg);
                    }*/
                       list.add(new Program(rs.getInt("program_id")));
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw ex;
                }
        }
        else return null;
    }
 
    public String Change(String mail, String password, String name, String surname, Date birthday, String gender) throws Exception
    {
        if(!Logined) return "Onli  for logined; ";
        User us = new User(mail, password, name, surname, birthday, gender);
        us.ID = this.ID;
        DataBase db = new DataBase(us);
        db.ReWrite();
        if(db.Done())
            return "";
        else return db.Message();
    }
    
    public String Register() throws Exception
    {
        if(!Logined){
            return this.write();
        }
        else return "Logined user can not registre!"; 
    }

    public String Authorize() throws ParseException, Exception
    {
        try {
            DataBase db = new DataBase(this);
            ResultSet rs = db.FindUser(); 
            if(db.Done()){
                if(rs!=null){
                    rs.next();
                    if(password.equals(rs.getString("passwords"))){
                        Logined = true;
                        this.ID =  rs.getInt("user_id");
                        this.Name = rs.getString("user_name");
                        this.Surname = rs.getString("user_surname");
                        this.Gender = rs.getString("gender");
                        SimpleDateFormat format = new SimpleDateFormat();
                        format.applyPattern("yyyy-MM-dd");
                        try {
                            Birthday = format.parse(rs.getString("birthday"));
                        } catch (ParseException ex) {
                            Log.getOut(ex.getMessage());
                            throw ex;
                        }
                        return null;
                    }
                    else return "Uncorrect password";
                }
                else return "Такого пользователя не сущетвует";
            }
            else return db.Message();
        } catch (SQLException ex) {
            Log.getOut(ex.getMessage());
            throw ex;
        }
    }
    
    public String getMail() {
        
        return mail;
    }

    public String getPassword() {
        return password;
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
        if(this.Logined)
            return this.Name;
        else
            return "Visitor";
    }
    
    public String getSurname()
    {
        if(this.Logined)
            return this.Surname;
        else
            return "Visitor";
    }
    
    public int getRating()
    {
        if(this.Logined)
            return this.Rating;
        else
            return 0;
    }
    
}
