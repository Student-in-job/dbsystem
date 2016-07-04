/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;
import Learning.*;
import java.util.Date;

/**
 *
 * @author ksinn
 */
public class user {
    
    static public User get_information(String mail)
    {
        User user = new User("ksinn@mail.ru", 1, "Kseniya", "Andreeva", 10);
        return user;
    }
    
    static public boolean set_information(String mail, String password, String name, String surname, Date birthday, String gender)
    {
        
        return true;
    }
    
    static public boolean get_isExist(String mail, String password)
    {
        return true;
    }
    
    static public boolean set_Deleted(String mail)
    {
        return true;
    }
}
