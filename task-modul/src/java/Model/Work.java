/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Random;

/**
 *
 * @author ksinn
 */
public class Work extends Parant{

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("user_id", this.UserId);
        list.put("times", this.Time);
        list.put("group_id", this.GroupId);
        list.put("mods", this.Mods);
        list.put("count", this.Count);
        list.put("WORK_KEY", this.WORK_KEY);
        list.put("live_time", this.LiveTime);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        this.UserId = (int) list.get("user_id");
        this.Time = (Date) list.get("times");
        this.GroupId = (int) list.get("group_id");
        this.Mods = (String) list.get("mods");
        this.Count = (int) list.get("count");
        this.WORK_KEY = (String) list.get("WORK_KEY");
        this.LiveTime = (int) list.get("live_time");
    }

    @Override
    protected String _getTableName() {
        return "works";
    }

    @Override
    protected boolean _isCorrect() {
        return UserId != 0
                && GroupId != 0
                && Count != 0
                && Mods != null
                && Group._from_db;                
    }
    
    protected String WORK_KEY;
    protected int UserId;
    protected int GroupId;
    protected TaskGroup Group;
    protected Date Time;
    protected String Mods;
    protected int Count;
    protected int LiveTime;
    protected ArrayList<Accept> Accepts;
    
    public Work(){
        this._from_db = false;
    }
    
    public Work(int id) throws Exception{
        this._from_db = false;
        this.getById(id);
    }
    
    public boolean Write(String WORK_KEY) throws Exception{
        this.WORK_KEY = WORK_KEY;
        this.LiveTime = this._calculateLiveTime(this._generatTaskList());
        return this._insert();
    }  
    
    private Accept _next(){
        if(this.Accepts.size() == this.Count) return null;
        ArrayList<Task> list = this._generatTaskList();
        if(this.Accepts.size() == list.size()) return null;
        int ch;
        for(int j=0; j<list.size(); j++){
            ch=0;
            for(int i=0; i<this.Accepts.size(); i++){
                if(this.Accepts.get(i).getTask().getId()==list.get(j).getId())
                    ch++;
            }
            if(ch==0){
                Accept accept = new Accept();
                accept.setTask(list.get(j));
                accept.setWork(this);
                return accept;
            }
        }
        return null;
    } 
    
    public void getById(int id) throws Exception{
        this._id = id;
        this._select();
        this.Group = new TaskGroup(this.GroupId);
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("work_id", this._id);
        Accept accept = new Accept();
        ArrayList<HashMap<String, Object>> Params = accept.getObjectsParam(param);
        for(int i=0; i<Params.size(); i++){
            accept = new Accept();
            accept.getFromParam(Params.get(i));
            this.Accepts.add(accept);
        }
        
    }
    
    public void setGroup(int group) throws Exception{
        this._from_db = false;
        this.GroupId = group;
        this.Group = new TaskGroup(group);
        if(!this.Group._from_db) throw new Exception();
    }
    
    public void setUser(int data){
        this._from_db = false;
        this.UserId = data;
    }
    
    public void setTime(Date data){
        this._from_db = false;
        this.Time = data;
    }
    
    public void setMods(String data){
        this._from_db = false;
        this.Mods = data;
    }
    
    public void setCount(int data){
        this._from_db = false;
        this.Count = data;
    }
    
    public TaskGroup getGroup() throws Exception{
        return this.Group;
    }
    
    public String getKey(){
        return this.WORK_KEY;
    }
    
    public int getUser(){
        return this.UserId;
    }
    
    public Date getTime(){
        return this.Time;
    }
    
    public String getMods(){
        return this.Mods;
    }
    
    public int getCount(){
        return this.Count;
    }
    
    private ArrayList<Task> _generatTaskList(){
        ArrayList<Task> list = new ArrayList<Task>();
        
        Random gen = new Random(this._id);
        
        if(this.Count == 0) 
            list =  this.Group.getTasks();
        else
            for(int i=0; i<this.Count; i++){
                list.add(this.Group.getTasks().get(gen.nextInt(this.Group.getTasks().size())));
            }
 
        Task b;
        int j, k;
        for(int i=0; i<list.size(); i++){
            j = gen.nextInt(list.size());
            k = gen.nextInt(list.size());
            b=list.get(k);
            list.set(k, list.get(j));
            list.set(j, b);
        }
        return list;
    }
    
    private int _calculateLiveTime(ArrayList<Task> list){
        int time=0;
        for(int i=0; i<list.size(); i++){
            time+=list.get(i).getTime()*60+60;
        }
        return time;
    }
    
}
