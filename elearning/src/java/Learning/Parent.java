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

import DataBase.DataBase;
import java.sql.SQLException;

public class Parent {
    
    protected int ID;
    protected boolean FromDataBase;
    
    public boolean FromDB(){
        
        return false;
    }
    
    public int getID(){
        
        return 0;
    }
    
    public String getType(){
        
        return "parant";
    }
    
    public int getTypeIndex(){
        
        return 0;
    }
    
    public String Correct(){
        
        return null;
    }
    
    public String Delete() throws SQLException{
        
        DataBase db = new DataBase(this);
        db.Delete();
        if(db.Done()) return null;
        else return db.Message();
    }
    
    protected String write() throws Exception{
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) return null;
            else return db.Message();
    }
    
}
