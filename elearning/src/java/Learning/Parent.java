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

public abstract class Parent {
    
    protected int ID;
    
    abstract public int getID();
    
    abstract public String getType();
    
    abstract public int getTypeIndex();
    
    public String Delete() throws Exception{
        
        if(!this.MayChange()) return "Вы не можете менять опублекованную программу";
        DataBase db = new DataBase(this);
        db.Delete();
        if(db.Done()) return null;
        else return db.Message();
    }
    
    abstract public boolean MayChange();
    
    protected boolean write() throws SQLException{
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            this.ID=db.ID(); 
            return true;
        }
        else return false;
    }
    
}
