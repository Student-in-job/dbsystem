/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import static DataBase.t_program.sqlset_information;
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
public class t_material {
    
    static String sqlset_information = "INSERT INTO material (material_name, material_day, material_type, program, material_text, material_file) VALUES (?,?,?,?,?,?);";
    static String sqlupdate_information = "UPDATE material set material_name=?, material_day=?, material_type=?, material_text=?, material_file=? where material_id=?;";
    static String sqldelete_prog_information = "UPDATE material set material_deleted=1 where program=?;";
    static String sqlget_quantity_with_program = "select count(material_id) as 'quantity' from material where program = ? and material_deleted = 0;";
    static String sqlget_information_with_program = "select * from material where program = ? and material_deleted = 0 order by material_day;";
    static String sqlget_information = "select * from material where material_id = ? and material_deleted = 0;";
    static String sqldelete_information = "UPDATE material set material_deleted=1 where material_id=?;";
    
    static public boolean set_information(String program, String name, String inventory, int day, String typ, String text){
     
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_information);
            stmt.setString(1, name);
            stmt.setInt(2, day);
            stmt.setString(3, typ);
            stmt.setString(4, program);
            stmt.setString(5, inventory);  
            stmt.setString(6, text);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
    }

    public static int get_quantity_with_program(String program_id) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_quantity_with_program);
            stmt.setString(1, program_id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next())
                return rs.getInt("quantity");
            else return -1;
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }

    public static ArrayList<HashMap<String, String>> get_information_with_program(String program_id) {
        
        ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> inf;
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information_with_program);
            stmt.setString(1, program_id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                inf = new HashMap<String, String>();
                inf.put("program", rs.getString("program"));
                inf.put("name", rs.getString("material_name"));
                inf.put("id", rs.getString("material_id"));
                inf.put("day", rs.getString("material_day"));
                inf.put("typ", rs.getString("material_type"));
                inf.put("text", rs.getString("material_file"));
                inf.put("inventory", rs.getString("material_text"));
                list.add(inf);
            }
            return list;
                
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return null;
        }
    
    }

    public static HashMap<String, String> get_information(String id) {
        
    HashMap<String, String> inf = null;
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                inf = new HashMap<String, String>();
                inf.put("program", rs.getString("program"));
                inf.put("name", rs.getString("material_name"));
                inf.put("id", rs.getString("material_id"));
                inf.put("day", rs.getString("material_day"));
                inf.put("typ", rs.getString("material_type"));
                inf.put("text", rs.getString("material_file"));
                inf.put("inventory", rs.getString("material_text"));
                
            }
            return inf;
                
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return null;
        }
    }

    public static boolean update_information(String id, String name, String inventory, int day, String typ, String text) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlupdate_information);
            stmt.setString(1, name);
            stmt.setInt(2, day);
            stmt.setString(3, typ);
            stmt.setString(4, inventory);  
            stmt.setString(5, text);
            stmt.setString(6, id);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
    }

    public static int delete_with_program(String program) {
        
      try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_prog_information);
            stmt.setString(1, program);
            return (stmt.executeUpdate());
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }          
    }

    public static int delete_with_id(String id) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_information);
            stmt.setString(1, id);
            return (stmt.executeUpdate());
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }
    
    
}
