/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import static DataBase.t_material.sqlget_information_with_program;
import static DataBase.t_material.sqlset_information;
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
public class t_test {

    static String sqlset_test_information = "INSERT INTO test(test_name, test_day, program) VALUES (?, ?, ?);";
    static String sqlget_test_information_with_id = "select * from test where test_id = ? and test_deleted=0;";
    static String sqlget_task_information_with_test = "select * from test_task where test = ? and test_task_deleted=0 order by test_task_no;";
    static String sqlget_task_information = "select * from test_task where test_task_id = ? and test_task_deleted=0;";
    static String sqlget_test_information_with_program = "select * from test where program = ? and test_deleted=0 order by test_day;";
    static String sqlset_task_information1 = "select (case when max(test_task_no) is null then 0 else max(test_task_no) end)+1 as 'nom' from test_task where test=? and test_task_deleted=0;";
    static String sqlset_task_information2 = "INSERT INTO test_task (test_task_no, test_task_text, test_task_answer, test_task_v1, test_task_v2, test_task_v3, test_task_v4, test_task_ball, test) " +
                                            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    static String sqldelete_prog_test_information = "UPDATE test set test_deleted=1 where program=?;";
    static String sqldelete_prog_task_information = "UPDATE test_task set test_task_deleted=1 where exists(select * from test where program=?);";
    static String sqldelete_test_information = "UPDATE test set test_deleted=1 where test_id=?;";
    static String sqldelete_test_task_information = "UPDATE test_task set test_task_deleted=1 where test=?;";
    static String sqldelete_task_information = "UPDATE test_task set test_task_deleted=1 where test_task_id=?;";
    static String sqlupdate_test_information = "UPDATE test set test_name=?, test_day=? where test_id=?;";
    static String sqlupdate_task_information = "UPDATE test_task set test_task_text=?, test_task_answer=?, test_task_v1=?, test_task_v2=?, test_task_v3=?, test_task_v4=?, test_task_ball=? where test_task_id=?;";
                                         

    public static boolean set_test_information(String program, String name, int day) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_test_information);
            stmt.setString(1, name);
            stmt.setInt(2, day);
            stmt.setString(3, program);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
    }

    public static HashMap<String, String> get_test_information_with_id(String id) {
        
        HashMap<String, String> inf = new HashMap<String, String>();
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_test_information_with_id);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                inf = new HashMap<String, String>();
                inf.put("id", rs.getString("test_id"));
                inf.put("name", rs.getString("test_name"));
                inf.put("day", rs.getString("test_day"));
                inf.put("program", rs.getString("program"));
            }
            return inf;
            
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return null;
        }
        
    }

    public static ArrayList<HashMap<String, String>> get_task_information_with_test(String test) {
        
        ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> inf;
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_task_information_with_test);
            stmt.setString(1, test);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                inf = new HashMap<String, String>();
                inf.put("id", rs.getString("test_task_id"));
                inf.put("number", rs.getString("test_task_no"));
                inf.put("question", rs.getString("test_task_text"));
                inf.put("answer", rs.getString("test_task_answer"));
                inf.put("var1", rs.getString("test_task_v1"));
                inf.put("var2", rs.getString("test_task_v2"));
                inf.put("var3", rs.getString("test_task_v3"));
                inf.put("var4", rs.getString("test_task_v4"));
                inf.put("point", rs.getString("test_task_ball"));
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

    public static ArrayList<HashMap<String, String>> get_test_information_with_program(String program) {
    
        ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> inf;
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_test_information_with_program);
            stmt.setString(1, program);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                inf = new HashMap<String, String>();
                inf = new HashMap<String, String>();
                inf.put("id", rs.getString("test_id"));
                inf.put("name", rs.getString("test_name"));
                inf.put("day", rs.getString("test_day"));
                inf.put("program", rs.getString("program"));
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

    public static boolean set_task_information(String testID, String question, String answer, String variant1, String variant2, String variant3, String variant4, int point) {
    
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlset_task_information1);
            stmt.setString(1, testID);
            ResultSet rs = stmt.executeQuery();
            int no=0;
            if(rs.next()) 
                no = rs.getInt("nom");
            stmt = conn.prepareStatement(sqlset_task_information2);
            stmt.clearParameters();
            stmt.setInt(1, no);
            stmt.setString(2, question);
            stmt.setString(3, answer);
            stmt.setString(4, variant1);
            stmt.setString(5, variant2);
            stmt.setString(6, variant3);
            stmt.setString(7, variant4);
            stmt.setInt(8, point);
            stmt.setString(9, testID);
            return stmt.executeUpdate()==1;
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
    }

    public static int delete_test_with_program(String program) {
        
        int tt= DataBase.t_test.delete_task_with_program(program);
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_prog_test_information);
            stmt.setString(1, program);
            return (stmt.executeUpdate() + tt);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }
    
    public static int delete_task_with_program(String program) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_prog_task_information);
            stmt.setString(1, program);
            return (stmt.executeUpdate());
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }

    
    public static int delete_test_with_id(String id) {
        
        int tt = DataBase.t_test.delete_task_with_test(id);
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_test_information);
            stmt.setString(1, id);
            return (stmt.executeUpdate()+tt);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }
    
    public static int delete_task_with_test(String test) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_test_task_information);
            stmt.setString(1, test);
            return (stmt.executeUpdate());
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }
    
    public static int delete_task_with_id(String id) {
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqldelete_task_information);
            stmt.setString(1, id);
            return stmt.executeUpdate();
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return -1;
        }
    }

    public static boolean update_test_information(String test, String name, int day) {
    
       try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlupdate_test_information);
            stmt.setString(1, name);
            stmt.setInt(2, day);
            stmt.setString(3, test);
            return (stmt.executeUpdate() == 1);
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
    }
    
    public static boolean update_task_information(String test_task, String question, String answer, String variant1, String variant2, String variant3, String variant4, int point) {
    
        
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlupdate_task_information);
            stmt.clearParameters();
            stmt.setString(1, question);
            stmt.setString(2, answer);
            stmt.setString(3, variant1);
            stmt.setString(4, variant2);
            stmt.setString(5, variant3);
            stmt.setString(6, variant4);
            stmt.setInt(7, point);
            stmt.setString(8, test_task);
            return stmt.executeUpdate()==1;
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return false;
        }
    }

    public static HashMap<String, String> get_task_information(String id) {
        
        HashMap<String, String> inf = null;
        try
        {
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement(sqlget_task_information);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                inf = new HashMap<String, String>();
                inf.put("id", rs.getString("test_task_id"));
                inf.put("number", rs.getString("test_task_no"));
                inf.put("question", rs.getString("test_task_text"));
                inf.put("answer", rs.getString("test_task_answer"));
                inf.put("var1", rs.getString("test_task_v1"));
                inf.put("var2", rs.getString("test_task_v2"));
                inf.put("var3", rs.getString("test_task_v3"));
                inf.put("var4", rs.getString("test_task_v4"));
                inf.put("point", rs.getString("test_task_ball"));
                inf.put("test", rs.getString("test"));
                
            }
            return inf;
                
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            return null;
        }
    }
    
    
}
