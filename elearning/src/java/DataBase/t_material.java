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

/**
 *
 * @author ksinn
 */
public class t_material {
    
    static String sqlset_information = "INSERT INTO material (material_name, material_day, material_type, material_file, program, material_text) VALUES (?,?,?,\"123\",?,?);";
    static String sqlget_quantity_with_program = "select count(material_id) as 'quantity' from material where program = ? and material_deleted = 0;";
    
    static public boolean set_information(String program, String name, String inventory, int day, String typ){
     
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_information);
            stmt.setString(1, name);
            stmt.setInt(2, day);
            stmt.setString(3, typ);
            stmt.setString(4, program);
            stmt.setString(5, inventory);            
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
    
    
}
