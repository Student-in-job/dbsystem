/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ksinn
 */
public abstract class Component extends Parent{
    
    protected String Name;
    protected int Day;
    protected Program Program;
    protected int ProgramId;
    
    {
        this.Program = new Program();
    }
    
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public boolean Write(User user) throws Exception{
        this.ReadProgramFromDB();
        if(user.getId()==this.Program.getUser().getId())
            return this._insert();
        else
            throw new Exception("You cannot");
    }
    
    public boolean Update(User user) throws Exception{
        this.ReadProgramFromDB();
        if(user.getId()==this.Program.getUser().getId())
            return this._update();
        else
            throw new Exception("You cannot");
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
    
    public String getName(){
        return this.Name;
    }
    
    public int getDay(){
        return this.Day;
    }
    
    public void setProgram(int data){
        this._from_db=false;
        this.ProgramId = data;
    }
    
    public void setDay(int data){
        this._from_db=false;
        this.Day = data;
    }
    
    public void setName(String data){
        this._from_db=false;
        this.Name = data;
    }
    
    public void ReadProgramFromDB() throws Exception{
        this.Program.getById(this.ProgramId);
    }
}
