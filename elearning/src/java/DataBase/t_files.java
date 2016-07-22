/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

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
public class t_files {
    
    static public String sqlset_information = "insert into files(file_name, program, file_type) values (?, ?, ?);";
    static public String sqlget_information_with_program = "select * from  files where program = ?;";
    static public String sqlget_information = "select * from  files where file_id = ?;";

    public static int set_information(String program, String name, String type) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_information);
            stmt.setString(1, name);
            stmt.setString(2, program);
            stmt.setString(3, type);
            if( stmt.executeUpdate() == 1 ){
                stmt = conn.prepareStatement("select max(file_id) as id from files where program=?;");
                stmt.setString(1, program);
                ResultSet rs = stmt.executeQuery();
                if(rs.next())
                    return rs.getInt("id");
                else return 0;
            }
            else return -1;
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }

    public static ArrayList<HashMap<String, String>> get_information_whis_program(String program) {
        
        ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> inf;
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information_with_program);
            stmt.setString(1, program);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                inf = new HashMap<String, String>();
                inf.put("id", rs.getString("file_id"));
                inf.put("name", rs.getString("file_name"));
                inf.put("type", rs.getString("file_type"));
                inf.put("program", rs.getString("program"));
                list.add(inf);
            }
            return list;
                
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return list;
        }
    }

    public static boolean delete(int id) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement("delete from files where file_id=?;");
            stmt.setInt(1, id);
            return stmt.executeUpdate() == 1 ;
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
        
    }

    public static HashMap<String, String> get_information(int id) {
        
        HashMap<String, String> inf = new HashMap<String, String>();
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                inf.put("id", rs.getString("file_id"));
                inf.put("name", rs.getString("file_name"));
                inf.put("type", rs.getString("file_type"));
                inf.put("program", rs.getString("program"));
                
            }
            return inf;
                
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return inf;
        }
    }
    
}
