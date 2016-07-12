/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;
import DataBase.*;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Program {
    
    String ID;
    boolean Published;
    String Name;
    String Typ;
    String Inventory;
    String Area;
    String Level;
    String MinLevel;
    String Duration;
    String Teacher;
    
    
    public int getQuantityMaterials(){
        
        return t_material.get_quantity_with_program(this.ID);
    }
    
    public boolean MayAddMaterial(){
        if(this.Typ.equals("Seminar")&&this.getQuantityMaterials()==2)
            return false;
        if(this.Typ.equals("Mini-Cours")&&this.getQuantityMaterials()==5)
            return false;
        return true;
    }
    
    public Program(String id)
    {
        HashMap<String, String> inf = t_program.get_information(id);
        
        this.Area = inf.get("area");
        this.Duration = inf.get("duration");
        this.ID = inf.get("id");
        this.Inventory = inf.get("inventory");
        this.Level = inf.get("level");
        this.MinLevel = inf.get("minlevel");
        this.Name = inf.get("name");
        this.Published = inf.get("status").equals("active");
        this.Typ = inf.get("typ");
        this.Teacher = inf.get("teacher");
        
    }
    
    static public ArrayList<Program> getProgramList(String user_id)
    {
        ArrayList<HashMap<String, String>> inf = t_program.get_information_with_teacher(user_id);
        ArrayList<Program> list = new ArrayList<Program>();
        for(int i=0; i<inf.size(); i++)
        {
            Program prg = new Program();
            prg.Area = inf.get(i).get("area");
            prg.Duration = inf.get(i).get("duration");
            prg.ID = inf.get(i).get("id");
            prg.Inventory = inf.get(i).get("inventory");
            prg.Level = inf.get(i).get("level");
            prg.MinLevel = inf.get(i).get("minlevel");
            prg.Name = inf.get(i).get("name");
            prg.Published = inf.get(i).get("status").equals("active");
            prg.Typ = inf.get(i).get("typ");
            list.add(prg);
        }
        
        return list;
    }
            
    
    public Program()
    {
        
    }
    
    static public HashMap<Integer, String> getAreaList()
    {
        return t_area.get_all_information();
    }
    
    public boolean isPublished()
    {
        return this.Published;
    }
    
    public String getName()
    {
        return this.Name;
    }
    
    public String getTyp()
    {
        return this.Typ;
    }
    
    public String getInventory()
    {
        return this.Inventory;
    }
    
    public String getID()
    {
        return this.ID;
    }  
}
