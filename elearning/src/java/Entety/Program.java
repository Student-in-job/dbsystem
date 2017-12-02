/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entety;

import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Program extends Parent{
    
    
    private String Name;
    private String Decsription;
    private int Duration;
    private User User;
    private int UserId;
    
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
        return true;
    }   
    
    public Program(){
        this.User = new User();
    }
    
    public void getById(int id) throws Exception{
               
       if(id>0){
            this.ID = id;
            this._select();
            this.ReadUserFromDB();
        } else 
            throw new Exception("Invalid input data for program with id="+id);
    }
    
    
    public boolean Write(User user) throws Exception
    {
        User = user;
        UserId = user.ID;
        return this._insert();
    }
    
    public boolean Change() throws Exception{
        
            return this._update();
    }
    
    
    public User getUser(){
        return this.User;
    }
    
    public int getDuration(){
        return this.Duration;
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

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("name", this.Name);
        list.put("description", this.Decsription);
        list.put("duration", this.Duration);
        list.put("user", this.UserId);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.Name = (String) Params.get("name");
        this.Decsription = (String) Params.get("description");
        this.Duration = (int) Params.get("duration");
        this.UserId = (int) Params.get("user");
        
        
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    public void ReadUserFromDB() throws Exception {
        this.User.getById(this.UserId);
    }

    public void setName(String name) {
        this._from_db = false;
        this.Name = name;
    }

    public void setDiscription(String description) {
        this._from_db = false;
        this.Decsription = description;
    }

    public void setDuration(int duration) {
        this._from_db = false;
        this.Duration = duration;
    }

    public boolean Update() throws NamingException, SQLException {
            return this._update();
    }
    
}