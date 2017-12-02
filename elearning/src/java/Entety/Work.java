/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entety;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

/**
 *
 * @author ksinn
 */
public class Work extends Parent implements API.Work {

    private Date CreateDate;
    private Study Study;
    private int StudyId;
    private UUID WORK_KEY;
    private Task Task;
    private int TaskId;
    private int Mark;

    public Work() {
        this.Study = new Study();
        this.Task = new Task();

    }

    public void ReadTaskFromDB() throws Exception {
        this.Task.getById(this.TaskId);
    }

    public void ReadTeachingFromDB() throws Exception {
        this.Study.getById(this.StudyId);
    }

    @Override
    protected HashMap<String, Object> _getParams() {

        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("completed", this.Mark);
        list.put("task", this.Task.getId());
        list.put("study", this.Study.getId());
        list.put("work_key", this.WORK_KEY.toString());
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {

        this.CreateDate = (Date) Params.get("addDate");
        this.WORK_KEY = UUID.fromString((String) Params.get("work_key"));
        this.StudyId = (int) Params.get("study");
        this.TaskId = (int) Params.get("task");
        this.Mark = (int) Params.get("completed");

    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    @Override
    public String _getType() {
        return "work";
    }

    public void getById(int id) throws Exception {
        if (id > 0) {
            this.ID = id;
            this._select();
            this.ReadTaskFromDB();
            this.ReadTeachingFromDB();
        } else {
            throw new Exception("Invalid input data for AcceptTask whith id=" + id);
        }
    }

    public void getByKey() throws Exception {
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("work_key", this.WORK_KEY.toString());

        ArrayList<HashMap<String, Object>> Params = this.getObjectsParam(param);
        for (int i = 0; i < 1; i++) {
            this.getFromParam(Params.get(i));
        }
        this.ReadTaskFromDB();
        this.ReadTeachingFromDB();
        this._from_db = true;

    }

    public boolean Write() throws Exception {
        this.WORK_KEY = UUID.randomUUID();
        this.Mark = -1;
        this.ReadTaskFromDB();
        this.ReadTeachingFromDB();
        return this._insert();
    }

    public Study getStudy() {
        return this.Study;
    }
    
    public boolean isCompleated(){
        return Mark!=-1;
    }

    public int getMark() {
        return this.Mark;
    }

    public Task getTask() {
        return this.Task;
    }

    @Override
    public boolean MayChange() {
        return false;
    }

    @Override
    public String getWorkKey() {
        return WORK_KEY.toString();
    }

    @Override
    public int getUser() {
        return this.Study.getUser().getId();
    }

    public long getCreateTime() {
        return CreateDate.getTime();
    }

    public Date getTime() {
        return CreateDate;
    }

    public int getListId() {
        return Task.getGroupId();
    }

    public int getCount() {
        return Task.getTotalCount();
    }

    public long getLiveTime() {
        return Task.getTime() * 60 * 1000;
    }

    @Override
    public void setWorkKey(String data) {
        this._from_db = false;
        WORK_KEY = UUID.fromString(data);
    }

    @Override
    public void setUser(int data) {

    }

    public boolean putMark(int parseInt) throws Exception {
        this.Mark = parseInt;
        return this._update();
    }    

    public void setStudy(int data) {
        this.StudyId = data;
    }

    public void setTask(int data) {
        this.TaskId = data;
    }

    public boolean isAlive() {
        if (this.CreateDate != null) {
            if (System.currentTimeMillis() < this.CreateDate.getTime() + this.Task.getTime() * 60 * 1000) {
                return true;
            }
        }
        return false;
    }

}
