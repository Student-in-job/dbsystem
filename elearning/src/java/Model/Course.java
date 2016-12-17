/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Staff.Log;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Course extends Parent {

    private Date StartDate;
    private Date EndDate;
    private boolean Public;
    private Program Program;
    private int ProgramId;
    private boolean SelfStudy;

    
    @Override
    public String _getType(){
        return "course";
    }    
    
    public Course(){
        this.Program = new Program();
    }
    
    public void getById(int id) throws Exception{
        if(id>0){
            this.ID = id;
            this._select();
            this.ReadProgramFromDB();
        } else 
            throw new Exception("Invalid input data for course whith id="+id);
    }
    
    public Program getProgram(){
        return this.Program;
    } 
    
    public boolean Write() throws Exception{
        return this._insert();
    }
    
    public Date getStartDate(){
        return StartDate;
    }
    
    public Date getEndDate(){
        return EndDate;
    }
    
    public boolean isPublic(){
        return Public;
    }
    
    public boolean isSelfStudy(){
        return this.SelfStudy;
    }
    
    public void setPublic(boolean data){
        this._from_db = false;
        this.Public = data;
    }
    
    public void setStartDate(Date data){
        this._from_db = false;
        this.StartDate = data;
        Calendar end = Calendar.getInstance();
        end.setTime(data);
        end.add(Calendar.DAY_OF_YEAR, this.Program.getDuration()-1);
        this.EndDate = end.getTime();
    }
    
    public void setProgram(int data) throws Exception{
        this._from_db = false;
        this.ProgramId = data;
    }
        

    @Override
    public boolean MayChange() {
        return false;
    }

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("start_date", this.StartDate);
        list.put("end_date", this.EndDate);
        list.put("program", this.ProgramId);
        list.put("public", this.Public?1:0);
        list.put("self_study", this.Public?1:0);
        
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.ProgramId= (int) Params.get("program");
        this.StartDate = (Date) Params.get("start_date");
        this.EndDate = (Date) Params.get("end_date");
        this.Public = (int) Params.get("public") == 1;
        this.SelfStudy = (int) Params.get("self_study") == 1;
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    public void ReadProgramFromDB() throws Exception {
        this.Program.getById(this.ProgramId);
    }

    public boolean Create() throws NamingException, SQLException {
        this.SelfStudy = false;
        return this._insert();
    }

    public boolean canStartCourse(User user) throws Exception {
        return this.Public
                &&!this.SelfStudy
                &&this.Program.getUser().getId()!=user.getId()
                &&!user.haveCourse(this);
    }
    
    public boolean canAddToCourse(User user) throws Exception {
        return !this.Public
                &&!this.SelfStudy
                &&this.Program.getUser().getId()!=user.getId()
                &&!user.haveCourse(this)
                &&user.getId()!=this.getProgram().getUser().getId();
    }

    public ArrayList<User> getStudents() {
        ArrayList<User> list = new ArrayList<User>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("course", this.ID);
        Teaching teaching = new Teaching();
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = teaching.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                teaching = new Teaching();
                try{
                    teaching.getFromParam(Params.get(i));
                    teaching.ReadUserFromDB();
                    list.add(teaching.getUser());
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
        return list;
    }

    public ArrayList getMarks() throws Exception {
        ArrayList list = new ArrayList();
        Connection conn = this.getConnection();
        try{
            PreparedStatement stmt = conn.prepareStatement("select \n" +
                "(select name from task where id=task) as 'task',\n" +
                "(select mail from user where id = user) as 'user',\n" +
                "max(accept_task.completed) as 'max',\n" +
                "(select total_count from task where id=task) as 'total'\n" +
                "from accept_task join teaching on teaching=teaching.id\n" +
                "where course=?\n" +
                "group by teaching");
            stmt.setInt(1, this.ID);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                ArrayList<String> buf = new ArrayList<String>();
                try{
                    for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){
                        buf.add(rs.getMetaData().getColumnName(i));
                    }
                    list.add(buf);
                    rs.beforeFirst();
                    while(rs.next()){
                        buf = new ArrayList<String>();
                        for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){
                            buf.add(rs.getString(i));
                        }
                        list.add(buf);
                    }
                } catch(SQLException ex){
                    buf.add("Error code: " + ex.getErrorCode() + ". "+ex.getMessage());
                    list.add(buf);
                }
            }
        } finally {
            if(conn!=null)
                conn.close();
        }
        return list;
    }

    public ArrayList<User> getOutStudents() throws Exception {
        ArrayList<User> list = new ArrayList<User>();
        Connection conn = this.getConnection();
        try{
            PreparedStatement stmt = conn.prepareStatement("select id from user where not exists(select * from teaching where user = user.id and course = ?)");
            stmt.setInt(1, this.ID);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                User user = new User();
                user.getById(rs.getInt("id"));
                list.add(user);
            }
        } finally {
            if(conn!=null)
                conn.close();
        }
        return list;
        
    }
    
    
    public ArrayList<Course> getAll() {
        ArrayList<Course> list = new ArrayList<Course>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("deleted", 0);
        param.put("(start_date-date(now())>0)", true);
        Course program;
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = this.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                program = new Course();
                try{
                    program.getFromParam(Params.get(i));
                    program.ReadProgramFromDB();
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
}
