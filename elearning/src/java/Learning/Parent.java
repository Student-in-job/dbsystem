/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ksinn
 */

package Learning;


import DataBasePak.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.naming.NamingException;

public abstract class Parent extends DBConnect{
    
    @Override
    protected String getDataSourseName(){
        return "DB";
    }
    
    protected int ID;
    protected boolean _from_db;
    
    public int getID()
    {
        return ID;
    }
    abstract public boolean MayChange();    
    
    abstract protected HashMap<String, Object> _getParams();
    abstract protected void _setParams(HashMap<String, Object> Params) throws Exception;
    abstract public String _getType();
    abstract protected boolean _isCorrect();
    
    protected boolean _select() throws Exception{
        

            String query_string = this.generateQueryString(null, "select");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string);
            stmt.setInt(1, this.ID);
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
            
        
    }
    
    
    protected boolean _insert() throws NamingException, SQLException{
        
        if(!this._isCorrect()) return false;

            Set<Map.Entry<String, Object>> params = this._getParams().entrySet();
            String query_string = this.generateQueryString(params, "insert");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string, Statement.RETURN_GENERATED_KEYS);

            int i=1;
            for(Map.Entry<String, Object> param : params){
                /*if(param.getValue() == null){
                    i++;
                    continue;
                }*/
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
                    stmt.setTimestamp(i, new java.sql.Timestamp(((Date) param.getValue()).getTime()));
                    i++;
                    continue;
                }
                if(param.getValue() instanceof Long){
                    stmt.setLong(i, ((Long) param.getValue()));
                    i++;
                    continue;
                }
            }

            int result = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            int auto_incrementID;
            if(result == 1){
                if(rs.next()) 
                    this.ID = rs.getInt(1);
                this._from_db = true;
            }
            conn.close();
            return result == 1;

    }
    
    protected boolean _update() throws NamingException, SQLException{
        if(this.ID==0) return false;
        if(!this._isCorrect()) return false;
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
                    stmt.setTimestamp(i, new java.sql.Timestamp(((Date) param.getValue()).getTime()));
                    i++;
                    continue;
                }
            }
            stmt.setInt(i, this.ID);

            int result = stmt.executeUpdate();
            conn.close();
            if(result==1) 
                this._from_db = true;
            return result == 1;

    }
    
    protected boolean _delete() throws NamingException, SQLException{
        if(this.ID==0) return false;
            String query_string = this.generateQueryString(null, "delete");

            Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query_string);
            stmt.setInt(1, this.ID);
            int result = stmt.executeUpdate();
            conn.close();
            return result == 1;

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
                return generateDeleteQuery(params);
            }
            case "select":{
                return generateSelectQuery(params);
            }
            default:{
                return null;
            }
        }
    }

    private String generateInsertQuery(Set<Map.Entry<String, Object>> params) {
        String query=" INSERT INTO "+this._getType()+"(";
        for(Map.Entry<String, Object> param : params){
            query+=" "+param.getKey()+",";
        }
        query = query.substring(0, query.length()-1);
        query+=" ) VALUE (";
        for(Map.Entry<String, Object> param : params){
            query+=param.getValue() == null?" DEFAULT,":" ?,";
        }
        query = query.substring(0, query.length()-1);
        query+=" );";
        
        return query;
    }

    private String generateUpdateQuery(Set<Map.Entry<String, Object>> params) {
        String query=" UPDATE "+this._getType()+" SET ";
        for(Map.Entry<String, Object> param : params){
            query+=" "+param.getKey()+" = "+(param.getValue() == null?"DEFAULT,":"?,");
        }
        query = query.substring(0, query.length()-1);
        query+=" WHERE id = ?";
        query+=";";
        
        return query;
    }

    private String generateDeleteQuery(Set<Map.Entry<String, Object>> params) {
        String query=" UPDATE "+this._getType();
        query+=" SET deleted = 1 ";
        if(params == null)
            query+=" WHERE id = ?";
        else{
            query+=" WHERE ";
            for(Map.Entry<String, Object> param : params)
                query+=" "+param.getKey()+" = ?,";
            query = query.substring(0, query.length()-1);
        }
        query+=";";
        
        return query;
    }

    private String generateSelectQuery(Set<Map.Entry<String, Object>> params) {
        String query=" SELECT * FROM "+this._getType();
        if(params == null)
            query+=" WHERE id = ?";
        else{
            query+=" WHERE ";
            for(Map.Entry<String, Object> param : params)
                query+=" "+param.getKey()+" = ? and";
            query = query.substring(0, query.length()-3);
        }
        query+=";";
        
        return query;
    }
    
    
}
