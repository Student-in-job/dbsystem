package Learning;

import java.util.Date;
import DataBase.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author ksinn
 */
public class User {
    
    String ID;
    String mail;
    String Name;
    String Surname;
    boolean Logined;
    int Rating;
    
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
        if(t_user.deleted_information(this.mail))
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
    
}
