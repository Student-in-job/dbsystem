/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;
import DataBase.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Program extends Parent{
    
    private int ID;
    private boolean Published;
    private String Name;
    private String Typ;
    private String Inventory;
    private int AreaID;
    private int Duration;
    private int TeacherID;
    private String Area_name;
    private int Level;
    private int MinLevel;
    protected final String Type = "program";
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public String getType(){
        return "program";
    }
    
    @Override
    public int getTypeIndex(){
        return 2;
    }
    
    @Override
    public String Correct()
    {
        String s = "";
        if("".equals(Name))
            s += "Name; ";
        if("".equals(Inventory))
            s += "Inventory; ";
        if("".equals(Typ))
            s += "Typ; ";
                if(Level<1)
            s += "Level; ";
        if(MinLevel<0)
            s += "MinLevel; ";
        if(Duration<1)
            s += "Duration; ";
        if(MinLevel>=Level)
            s += "MinLevel>=Level; "; 
        if("Seminar".equals(Typ)&&Duration>7)
            s += "Семенар не может длиться больше 7 дней; ";
        if(Typ.equals("Mini")&&(Duration<7||Duration>31))
            s += "Мини курс не должен быть больше 31 дня и меньше 7 дней; ";
        if("Standard".equals(Typ)&&(Duration<7||Duration>183))
            s += "Стандартный курс не должен быть больше 183 дня и меньше 7 дней; ";
        return "".equals(s)?null:s;
    }
    
    
        
    public Program(int id) throws Exception{
        
        this.ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    this.AreaID = rs.getInt("area");
                    this.Duration = rs.getInt("program_duration");
                    this.Inventory = rs.getString("program_description");
                    this.Level = rs.getInt("program_level");
                    this.MinLevel = rs.getInt("program_min_level");
                    this.Name = rs.getString("program_name");
                    this.Published = rs.getString("program_state").equals("active");
                    this.Typ = rs.getString("program_typ");
                    this.TeacherID = rs.getInt("user");
                    
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else throw new Error();
            
    }
        
    public Program(String name, String inventory, Area area, String typ, int level, int minlevel, int duration)
    {
        this.Name = name;
        this.Inventory = inventory;
        this.Typ = typ;
        this.AreaID = area.getID();
        this.Level = level;
        this.MinLevel  = minlevel;
        this.Duration = duration;
    }
    
    public ArrayList<Program> getAll() throws Exception{
        ArrayList<Program> list = new ArrayList<Program>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.All();
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        list.add(new Program(rs.getInt("program_id")));
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else return null;
    }
   
    public ArrayList<Test> getTests() throws Exception{
        ArrayList<Test> list = new ArrayList<Test>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("test");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        list.add(new Test(rs.getInt("test_id")));
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else return null;
    }
       
    public ArrayList<Material> getMaterials() throws Exception{
        ArrayList<Material> list = new ArrayList<Material>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("material");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        Material m = new Material(rs.getInt("material_id"));
                        list.add(m);
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else return null;
    }  
    
    
    
    public String Write(User user) throws Exception
    {
        TeacherID = user.getID();
        return this.write();
    }
    
    public String Change(String name, String inventory, String typ, int level, int minlevel, int duration, User user) throws Exception{
        
        if(TeacherID != user.getID()) return "Вы не можете менять эту программу";
        Program prg = new Program(name, inventory, this.getArea(), typ, level, minlevel, duration);
        prg.TeacherID = this.TeacherID;
        prg.ID = this.ID;
        DataBase db = new DataBase(prg);
        db.ReWrite();
        if(db.Done())
            return null;
        else return db.Message();
    }
    
    
    
    
    
    public boolean MayAddTest(){
        return !this.Typ.equals("Seminar");
    }
    
    public boolean MayAddMaterial() throws Exception{
        if(this.Typ.equals("Seminar")&&this.getMaterials().size()==2)
            return false;
        if(this.Typ.equals("Mini-Cours")&&this.getMaterials().size()==5)
            return false;
        return true;
    }  
    
    
    
    
    
    public int getTeacherID(){
        return TeacherID;
    }
    
    public String getAreaName(){
        return this.Area_name;
    }
    
    public int getAreaID(){
        return this.AreaID;
    }
    
    public Area getArea() throws Exception{
        return new Area(this.AreaID);
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

                 
    public boolean isPublished(){
        return this.Published;
    }
    
    public String getName(){
        return this.Name;
    }
    
    public String getTyp(){
        return this.Typ;
    }
    
    public String getInventory(){
        return this.Inventory;
    }
    
    
}
