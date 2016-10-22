/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author ksinn
 */
public abstract class Parant {
    
    protected int _id;
    protected boolean _from_db;
    
    abstract protected HashMap<String, Object> _getParams();
    abstract protected void _setParams(HashMap<String, Object> Params);
    abstract protected String _getTableName();
    abstract protected boolean _isCorrect();
    
    public int getID(){
        return this._id;
    }
    
    protected boolean _read() throws NamingException, SQLException{
        
        try{
            String query_string = this.generateQueryString(null, "select");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string);
            stmt.setInt(1, this._id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                HashMap<String, Object> Params = new HashMap<String, Object>();
                for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
                    Params.put(rs.getMetaData().getColumnName(i), rs.getObject(rs.getMetaData().getColumnName(i)));
                }
                conn.close();
                this._setParams(Params);
                this._from_db = true;
                return true;
            } else{
                conn.close();
                return false;
            }
            
        } catch(NamingException | SQLException ex) {
            Log.Write(ex.getLocalizedMessage());
            throw ex;
        }
        
    }
    
    protected boolean _write() throws NamingException, SQLException{
        
        if(!this._isCorrect()) return false;
        try{
            Set<Map.Entry<String, Object>> params = this._getParams().entrySet();
            String query_string = this.generateQueryString(params, "insert");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string, Statement.RETURN_GENERATED_KEYS);

            int i=1;
            for(Map.Entry<String, Object> param : params){
                if(param.getValue() instanceof Integer){
                    stmt.setInt(i, (int) param.getValue());
                    i++;
                    continue;
                }
                if(param.getValue() instanceof String){
                    stmt.setString(i, (String) param.getValue());
                    i++;
                    continue;
                }
                if(param.getValue() instanceof Date){
                    stmt.setDate(i, (java.sql.Date) (Date) param.getValue());
                    i++;
                    continue;
                }
                i++;
            }

            int result = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            int auto_increment_id;
            if(result == 1){
                if(rs.next()) 
                    this._id = rs.getInt(1);
                this._from_db = true;
            }
            conn.close();
            return result == 1;
        } catch(NamingException | SQLException ex) {
            Log.Write(ex.getLocalizedMessage());
            throw ex;
        }
    }
    
    protected boolean _update() throws NamingException, SQLException{
        if(!this._isCorrect()) return false;
        try{
            Set<Map.Entry<String, Object>> params = this._getParams().entrySet();
            String query_string = this.generateQueryString(params, "update");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string);

            int i=1;
            for(Map.Entry<String, Object> param : params){
                if(param.getValue() instanceof Integer){
                    stmt.setInt(i, (int) param.getValue());
                    i++;
                    continue;
                }
                if(param.getValue() instanceof String){
                    stmt.setString(i, (String) param.getValue());
                    i++;
                    continue;
                }
                if(param.getValue() instanceof Date){
                    stmt.setDate(i, (java.sql.Date) (Date) param.getValue());
                    i++;
                    continue;
                }
                i++;
            }
            stmt.setInt(i, this._id);

            int result = stmt.executeUpdate();
            conn.close();
            if(result==1) 
                this._from_db = true;
            return result == 1;
        } catch(NamingException | SQLException ex) {
            Log.Write(ex.getLocalizedMessage());
            throw ex;
        }
    }
    
    protected boolean _delete() throws NamingException, SQLException{
        try{
            String query_string = this.generateQueryString(null, "delete");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string);
            stmt.setInt(1, this._id);
            int result = stmt.executeUpdate();
            conn.close();
            return result == 1;
        } catch(NamingException | SQLException ex) {
            Log.Write(ex.getLocalizedMessage());
            throw ex;
        }
    }
    
    
        
    
    private Connection getConnection() throws NamingException, SQLException{
        InitialContext initContext;
        initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/DB");
        return ds.getConnection();
    }
    
    private String generateQueryString(Set<Map.Entry<String, Object>> params, String mod){
        switch(mod){
            case "insert":{
                return generateInsertQuery(params);
            }
            case "update":{
                return generateUpdateQuery(params);
            }
            case "delete":{
                return generateDeleteQuery();
            }
            case "select":{
                return generateSelectQuery();
            }
            default:{
                return null;
            }
        }
    }

    private String generateInsertQuery(Set<Map.Entry<String, Object>> params) {
        String query=" INSERT INTO "+this._getTableName()+"(";
        for(Map.Entry<String, Object> param : params){
            query+=" "+param.getKey()+",";
        }
        query = query.substring(0, query.length()-1);
        query+=" ) VALUE (";
        for(Map.Entry<String, Object> param : params){
            query+=" ?,";
        }
        query = query.substring(0, query.length()-1);
        query+=" );";
        
        return query;
    }

    private String generateUpdateQuery(Set<Map.Entry<String, Object>> params) {
        String query=" UPDATE "+this._getTableName()+" SET ";
        for(Map.Entry<String, Object> param : params){
            query+=" "+param.getKey()+" = ?,";
        }
        query = query.substring(0, query.length()-1);
        query+=" WHERE id = ?";
        query+=";";
        
        return query;
    }

    private String generateDeleteQuery() {
        String query=" DELETE FROM "+this._getTableName();
        query+=" WHERE id = ?";
        query+=";";
        
        return query;
    }

    private String generateSelectQuery() {
        String query=" SELECT * FROM "+this._getTableName();
        query+=" WHERE id = ? ";
        query+=";";
        
        return query;
    }

    
    
}
