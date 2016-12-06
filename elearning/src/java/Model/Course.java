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
            throw new Exception("Invalid input data!");
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

    public ArrayList getMarks() {
        ArrayList list = new ArrayList();
        
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
                user.getById(rs.getByte("id"));
                list.add(user);
            }
        } finally {
            if(conn!=null)
                conn.close();
        }
        return list;
        
    }
}
