/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;
import DataBase.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ksinn
 */
public class Program extends Parent{
    
    private int ID;
    private String State;
    private String Name;
    private String Typ;
    private String Inventory;
    private int AreaID;
    private int Duration;
    private int TeacherID;
    private String Area_name;
    private int Level;
    private int MinLevel;
    
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
    public boolean MayChange(){
        return !this.isPublished();
    }
    
    /*@Override
    public String Correct()
    {
        String s = "";
        if(MinLevel>=Level)
            s += "MinLevel>=Level; "; 
        if("Seminar".equals(Typ)&&Duration>7)
            s += "Семенар не может длиться больше 7 дней; ";
        if(Typ.equals("Mini")&&(Duration<7||Duration>31))
            s += "Мини курс не должен быть больше 31 дня и меньше 7 дней; ";
        if("Standard".equals(Typ)&&(Duration<7||Duration>183))
            s += "Стандартный курс не должен быть больше 183 дня и меньше 7 дней; ";
        return "".equals(s)?null:s;
    }*/
    
    
        
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
                    this.State = rs.getString("program_state");
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
        this.State = "created";
    }
    
    public Course getCourse() throws Exception{
        PreparedStatement stmt = db.getConn().prepareStatement
        ("select * from course where program = ? and date(now())<\n" +
        "(select case when \n" +
        "(select @m := max(date(date_time)) from schedule_has_material where course = 1)>\n" +
        "(select @t := max(date(date_time)) from schedule_has_test where course = 1)\n" +
        "then @m else @t end)\n" +
        " and course_deleted=0;");
        stmt.setInt(1, ID);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()) return new Course(rs.getInt("course_id"));
        else return null;
        
    }
    
    public ArrayList<Program> getAll() throws Exception{
        ArrayList<Program> list = new ArrayList<Program>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.All("program_state", "active");
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
                    while(rs.next()){
                        try {list.add(new Test(rs.getInt("test_id")));} 
                        catch (SQLException ex) {Log.getOut(ex.getMessage());}
                    }
        }
        return list;
    }
       
    public ArrayList<Material> getMaterials() throws Exception{
        ArrayList<Material> list = new ArrayList<Material>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("material");
        if(db.Done()&&rs!=null){
                
                    while(rs.next()){
                        try {Material m = new Material(rs.getInt("material_id"));
                        list.add(m);
                        } catch (SQLException ex) {
                            Log.getOut(ex.getMessage());
                        }
                    }
        }
        return list;
    }  
    
    public Material getLastMaterial() throws Exception{
        DataBase db = new DataBase(this);
        ResultSet rs = db.FindLast("material");
        if(db.Done()&&rs!=null){
                if(rs.next())
                    return new Material(rs.getInt("material_id"));
                else return null;
                
        }
        else return null;
    }
    
    public Test getLastTest() throws Exception{
        DataBase db = new DataBase(this);
        ResultSet rs = db.FindLast("test");
        if(db.Done()&&rs!=null){
                if(rs.next())
                    return new Test(rs.getInt("test_id"));
                else return null;
                
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
        if(!this.MayChange()) return "Вы не можете менять опублекованную программу";
        Program prg = new Program(name, inventory, this.getArea(), typ, level, minlevel, duration);
        prg.TeacherID = this.TeacherID;
        prg.ID = this.ID;
        DataBase db = new DataBase(prg);
        db.ReWrite();
        if(db.Done())
            return null;
        else return db.Message();
    }
    
    public String Publish(User user) throws Exception{
        
        if(TeacherID != user.getID()) return "Вы не можете менять эту программу";
        String mark = this.Correct();
        if(mark!=null) return mark;
        this.State = "active";
        DataBase db = new DataBase(this);
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
        return this.State.equals("active");
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
    
    public String getState(){
        return this.State;
    }

    private String Correct() throws Exception {
        
        ArrayList<Material> materials = this.getMaterials();
        for(int i=0; i<materials.size(); i++){
            if(materials.get(i).getDocFile().size()<1) return "У лекции "+materials.get(i).getName() + " нет файлов";
        }
        if(materials==null) return "Нет ни одного материала; ";
        if(this.Typ.equals("Seminar")) return null;
        if((this.Typ.equals("Mini")&&materials.size()<2)||(this.Typ.equals("Standard")&&materials.size()<5)) return "Недостаточно материалов; ";
        ArrayList<Test> tests = this.getTests();if(materials==null) return "Нет ни одного материала; ";
        if(materials==null) return "Нет ни одного теста; ";
        if(this.Typ.equals("Mini")) return null;
        if(tests.size()<materials.size()/2) return "Недостаточно тестов; ";
        for(int i=0; i<tests.size(); i++){
            if(tests.get(i).getTask().size()<=3)
                return "Недоастаточно вопросов в тесте "+tests.get(i).getName();
            }
        return null;
        
    }
    
    
}
