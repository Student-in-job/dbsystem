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
    
    private String ID;
    private boolean Published;
    private String Name;
    private String Typ;
    private String Inventory;
    private String Area;
    private int Duration;
    private String Teacher_ID;
    private String Area_name;
    private int Level;
    private int MinLevel;
        
    protected int DeletAllComp(){
    
        return DataBase.t_material.delete_with_program(this.ID)
                + DataBase.t_test.delete_test_with_program(this.ID);
        
        
    }
    
    public int Delete(){
        return this.DeletAllComp()+DataBase.t_program.delete_with_id(this.ID);
    }
    
    public ArrayList<Test> getTest(){
        
        ArrayList<Test> list = new ArrayList<Test>();
        list.addAll(Test.getTestList(this.ID));
        
        return list;
        
    }
    
    public boolean MayAddTest(){
        return !this.Typ.equals("Seminar");
        
    }
    
    public ArrayList<Material> getMaterial(){
        
        ArrayList<Material> list = new ArrayList<Material>();
        list.addAll(Material.getMaterialList(this.ID));
        
        return list;
        
    }
    
    public String getTeacherID()
    {
        return Teacher_ID;
    }
    
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
    
    public Program(){
    }
    
    public Program(String id){
        this.ID = id;
        this.ReRead();
    
    }
    
    protected void ReRead()
    {
        HashMap<String, String> inf = t_program.get_information(this.ID);
        
        this.Area = inf.get("area");
        this.Duration = Integer.parseInt(inf.get("duration"));
        this.ID = inf.get("id");
        this.Inventory = inf.get("inventory");
        this.Level = Integer.parseInt(inf.get("level"));
        this.MinLevel = Integer.parseInt(inf.get("minlevel"));
        this.Name = inf.get("name");
        this.Published = inf.get("status").equals("active");
        this.Typ = inf.get("typ");
        this.Teacher_ID = inf.get("teacher");
        this.Area_name = t_area.get_information(Integer.parseInt(Area));
        
    }
    
    static public ArrayList<Program> getProgramList(String user_id)
    {
        ArrayList<HashMap<String, String>> inf = t_program.get_information_with_teacher(user_id);
        ArrayList<Program> list = new ArrayList<Program>();
        for(int i=0; i<inf.size(); i++)
        {
            Program prg = new Program();
            prg.Area = inf.get(i).get("area");
            prg.Duration = Integer.parseInt(inf.get(i).get("duration"));
            prg.ID = inf.get(i).get("id");
            prg.Inventory = inf.get(i).get("inventory");
            prg.Level = Integer.parseInt(inf.get(i).get("level"));
            prg.MinLevel = Integer.parseInt(inf.get(i).get("minlevel"));
            prg.Name = inf.get(i).get("name");
            prg.Published = inf.get(i).get("status").equals("active");
            prg.Typ = inf.get(i).get("typ");
            prg.Area_name = t_area.get_information(Integer.parseInt(prg.Area));
            list.add(prg);
        }
        
        return list;
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
    
    public Program(String name, String inventory, String area, String typ, int level, int minlevel, int duration)
    {
        this.Name = name;
        this.Inventory = inventory;
        this.Typ = typ;
        this.Area = area;
        this.Area_name = t_area.get_information(Integer.parseInt(area));
        this.Level = level;
        this.MinLevel  = minlevel;
        this.Duration = duration;
    }
    
    public boolean Write(String user_id)
    {
        if(this.isGood())
        return t_program.set_information(Integer.parseInt(user_id), Name, Inventory, Integer.parseInt(Area), Typ, Level, MinLevel, Duration);
        else return false;
    }
    
    public boolean isGood()
    {
        if("".equals(Name)||"".equals(Area_name)||"".equals(Inventory)||"".equals(Typ)||"".equals(Area))
            return false;
        if(Level*(MinLevel+1)*Duration==0)
            return false;
        if(MinLevel>=Level)
            return false; 
        if("Seminar".equals(Typ)&&Duration>7)
            return false;
        if(Typ.equals("Mini")&&(Duration<7||Duration>31))
            return false;
        if("Standard".equals(Typ)&&(Duration<7||Duration>183))
            return false;
        
        return true;
    }
    
    
    
    
    public String getAreaName(){
        
        return this.Area_name;
    }
    
    public String getArea(){
        
        return this.Area;
    }
    
    public int getLevel(){
        
        return this.Level;
    }
    
    public int getMinLevel(){
        
        return this.MinLevel;
    }
    
    public int getDuration(){
        
        return this.Duration;
    }

    public void setName(String name) {
        
        if(name!=null&&!"".equals(name))
            this.Name = name;
    }

    public void setInventory(String inventory) {
        
        if(inventory!=null&&!"".equals(inventory))
            this.Inventory = inventory;
    }

    public void setArea(String area) {
        HashMap<Integer, String> list = Program.getAreaList();
        if(list.get(area)!=null){
            this.Area = area;
            this.Area_name = list.get(area);
        }
        
    }

    public void setTyp(String typ) {
        
        if("Mini".equals(typ)||"Standard".equals(typ)||"Seminar".equals(typ)){
            this.Typ = typ;
        }
    }

    public void setLevel(int level) {
        
        if(level>=1&&level<=3)
            this.Level = level;
    }    

    public void setMinLevel(int minlevel) {
        
        if(minlevel>=0&&minlevel<=3)
            this.MinLevel = minlevel;
    }

    public void setDuration(int duration) {
    
        if("Seminar".equals(this.Typ)&&duration<7)
            this.Duration = duration;
        if(this.Typ.equals("Mini")&&(duration>7&&duration<31))
            this.Duration = duration;
        if("Standard".equals(this.Typ)&&(duration>7&&duration<183))
            this.Duration = duration;
    }

   protected boolean ReWrite(String user_id) {
      
       if(this.Teacher_ID == null ? user_id != null : !this.Teacher_ID.equals(user_id))
           return false;
       if(this.isGood())
            if(t_program.update_information(ID, Name, Inventory, Integer.parseInt(Area), Typ, Level, MinLevel, Duration)){
                this.ReRead();
                return true;
            }
        this.ReRead();
            return false;
    }
    
}
