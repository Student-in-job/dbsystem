/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entety;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Course extends Parent {

    //дата начала курса
    private Date StartDate;
    //программа курса
    private Program Program;
    //id программы курса
    private int ProgramId;
    //флаг открытого курса, если истина, то на курс студенты могут записываться самостоятельно
    private boolean open;
    //флаг оконченности курса, если истина, то курс не ведеться
    private boolean closed;

    
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
    
    public boolean Update() throws Exception{
        return this._update();
    }
    
    public Date getStartDate(){
        return StartDate;
    }
    
    public boolean isClosed(){
        return closed;
    }
    
    public boolean isOpen(){
        return this.open;
    }
    
    public void setOpen(boolean data){
        this._from_db = false;
        this.open = data;
    }
    
    public void setClosed(boolean data){
        this._from_db = false;
        this.closed = data;
    }
    
    public void setStartDate(Date data){
        this._from_db = false;
        this.StartDate = data;
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
        list.put("program", this.ProgramId);
        list.put("closed", this.closed?1:0);
        list.put("open", this.open?1:0);
        
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.ProgramId= (int) Params.get("program");
        this.StartDate = (Date) Params.get("start_date");
        this.closed = (int) Params.get("closed") == 1;
        this.open = (int) Params.get("open") == 1;
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    public void ReadProgramFromDB() throws Exception {
        this.Program.getById(this.ProgramId);
    }

    public boolean Create() throws NamingException, SQLException {
        this.closed = false;
        return this._insert();
    }

    public boolean canStart(User user) throws Exception {
        return this.open
                &&!this.closed
                &&this.Program.getUser().getId()!=user.getId()
                //&&!user.haveCourse(this)
                ;
    }
    
    public boolean canAddToCourse(User tuter, User stud) throws Exception {
        return !this.closed
                &&this.Program.getUser().getId()==tuter.getId()
                &&stud.getId()!=tuter.getId();
    }

}
