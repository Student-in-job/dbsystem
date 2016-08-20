/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;
import DataBasePak.Log;
import DataBasePak.db;
import DataBasePak.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Program extends Parent{
    
    private String State;
    private String Name;
    private String Typ;
    private String Inventory;
    private Area Area;
    private int Duration;
    private int TeacherID;
    private String Area_name;
    private int Level;
    private int MinLevel;
    protected String Ico;
    
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
     
    public Program(int id) throws Exception{
        
        this.ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Area = new Area(rs.getInt("area"));
                    this.Duration = rs.getInt("program_duration");
                    this.Inventory = rs.getString("program_description");
                    this.Level = rs.getInt("program_level");
                    this.MinLevel = rs.getInt("program_min_level");
                    this.Name = rs.getString("program_name");
                    this.State = rs.getString("program_state");
                    this.Typ = rs.getString("program_typ");
                    this.TeacherID = rs.getInt("user");
        
            
    }
        
    public Program(String name, String inventory, Area area, String typ, int level, int minlevel, int duration)
    {
        this.Name = name;
        this.Inventory = inventory;
        this.Typ = typ;
        this.Area = area;
        this.Level = level;
        this.MinLevel  = minlevel;
        this.Duration = duration;
        this.State = "created";
    }
    
    public Course getCourse() {
        try{
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
        }catch(Exception ex){
            Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
            return null;
        }
        
    }
    
    public ArrayList<Program> getAll() {
        ArrayList<Program> list = new ArrayList<Program>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.All("program_state", "active");
                    while(rs.next()){
                        try {
                            list.add(new Program(rs.getInt("program_id")));
                        } catch (SQLException ex) {
                        Log.getOut(ex.getMessage());
                        }
                    }
                }catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
                }
        return list;
    }
    
   
    public ArrayList<Test> getTests() {
        ArrayList<Test> list = new ArrayList<Test>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("test");
                        while(rs.next()){
                            try {list.add(new Test(rs.getInt("test_id")));} 
                            catch (SQLException ex) {Log.getOut(ex.getMessage());}
                        }
            } catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
                }
        
        return list;
    }
       
    public ArrayList<Material> getMaterials(){
        ArrayList<Material> list = new ArrayList<Material>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("material");
                        while(rs.next()){
                            try {Material m = new Material(rs.getInt("material_id"));
                            list.add(m);
                            } catch (SQLException ex) {
                                Log.getOut(ex.getMessage());
                            }
                        }
        } catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
                }
        
        return list;
    }  
    
    
    public void Write(User user, Part part) throws Exception
    {
        if(Level<=MinLevel) throw new InvalidParameter();
        if(Typ.equals("Seminar") && Duration>7) throw new InvalidParameter();
        if(Typ.equals("Mini") && (Duration<7)) throw new InvalidParameter();
        if(Typ.equals("Standart") && Duration<7) throw new InvalidParameter();
        
        TeacherID = user.getID();
        this.write();
        IcoFile file = new IcoFile(part, this);
        file.SaveFile();
    }
    
    public boolean Change(String name, String inventory, String typ, int level, int minlevel, int duration, User user, Part part) throws Exception{
        
        if(TeacherID != user.getID()) throw new IllegalAction();
        if(!this.MayChange()) throw new IllegalAction();
        Program prg = new Program(name, inventory, this.getArea(), typ, level, minlevel, duration);
        prg.TeacherID = this.TeacherID;
        prg.ID = this.ID;
        DataBase db = new DataBase(prg);
        db.ReWrite();
        if(part!=null){
            IcoFile file = new IcoFile(part, this);
            file.SaveFile();}
        return db.Done();
    }
    
    public boolean Publish(User user) throws Exception{
        
        if(TeacherID != user.getID()) throw new IllegalAction();
        if(this.Correct()!=null) throw new InvalidParameter();
        this.State = "active";
        DataBase db = new DataBase(this);
        db.ReWrite();
        return db.Done();
    }
    
    public boolean MayAddTest(){
        return !this.Typ.equals("Seminar");
    }
    
    public boolean MayAddMaterial(){
        if(this.Typ.equals("Seminar")&&this.getMaterials().size()>=2)
            return false;
        if(this.Typ.equals("Mini-Cours")&&this.getMaterials().size()>=5)
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
        return this.Area.getID();
    }
    
    public Area getArea(){
        return Area;
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

    private String Correct(){
        
        ArrayList<Material> materials = this.getMaterials();
        for(int i=0; i<materials.size(); i++){
            if(materials.get(i).getDocFile().size()<1) return "У лекции "+materials.get(i).getName() + " нет файлов";
        }
        if(materials.size()==0) return "Нет ни одного материала; ";
        if(this.Typ.equals("Seminar")) return null;
        if((this.Typ.equals("Mini")&&materials.size()<2)||(this.Typ.equals("Standard")&&materials.size()<5)) return "Недостаточно материалов; ";
        ArrayList<Test> tests = this.getTests();
        if(tests.size()==0) return "Нет ни одного теста; ";
        if(this.Typ.equals("Mini")) return null;
        if(tests.size()<materials.size()/2) return "Недостаточно тестов; ";
        for(int i=0; i<tests.size(); i++){
            if(tests.get(i).getTask().size()<=3)
                return "Недоастаточно вопросов в тесте "+tests.get(i).getName();
            }
        return null;
        
    }
    
    public String getIco(){
         return "uploadFiles/" + this.getType() + "/" +String.valueOf(ID)+".png";
    }    
    
}
