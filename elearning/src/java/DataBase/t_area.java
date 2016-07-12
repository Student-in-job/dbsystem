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
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class t_area {
    
    
    static String sqlisExist = "select * from area where area_name = ?;";
    static String sqlisExistId = "select * from area where area_id = ?;";
    static String sqlget_all_information = "select * from area where area_deleted=0;";
    


    static public int get_information(String name){
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlisExist);
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if(rs.next())
            {
                return rs.getInt("area_id");
            }
            else return 0;
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return 0;
        }
    }
    
    static public String get_information(int id){
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlisExistId);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next())
            {
                return rs.getString("area_name");
            }
            else return "";
            
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }
    
    
    static public HashMap<Integer, String> get_all_information()
    {
        HashMap<Integer, String> list = new HashMap<Integer, String>();
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_all_information);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                list.put(rs.getInt("area_id"), rs.getString("area_name"));
            }
            return list;
            
        }
        catch(SQLException ex)
        {
            Logger.getLogger(db.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
