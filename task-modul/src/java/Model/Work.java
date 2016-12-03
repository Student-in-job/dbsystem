/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import java.util.UUID;

/**
 *
 * @author ksinn
 */
public class Work extends Parant implements API.Work{

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("user_id", this.UserId);
        list.put("times", this.Time);
        list.put("group_id", this.GroupId);
        list.put("count", this.Count);
        list.put("WORK_KEY", this.WORK_KEY.toString());
        list.put("live_time", this.LiveTime);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        this.UserId = (int) list.get("user_id");
        this.Time = (Date) list.get("times");
        this.GroupId = (int) list.get("group_id");
        this.Count = (int) list.get("count");
        this.WORK_KEY = UUID.fromString((String) list.get("WORK_KEY"));
        this.LiveTime = (long) list.get("live_time");
        this.Accepts = new ArrayList<Accept>();
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
                && LiveTime != 0
                && Group._from_db;                
    }
    
    protected UUID WORK_KEY;
    protected int UserId;
    protected int GroupId;
    protected TaskGroup Group;
    protected Date Time;
    protected int Count;
    protected long LiveTime;
    protected ArrayList<Accept> Accepts;
    
    public Work(){
        this._from_db = false;
    }
    
    public Work(int id) throws Exception{
        this._from_db = false;
        this.getById(id);
    }
    
    public boolean Write() throws Exception{
        return this._insert();
    }  
    
    public boolean isExistKey() throws Exception{
        HashMap<String, Object> param = new HashMap<String, Object>();
                param.put("WORK_KEY", this.WORK_KEY.toString());
                ArrayList<HashMap<String, Object>> Params = this.getObjectsParam(param);
                if(Params.isEmpty()) {
                    return false;
                } else {
                    this.getFromParam(Params.get(0));
                    this.ReadAcceptsFromDB();
                    this.ReadTaskGroup();
                    return true;
                }
    }
    
    public Accept Next() throws Exception{
        if(this.Accepts.size() == this.Count) 
            return null;
        if(!this.Accepts.isEmpty()){
            if(this.Accepts.get(this.Accepts.size()-1).getLeftTime()>0
                    &&this.Accepts.get(this.Accepts.size()-1).Result==0){
                return this.Accepts.get(this.Accepts.size()-1);
            }
        }
        ArrayList<Task> list = this._generatTaskList();
        if(this.Accepts.size() == list.size()) return null;
        int ch;
        for(int j=0; j<list.size(); j++){
            ch=0;
            for(int i=0; i<this.Accepts.size(); i++){
                if(this.Accepts.get(i).getTask().getId()==list.get(j).getId()) {
                    ch++;
                    break;
                }
            }
            if(ch==0){
                Accept accept = new Accept();
                accept.setTask(list.get(j));
                accept.setWork(this);
                accept.Write();
                return accept;
            }
        }
        return null;
    } 
    
    public void getById(int id) throws Exception{
        this._id = id;
        this._select();
        this.ReadTaskGroup();
        this.ReadAcceptsFromDB();
        
    }
    
    public void ReadTaskGroup() throws Exception{
        this.Group = new TaskGroup(this.GroupId);
    }
    
    public void ReadAcceptsFromDB() throws Exception{
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("work_id", this._id);
        Accept accept = new Accept();
        ArrayList<HashMap<String, Object>> Params = accept.getObjectsParam(param);
        for(int i=0; i<Params.size(); i++){
            accept = new Accept();
            accept.getFromParam(Params.get(i));
            accept.ReadTaskFromDB();
            this.Accepts.add(accept);
        }
    }
    
    @Override
    public void setGroup(int group) throws Exception{
        this._from_db = false;
        this.GroupId = group;
        this.Group = new TaskGroup(group);
        if(!this.Group._from_db) throw new Exception();
    }
    
    @Override
    public void setUser(int data){
        this._from_db = false;
        this.UserId = data;
    }
    
    public void setTime(Date data){
        this._from_db = false;
        this.Time = data;
    }
    
    @Override
    public void setCount(int data){
        this._from_db = false;
        this.Count = data;
    }
    
    @Override
    public int getGroupId(){
        return this.Group.getId();
    }
    
    public TaskGroup getGroup() throws Exception{
        return this.Group;
    }
    
    
    public UUID getKey(){
        return this.WORK_KEY;
    }
    
    @Override
    public int getUser(){
        return this.UserId;
    }
    
    @Override
    public long getCreateTime(){
        return this.Time.getTime();
    }
    
    public Date getTimeObj(){
        return this.Time;
    }
    
    @Override
    public long getLiveTime(){
        return this.LiveTime;
    }
    
    @Override
    public int getCount(){
        return this.Count;
    }
    
    private ArrayList<Task> _generatTaskList(){
        ArrayList<Task> list = new ArrayList<Task>();
        
        Random gen = new Random(this._id);
        int[] id_list = new int[this.Count];
        
        for(int i=0; i<this.Count; i++){
            int N=-1, c;
            do{
                c=0;
                N = gen.nextInt(this.Group.getTasks().size());
                for(int n=0; n<i; n++){
                    if(id_list[n]==N){
                        c++;
                        break;
                    }
                }
            } while (c!=0);
            id_list[i]=N;
            list.add(this.Group.getTasks().get(N));
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

    @Override
    public String getWorkKey() {
        return this.WORK_KEY.toString();
    }

    @Override
    public void setWorkKey(String data) {
        this.WORK_KEY = UUID.fromString(data);
    }

    @Override
    public void setCreateTime(long data) {
        this.Time = new Date(data);
    }

    @Override
    public void setLiveTime(long data) {
        
        this.LiveTime=data;
    }

    @Override
    public int getCompleted() {
        int max=0, res=0;
        for(int i=0; i<this.Accepts.size(); i++){
            res+=Accepts.get(i).Result;
            max+=Accepts.get(i).Task.Ball;
        }
        return res;
    }

    @Override
    public void setCompleted(int data) {
    
    }
    
}
