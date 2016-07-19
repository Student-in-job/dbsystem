package Learning;

import java.util.Date;
import DataBase.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 *
 * @author ksinn
 */
public class User {
    
    protected String ID;
    protected String mail;
    protected String Name;
    protected String Surname;
    protected boolean Logined;
    protected int Rating;
    
    public User()
    {
        this.Logined = false;
    }
    
    private User(String m, String i, String n, String s, int r)
    {
        this.mail = m;
        this.ID = i;
        this.Name = n;
        this.Surname = s;
        this.Rating = r;
        this.Logined = true;
        
    }
    
    public boolean Update(Component comp){
    
        return comp.ReWrite(this.ID);
    }
    
    public boolean Create(Component comp)
    {
        return comp.Write(this.ID);            
    }
    
    public boolean Update(Program program){
    
        return program.ReWrite(this.ID);
    }
    
    public boolean Create(Program program)
    {
        return program.Write(this.ID);            
    }
    
    public Program getProgram(String program_id)
    {
        Program program = new Program(program_id);
        if(program.getTeacherID().equals(this.ID))
            return program;
        else return null;
    }
    
    public ArrayList<Program> getPrograms()
    {
        return Program.getProgramList(this.ID);
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
    
    public static boolean Register(String mail, String password, String name, String surname, Date birthday, String gender)
    {
        if(t_user.isExist(mail))
            return false;
        else
        {
            if(t_user.set_information(mail, password, name, surname, birthday, gender))
                return true;
            else
                return false;
        }
    }
    
    public static User Authorize(String mail, String password)
    {
        User user = null;
        if(t_user.isExist(mail))
        {
            HashMap<String, String> inf = t_user.get_information(mail);
            if(password == null ? inf.get("password") == null : password.equals(inf.get("password")))
            {
                user = new User(inf.get("mail"), inf.get("ID"), inf.get("name"), inf.get("surname"), t_user.get_rating(inf.get("ID")));
            }
        }
        return user;
    }
    
    public boolean ResetPassword(String oldp, String newp)
    {
        if(t_user.isExist(this.mail))
        {
            HashMap<String, String> inf = t_user.get_information(this.mail);
            String password =inf.get("password");
            if(oldp.equals(password)){
                
                SimpleDateFormat format = new SimpleDateFormat();
                format.applyPattern("yyyy-MM-dd");
                Date birthday;
                try {
                    birthday = format.parse(inf.get("birthday"));
                    return t_user.update_information(inf.get("mail"), newp, inf.get("name"), inf.get("surname"), birthday, inf.get("gender"));
                } 
                catch (ParseException ex) {
                    return false;
                }
            }
            
        }
        return true;
    }
    
    public boolean ResetMail(String newmail, String password){
        
        if(t_user.isExist(this.mail)&&(!t_user.isExist(newmail))){
            
            HashMap<String, String> inf = t_user.get_information(this.mail);
            if(inf.get("password").equals(password)){
                
                return t_user.update_mail(Integer.parseInt(this.ID), newmail);
        }
            
        }
        return false;
    }
    
    public boolean Delete()
    {
        if(this.Delete("user", this.ID))
        {
            this.mail = "";
            this.ID = "0";
            this.Name = "";
            this.Surname = "";
            this.Rating = 0;
            this.Logined = false;
            
            return true;
        }
        else return false;
    }

    public boolean Delete(String param, String value) {
        
        if(!("program".equals(param)||"material".equals(param)||"test".equals(param)||"test_task".equals(param)||"task".equals(param)||"user".equals(param)))
            return false;
        try {
            
            Connection conn  = db.getConn();
            String sql = "update "+param+" set "+param+"_deleted = 1 where "+param+"_id = ?;";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, value);
            return stmt.executeUpdate()==1;
            
        } catch (SQLException ex) {
            Log.getOut(ex.getMessage());
            return false;}
        
    }
    
}
