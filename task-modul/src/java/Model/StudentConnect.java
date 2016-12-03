/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ksinn
 */
public class StudentConnect extends DBConnect{

    @Override
    protected String getDataSourseName() {
        return "student";
    }
    
    private Connection conn;
    private ResultSet rs;
    private Statement stmt;
    private SQLException ex;
    
    public StudentConnect(){
    }
    
    public void close(){
        if(conn!=null)
            try {
                this.conn.close();
        } catch (SQLException ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
    }
    
    public boolean exequtQuery(String query) throws Exception{
        boolean res=false;
        
        query = query.toLowerCase();
        
        Pattern p = Pattern.compile("[(update)|(insert)|(delete)]", Pattern.CASE_INSENSITIVE);
        Matcher matcher = p.matcher(query);
        
        this.conn = this.getConnection();
        this.stmt = conn.createStatement();
            
        /*if(matcher.find()){
            String name="";
            try{
                name = this.createTempTable(query);
            } catch(SQLException e) {
                this.ex = e;
                res = false;
            }
            stmt.execute(query);
            query = "select * from "+name+";";
        } */ 
            
            try{
                this.rs = stmt.executeQuery(query);
                res = true;
            } catch(SQLException e) {
                this.ex = e;
                res = false;
            }
        
        return res;
    }
    
    public ResultSet getResultSet(){
        return this.rs;
    }
    
    public ArrayList getResultArray(){
        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        
        ArrayList<String> buf = new ArrayList<String>();
        try{
            for(int i=1; i<=this.rs.getMetaData().getColumnCount(); i++){
                buf.add(rs.getMetaData().getColumnName(i));
            }
            list.add(buf);

            while(rs.next()){
                buf = new ArrayList<String>();
                for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){
                    buf.add(rs.getString(i));
                }
                list.add(buf);
            }
        } catch(SQLException ex){
            buf.add("Error code: " + ex.getErrorCode() + ". "+ex.getMessage());
            list.add(buf);
        }
        
        return list;
    }
    
    public SQLException getException(){
        return this.ex;
    }

    private String createTempTable(String query) throws SQLException {
    
        boolean i=true;
        String name="";
        Pattern p = Pattern.compile("(update)|(delete[ ]+from)|(insert[ ]+into)[ ]+[a-z|0-9|_|$]+", Pattern.CASE_INSENSITIVE);
        Matcher matcher = p.matcher(query);
        if(matcher.find()){
            String dml_query = matcher.group();
            Pattern pp = Pattern.compile("[a-z|0-9|_|$]+$", Pattern.CASE_INSENSITIVE);
            Matcher m = pp.matcher(dml_query);
            
            if(m.find()){
                name = m.group();
                Statement stmt = this.conn.createStatement();
                stmt.execute("create temporary table "+name+"$"+" like "+name+";");
                stmt.execute("insert into "+name+"$"+" select * from "+name+";");
                stmt.execute("alter table "+name+"$"+" rename "+name+";");
            }
            
        }
        
    return name;
    
    }
    
    
}
