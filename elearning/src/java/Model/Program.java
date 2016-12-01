/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import Staff.Log;
import Staff.Storage;
import Staff.DataBase;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Program extends Parent{
    
    
    private String Name;
    private String Dicsription;
    private int Level;
    private String State;
    private Area Area;
    private int AreaId;
    private int Duration;
    private User User;
    private int UserId;
    private Date addDate;
    
    @Override
    public int getId(){
        return this.ID;
    }
    
    @Override
    public String _getType(){
        return "program";
    }
    
    @Override
    public boolean MayChange(){
        return !this.isPublished();
    }   
    
    public Program(){}
    
    public void getById(int id) throws Exception{
               
       if(id>0){
            this.ID = id;
            this._select();
            this.ReadAreaFromDB();
            this.ReadUserFromDB();
        } else 
            throw new Exception("Invalid input data!");
    }
    
/*    public ArrayList<ArrayList<String>> getUserMark(){
        ArrayList<ArrayList<String>> res = new ArrayList<ArrayList<String>>();
        
        try{
            PreparedStatement stmt = Storage.getConn().prepareStatement
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
                    Log.Write(ex.getLocalizedMessage());
                }
        
        return res;
    }
   
    public ArrayList<Program> Find(String find) {
        ArrayList<Program> list = new ArrayList<Program>();
        try{
            PreparedStatement stmt = Storage.getConn().prepareStatement
            ("select * from program where program_deleted = 0 and program_state='active' and program_name like ?;");
            stmt.setString(1, "%"+find+"%");
            ResultSet rs = stmt.executeQuery();
                    while(rs.next()){
                        try {
                            list.add(new Program(rs.getInt("program_id")));
                        } catch (SQLException ex) {
                        Log.Write(ex.getLocalizedMessage());;
                        }
                    }
                }catch(Exception ex){
                    Log.Write(ex.getLocalizedMessage());
                }
        return list;
    }
   
    public Course getCourse() {
        try{
        PreparedStatement stmt = Storage.getConn().prepareStatement
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
            Log.Write(ex.getLocalizedMessage());
            return null;
        }
        
    }
*/     
    public ArrayList<Program> getAll() {
        ArrayList<Program> list = new ArrayList<Program>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("deleted", 0);
        Program program;
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = this.getObjectsParam(param);
            for(int i=0; i<1; i++){
                program = new Program();
                try{
                    program.getFromParam(Params.get(i));
                    list.add(program);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
        return list;
    }
    
    public ArrayList<Task> getTasks() {
        ArrayList<Task> list = new ArrayList<Task>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("program", this.ID);
        Task task;
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = this.getObjectsParam(param);
            for(int i=0; i<1; i++){
                task = new Task();
                try{
                    task.getFromParam(Params.get(i));
                    list.add(task);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
        return list;
    }
    
    
    public boolean Write(User user) throws Exception
    {
        User = user;
        return this._insert();
    }
    
    public boolean Change(User user) throws Exception{
        
        if(user.getId()==this.UserId){
            return this._update();
        } else 
            return false;
    }
    
    public boolean Publish(User user) throws Exception{
        
        if(this.User.getId() != user.getId()) throw new Exception("You cannot");
        //if(this.Correct()!=null)  return false;//throw new InvalidParameter();
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
    
    
    public User getUser(){
        return this.User;
    }
    
    public Area getArea(){
        return this.Area;
    }
    
    public int getLevel(){
        return this.Level;
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
    
    public String getDiscription(){
        return this.Dicsription;
    }
    
    public String getState(){
        return this.State;
    }

    public String getIco(){
        String path = Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";;
        if(new File(Storage.getRealPath()+path).exists())
            return Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";
        else return "img/default_program.png";
    }    

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("name", this.Name);
        list.put("discription", this.Dicsription);
        list.put("level", this.Level);
        list.put("state", this.State);
        list.put("duration", this.Duration);
        list.put("user", this.User.getId());
        list.put("area", this.Area.getId());
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.Name = (String) Params.get("name");
        this.Dicsription = (String) Params.get("discription");
        this.Level = (int) Params.get("level");
        this.State = (String) Params.get("state");
        this.Duration = (int) Params.get("duration");
        this.UserId = (int) Params.get("user");
        this.AreaId= (int) Params.get("area");
        this.User = new User();
        this.Area = new Area();
        
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    private void ReadAreaFromDB() throws Exception {
        this.Area.getById(this.AreaId);
    }

    private void ReadUserFromDB() throws Exception {
        this.User.getById(this.UserId);
    }
    
}