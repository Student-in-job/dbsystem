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
    
    public boolean exequtQuery(String query) throws Exception{
        boolean res=false;
        
            this.conn = this.getConnection();
            this.stmt = conn.createStatement();
            try{
                this.rs = stmt.executeQuery(query);
                res = true;
            } catch(SQLException e) {
                this.ex = e;
                res = false;
            }
        
        return res;
    }
    

    protected void finalize(){
        try {
            this.conn.close();
        } catch (SQLException ex) {
            Log.Write(ex.getMessage());
        }
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
    
    public SQLException gerException(){
        return this.ex;
    }
    
    
}
