package Learning;

import java.util.Date;
import DataBase.*;
import java.util.HashMap;


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
    
    private User()
    {
    
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
    
    public String getName()
    {
        if(this.Logined)
            return this.Name;
        else
            return "Host";
    }
    
    public String getSurname()
    {
        if(this.Logined)
            return this.Surname;
        else
            return "Host";
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
    
    public void ResetPassword(String mail)
    {
        if(t_user.isExist(mail))
        {
            HashMap<String, String> inf = t_user.get_information(mail);
            String password =inf.get("password");
            //Send_message
        }
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
