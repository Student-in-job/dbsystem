/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import java.util.HashMap;


/**
 *
 * @author ksinn
 */
public class TaskGroup extends Parant{
    
    private int Owner;
    private boolean Active;
    private boolean Public;
    private String Name;

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("owner_id", this.Owner);
        list.put("active", this.Active?1:0);
        list.put("public", this.Public?1:0);
        list.put("group_name", this.Name);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        this.Owner = (int) list.get("owner_id");
        this.Public = (int) list.get("public") == 1;
        this.Active = (int) list.get("active") == 1;
        this.Name = (String) list.get("group_name");
    }

    @Override
    protected String _getTableName() {
        return "task_group";
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }
    
    public TaskGroup(){
        this._from_db = false;
    }
    
    public TaskGroup(int id) throws Exception{
        this._from_db = false;
        this.getById(id);
    }
    
    public void getById(int id) throws Exception{
        this._id = id;
        this._read();
    }
    
    public boolean Write(int user_id) throws Exception{
        this.Owner = user_id;
        return this._write();
    }
    
    public boolean Update(int user_id) throws Exception{
        if(this.Owner != user_id) return false;
        if(this._from_db) return true;
        return this._update();
    }
    
    public boolean Delete(int user_id) throws Exception{
        if(this.Owner != user_id) return false;
        return this._delete();
    }
    
    public int getOwner(){
        return this.Owner;
    }
    
    public boolean isPublish(){
        return this.Public;
    }
    
    public boolean isActive(){
        return this.Active;
    }
    
    public String getName(){
        return this.Name;
    }
    
    public void setOwener(int value){
        if(!this._from_db)
            this.Owner = value;
    }
    
    public void setPublish(boolean value){
        this._from_db = false;
        this.Public = value;
    }
    
    public void setActive(boolean value){
        this._from_db = false;
        this.Active = value;
    }
    
    public void setName(String value){
        this._from_db = false;
        this.Name = value;
    }
    
    
}
