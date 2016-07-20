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
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class t_texts {
    
    
    static protected String sqlget_information = "select * from texts where text_id = ?;";
    static protected String sqlset_information = "insert into texts(text_lecture) values (?);";
    static protected String sqlget_max_id = "select max(text_id) as 'id' from texts;";
            
    static public int set_information(String text){
     
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_information);
            stmt.setString(1, text);
            if (stmt.executeUpdate() == 1){
                stmt = conn.prepareStatement(sqlget_max_id);
                ResultSet rs = stmt.executeQuery();
                if(rs.next())
                    return rs.getInt("id");
            }
            return 0;
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return 0;
        }
    }
    
    

    public static String get_information(int id) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_information);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getString("text_lecture");
                             
            }
            return "";
                
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return "";
        }
    }
}
