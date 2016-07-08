/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;
import Learning.*;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ksinn
 */



public class t_user {

static String sqlisExist = "select * from user where user_mail = ?;";
static String sqlset_information = "insert into user (user_mail, passwords, user_name, user_surname, birthday, gender, date_reg)  values (?, ?, ?, ?, ?, ?, now());";
static String sqlupdate_information = "update user set passwords=?, user_name=?, user_surname=?, birthday=?, gender=? where user_mail=?;";
static String sqlupdate_mail = "update user set user_mail=? where user_id=?;";
             
    
    static public HashMap<String, String> get_information(String mail)
    {
        HashMap<String, String> inf = new HashMap<String, String>();
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlisExist);
            stmt.setString(1, mail);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                inf.put("ID", rs.getString("user_id"));
                inf.put("mail", rs.getString("user_mail"));
                inf.put("password", rs.getString("passwords"));
                inf.put("name", rs.getString("user_name"));
                inf.put("surname", rs.getString("user_surname"));
                inf.put("birthday", rs.getString("birthday"));
                inf.put("gender", rs.getString("gender"));
                inf.put("date_of_regestration", rs.getString("date_reg"));
            }
            return inf;
            
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    static public int get_rating(String ID)
    {
        
       /* try
        {
            Connection conn  = db.getConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from users where mail = '"+mail+"' and deleted = 0");
            while(rs.next())
            {
                inf.put("ID", rs.getString("user_id"));
                inf.put("mail", rs.getString("mail"));
                inf.put("password", rs.getString("password"));
                inf.put("name", rs.getString("user_name"));
                inf.put("surname", rs.getString("user_surname"));
                inf.put("birthday", rs.getString("birthday"));
                inf.put("gender", rs.getString("gender"));
                inf.put("date_of_regestration", rs.getString("date_reg"));
            }*/
       
            return 100;
            
        /*}
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }*/
    }
    
    static public boolean set_information(String mail, String password, String name, String surname, Date birthday, String gender)
    {
        
        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_information);
            stmt.setString(1, mail);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, surname);
            stmt.setString(5, dateFormat.format(birthday));
            stmt.setString(6, gender);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    static public boolean update_information(String mail, String password, String name, String surname, Date birthday, String gender)
    {
        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlupdate_information);
            stmt.setString(1, password);
            stmt.setString(2, name);
            stmt.setString(3, surname);
            stmt.setString(4, dateFormat.format(birthday));
            stmt.setString(5, gender);
            stmt.setString(6, mail);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    static public boolean update_mail(int id, String newmail)
    {
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlupdate_mail);
            stmt.setString(1, newmail);
            stmt.setInt(2, id);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    static public boolean isExist(String mail) 
    {
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlisExist);
            stmt.setString(1, mail);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    static public boolean deleted_information(String mail)
    {
        return true;
    }
}
