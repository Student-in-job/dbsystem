/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import Learning.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


/**
 *
 * @author ksinn
 */
public class t_program {
    
    static String sqlset_information = "INSERT INTO program  (program_name,  program_description,  program_min_level,  program_level,  program_duration,  teacher,  area,  program_date,  program_controled,  program_typ) VALUES  (?,  ?,  ?,  ?,  ?,  ?,  ?,  now(),  ?,  ?);";
    static String sqlget_information_with_teacher = "Select * from program where teacher=? and program_deleted=0";
    static String sqlget_information = "Select * from program where program_id=? and program_deleted=0";
    
    
    static public HashMap<String, String> get_information(String id)
    {
       
        try{
            
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information);
            stmt.setString(1, id);  
            ResultSet rs = stmt.executeQuery();
            HashMap<String,String> inf = new HashMap<String,String>();
            if(rs.next()){
                
                inf.put("area", rs.getString("area"));
                inf.put("duration", rs.getString("program_duration"));
                inf.put("id", rs.getString("program_id"));
                inf.put("inventory", rs.getString("program_description"));
                inf.put("level", rs.getString("program_level"));
                inf.put("minlevel", rs.getString("program_min_level"));
                inf.put("name", rs.getString("program_name"));
                inf.put("status", rs.getString("program_state"));
                inf.put("typ", rs.getString("program_typ"));
                inf.put("date", rs.getString("program_date"));
                inf.put("teacher", rs.getString("teacher"));
                return inf;
            }
            else return null;
            
        
        } catch (SQLException ex) {
            
            Log.getOut(ex.getMessage());
            return null;
        }
        
        
    }
    
    static public ArrayList<HashMap<String, String>> get_information_with_teacher(String teacher)
    {
       
        ArrayList<HashMap<String, String>> list = null;
        try{
            
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information_with_teacher);
            stmt.setString(1, teacher);  
            ResultSet rs = stmt.executeQuery();
            list = new ArrayList<HashMap<String, String>>();
            while(rs.next()){
                
                HashMap<String,String> inf = new HashMap<String,String>();
                inf.put("area", rs.getString("area"));
                inf.put("duration", rs.getString("program_duration"));
                inf.put("id", rs.getString("program_id"));
                inf.put("inventory", rs.getString("program_description"));
                inf.put("level", rs.getString("program_level"));
                inf.put("minlevel", rs.getString("program_min_level"));
                inf.put("name", rs.getString("program_name"));
                inf.put("status", rs.getString("program_state"));
                inf.put("typ", rs.getString("program_typ"));
                inf.put("date", rs.getString("program_date"));
                inf.put("teacher", rs.getString("teacher"));
                list.add(inf);
            }
            return list;
        
        } catch (SQLException ex) {
            
            Log.getOut(ex.getMessage());
            return null;
        }
        
        
    }
    
    static public boolean set_information(int user_id, String name, String inventory, int area, String typ, int leavel, int minleavel, int duration){
    
    try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_information);
            stmt.setString(1, name);
            stmt.setString(2, inventory);
            stmt.setInt(3, minleavel);
            stmt.setInt(4, leavel);
            stmt.setInt(5, duration);
            stmt.setInt(6, user_id);
            stmt.setInt(7, area);
            stmt.setInt(8, 0);
            stmt.setString(9, typ);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }    
    }
    
    
    
}
