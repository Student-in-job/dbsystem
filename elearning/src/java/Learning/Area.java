/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.DataBase;
import DataBase.Log;
import DataBase.ObjectNotFind;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ksinn
 */
public class Area extends Parent{
    
    String Name; 
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 7;
    }
    
    @Override
    public String getType(){
        return "area";
    }
    
    public Area(int id) throws Exception{
        ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
        if(db.Done()&&rs!=null){
                rs.next();
                this.Name =  rs.getString("area_name");
}
        else throw new ObjectNotFind();
    }
    
    public Area(String name){
        Name = name;
    }
    
    public String Write(User user) throws Exception{
        
        if(user==null) return "Вы не можете этого сделать";
        return this.write();
    }
    
    public ArrayList<Program> getPrograms() throws Exception{
        ArrayList<Program> list = new ArrayList<Program>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("program");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        Program pg = new Program(rs.getInt("program_id"));
                        if(pg.isPublished())
                            list.add(pg);
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw ex;
                }
        }
        else return null;
    }
    
    public ArrayList<Area> getAll() throws Exception{
        ArrayList<Area> list = new ArrayList<Area>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.All();
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        list.add(new Area(rs.getInt("area_id")));
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw ex;
                }
        }
        else return null;
    }
    
    public String getName(){
        return Name;
    }
}


