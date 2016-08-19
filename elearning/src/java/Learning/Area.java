/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Area extends Parent{
    
    protected String Name; 
    protected String Ico;
    
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
                rs.next();
                this.Name =  rs.getString("area_name");
    }
    
    public Area(String name){
        Name = name;
    }
    
    public void Write(User user, Part part) throws Exception{
        
        if(user==null) throw new IllegalAction();
        this.write();
        IcoFile file = new IcoFile(part, this);
        file.SaveFile();
    }
    
    public ArrayList<Program> getPrograms(){
        ArrayList<Program> list = new ArrayList<Program>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("program");
                        while(rs.next()){
                            try{
                                Program pg = new Program(rs.getInt("program_id"));
                                if(pg.isPublished())
                                    list.add(pg);
                            }catch (SQLException ex){
                                Log.getOut(ex.getMessage());
                            }
                        }                
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
        }
        
        return list;
    }
    
    public ArrayList<Area> getAll(){
        ArrayList<Area> list = new ArrayList<Area>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.All();
                        while(rs.next()){
                            try{
                                list.add(new Area(rs.getInt("area_id")));
                            }catch (SQLException ex) {
                                Log.getOut(ex.getMessage());
                            }
                        }
            }catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
            }
        
        return list;
    }
    
    public String getName(){
        return Name;
    }

    @Override
    public boolean MayChange() {
        return false;
    }
    
    public String getIco(){
         return "uploadFiles/" + this.getType() + "/" +String.valueOf(ID)+".png";
    } 
}


