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
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
    private User Teacher;
    private int Level;
    private int MinLevel;
    protected String Ico;
    protected Date Date;
    
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
    
    public Program(){}
    
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
                    this.Teacher = new User(rs.getInt("user"));
                    this.Date = rs.getDate("addDate");
        
            
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
    
    public ArrayList<ArrayList<String>> getUserMark(){
        ArrayList<ArrayList<String>> res = new ArrayList<ArrayList<String>>();
        
        try{
            PreparedStatement stmt = db.getConn().prepareStatement
            ("select \n" +
            "(select user_surname from user where user_id=user) as 'surname', \n" +
            "(select user_name from user where user_id=user) as 'name',\n" +
            "(select task_name from task where task_id=task) as 'task',\n" +
            "max(accept_task_ball) as 'right',\n" +
            "(select task_count from task where task_id=task) as 'all'\n" +
            "from user_has_course join accept_task on user_has_course_id=user_has_course\n" +
            "where course in (select course_id from course where program=?)\n" +
            "group by task, user_has_course");
            stmt.setInt(1, this.ID);
            ResultSet rs = stmt.executeQuery();
            ArrayList<String> buf = new ArrayList<String>();
                    for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){
                        buf.add(rs.getMetaData().getColumnName(i));
                    }
                    res.add(buf);

                    while(rs.next()){
                        buf = new ArrayList<String>();
                        for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){
                            buf.add(rs.getString(i));
                        }
                        res.add(buf);
                    }
                }catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
                }
        
        return res;
    }
    
    public ArrayList<Program> Find(String find) {
        ArrayList<Program> list = new ArrayList<Program>();
        try{
            PreparedStatement stmt = db.getConn().prepareStatement
            ("select * from program where program_deleted = 0 and program_state='active' and program_name like ?;");
            stmt.setString(1, "%"+find+"%");
            ResultSet rs = stmt.executeQuery();
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
        Collections.sort(list, new Comparator<Test>() {
        @Override
        public int compare(Test o1, Test o2) {
                return o1.getDay() - o2.getDay();
        }
        });
        return list;
    }
    
    public ArrayList<Task> getTasks() {
        ArrayList<Task> list = new ArrayList<Task>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("task");
                        while(rs.next()){
                            try {list.add(new Task(rs.getInt("task_id")));} 
                            catch (SQLException ex) {Log.getOut(ex.getMessage());}
                        }
            } catch(Exception ex){
                    Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());
            }
        Collections.sort(list, new Comparator<Task>() {
        @Override
        public int compare(Task o1, Task o2) {
                return o1.getDay() - o2.getDay();
        }
        });
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
        
        Collections.sort(list, new Comparator<Material>() {
        @Override
        public int compare(Material o1, Material o2) {
                return o1.getDay() - o2.getDay();
        }
        });
        return list;
    }  
    
    
    public void Write(User user, Part part) throws Exception
    {
        if(Level<=MinLevel) throw new InvalidParameter();
        /*if(Typ.equals("Seminar") && Duration>7) throw new InvalidParameter();
        if(Typ.equals("Mini") && (Duration<7)) throw new InvalidParameter();
        if(Typ.equals("Standart") && Duration<7) throw new InvalidParameter();*/
        
        Teacher = user;
        this.write();
        Test exem = new Test("Exam", this.Duration, "Required final exam for the program "+this.getName(), 60);
        exem.Write(this, user);
        IcoFile file = new IcoFile(part, this);
        file.SaveFile();
    }
    
    public boolean Change(String name, String inventory, String typ, int level, int minlevel, int duration, User user, Part part) throws Exception{
        
        if(Teacher.getID() != user.getID()) throw new IllegalAction();
        if(!this.MayChange()) throw new IllegalAction();
        Program prg = new Program(name, inventory, this.getArea(), typ, level, minlevel, duration);
        prg.Teacher = this.Teacher;
        prg.ID = this.ID;
        DataBase db = new DataBase(prg);
        db.ReWrite();
        Test e;
        ArrayList<Test> tests = this.getTests();
        for(int i = tests.size()-1; i>=0; i--)
            if(tests.get(i).isExem()){
                e = tests.get(i);
                e.Change(e.getName(), e.getInventory(), this.Duration, user, e.getTime());
            }
        
        if(part.getSize()!=0){
            IcoFile file = new IcoFile(part, this);
            file.SaveFile();}
        return db.Done();
    }
    
    public boolean Publish(User user) throws Exception{
        
        if(Teacher.getID() != user.getID()) throw new IllegalAction();
        if(this.Correct()!=null)  return false;//throw new InvalidParameter();
        this.State = "active";
        DataBase db = new DataBase(this);
        db.ReWrite();
        if(db.Done()){
            /*Statement stmt = DataBasePak.db.getConn().createStatement();
            PreparedStatement stmt2 = DataBasePak.db.getConn().prepareStatement("SHOW tables from task like ?;");
            String prefex= String.valueOf(this.ID)+"_%";
            stmt2.setString(1, prefex);
            ResultSet rs=stmt2.executeQuery();
            
            while(rs.next()){
                stmt.addBatch("revoke all on task."+rs.getString(1)+" from 'tuter'@'localhost';");
            }
            stmt.executeBatch();*/
           return true; 
        }
        else return false;
    }
    
    public boolean MayAddTest(){
        return true;
    }
    
    public boolean MayAddMaterial(){
        if(this.Typ.equals("Seminar")&&this.getMaterials().size()>=2)
            return false;
        if(this.Typ.equals("Mini-Cours")&&this.getMaterials().size()>=5)
            return false;
        return true;
    }  
    
    
    public User getTeacher(){
        return Teacher;
    }
    
    
    public int getTeacherID(){
        return Teacher.getID();
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

    public String Correct(){
        
        String error="";
        ArrayList<Material> materials = this.getMaterials();
        if(materials.isEmpty()) error+= "No material;<br>";
        for(int i=0; i<materials.size(); i++){
            if(materials.get(i).getDay()>this.getDuration()) error+=  "Incorrect time "+materials.get(i).getName() + " material;<br>";
            if(materials.get(i).getDocFile().size()<1) error+=  "Material "+materials.get(i).getName() + " does not document;<br>";
        }
        ArrayList<Test> tests = this.getTests();
        for(int i=0; i<tests.size(); i++){
            if(tests.get(i).getDay()>this.getDuration()) error+=  "Incorrect time "+tests.get(i).getName() + " test;<br>";
            if(tests.get(i).getTask().size()<1)
                error+=  "In the test "+tests.get(i).getName()+" no questions;<br>";
            }
        return error.equals("")?null:error;
        
    }
    
    public String getIco(){
        String path = db.getFileDir() + this.getType() + "/" +String.valueOf(ID)+".png";;
        if(new File(db.getRealPath()+path).exists())
            return db.getFileDir() + this.getType() + "/" +String.valueOf(ID)+".png";
        else return "img/default_program.png";
    }    
    
}