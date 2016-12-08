/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import Staff.Log;
import Staff.Storage;
import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Program extends Parent{
    
    
    private String Name;
    private String Decsription;
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
    
    public Program(){
        this.User = new User();
        this.Area = new Area();
    }
    
    public void getById(int id) throws Exception{
               
       if(id>0){
            this.ID = id;
            this._select();
            this.ReadAreaFromDB();
            this.ReadUserFromDB();
        } else 
            throw new Exception("Invalid input data!");
    }
   
    public ArrayList<Program> getAll() {
        ArrayList<Program> list = new ArrayList<Program>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("deleted", 0);
        Program program;
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = this.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
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
    
    public ArrayList getTasks() {
        ArrayList<Task> list = new ArrayList<Task>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("program", this.ID);
        Task task = new Task();
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = task.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
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
        UserId = user.ID;
        return this._insert();
    }
    
    public boolean Change(User user) throws Exception{
        
        if(user.getId()==this.UserId){
            return this._update();
        } else 
            return false;
    }
    
    public boolean Publish(User user) throws Exception{
        
        if(this.User.getId() != user.getId()) 
            return false;
        this.State = "active";
        return this._update();
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
    
    public String getDescription(){
        return this.Decsription;
    }
    
    public String getShortDescription(){
        if(this.Decsription.length()<50)
            return this.Decsription;
        else 
            return this.Decsription.substring(0, 50);
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
        list.put("description", this.Decsription);
        list.put("level", this.Level);
        list.put("state", this.State);
        list.put("duration", this.Duration);
        list.put("user", this.UserId);
        list.put("area", this.AreaId);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.Name = (String) Params.get("name");
        this.Decsription = (String) Params.get("description");
        this.Level = (int) Params.get("level");
        this.State = (String) Params.get("state");
        this.Duration = (int) Params.get("duration");
        this.UserId = (int) Params.get("user");
        this.AreaId= (int) Params.get("area");
        
        
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    public void ReadAreaFromDB() throws Exception {
        this.Area.getById(this.AreaId);
    }

    public void ReadUserFromDB() throws Exception {
        this.User.getById(this.UserId);
    }

    public void setName(String name) {
        this._from_db = false;
        this.Name = name;
    }

    public void setArea(int area) throws Exception {
        this._from_db = false;
        this.AreaId = area;
    }

    public void setDiscription(String description) {
        this._from_db = false;
        this.Decsription = description;
    }

    public void setLevel(int level) {
        this._from_db = false;
        this.Level = level;
    }

    public void setDuration(int duration) {
        this._from_db = false;
        this.Duration = duration;
    }

    public ArrayList getMaterials() {
        return new ArrayList();
    }

    public ArrayList getTests() {
        return new ArrayList();
    }

    public boolean Update(User user) throws NamingException, SQLException {
        if(user.getId() == this.User.getId()){
            return this._update();
        } else 
        return false;
    }

    public boolean mayCreateCourse(User user) throws Exception {
        if(!(user.getId()==this.User.getId()||this.isPublished()))
            return false;
        return this.getCurrentCourse()==null;
    }

    private Course getCurrentCourse() throws Exception {        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("program", this.ID);
        param.put("self_study", 1);
        Course course = new Course();
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = course.getObjectsParam(param);
                try{
                    course.getFromParam(Params.get(1));
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                    return null;
                }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
            throw ex;
        }
        
        return course;
    }
    
}