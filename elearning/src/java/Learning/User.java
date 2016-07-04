package Learning;

import java.util.Date;
import DataBase.*;


/**
 *
 * @author ksinn
 */
public class User {
    
    int ID;
    String mail;
    String Name;
    String Surname;
    boolean Logined;
    int Rating;
    
    public User()
    {
    
    }
    
    public User(String m, int i, String n, String s, int r)
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
    
    public boolean Regestration(String mail, String password, String name, String surname, Date birthday, String gender)
    {
        User ch_user = null;
        ch_user = user.get_information(mail);
        if(ch_user==null)
            return false;
        else
        {
            if(user.set_information(mail, password, name, surname, birthday, gender))
                return true;
            else
                return false;
        }
    }
    
    public boolean Autorization(String mail, String password)
    {
        if(user.get_isExist(mail, password))
        {
            User ch_user = null;
            ch_user = user.get_information(mail);
            this.mail = ch_user.mail;
            this.ID = ch_user.ID;
            this.Name = ch_user.Name;
            this.Surname = ch_user.Surname;
            this.Rating = ch_user.Rating;
            this.Logined = true;
            
            return true;
        }
        else 
            return false;
    }
    
    public boolean Delete()
    {
        if(user.set_Deleted(this.mail))
        {
            this.mail = "";
            this.ID = 0;
            this.Name = "";
            this.Surname = "";
            this.Rating = 0;
            this.Logined = false;
            
            return true;
        }
        else return false;
    }
    
}
