/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Impl;

import Struct.Attempt;
import Struct.DBEntety;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class AttemptEntety extends DBEntety implements Attempt{

    protected int workId;
    protected int taskId;
    protected boolean accepted;
    protected String answer;

    
    
    
    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("work_id", this.workId);
        list.put("task_id", this.taskId); 
        list.put("answer", this.answer); 
        list.put("accepted", this.accepted?1:0);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        this.workId = (int) list.get("work_id");
        this.taskId = (int) list.get("task_id");      
        this.answer = (String) list.get("answer");
        this.accepted = ((int) list.get("accepted"))==1;
    }

    @Override
    protected String _getTableName() {
        return "attempt";
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    @Override
    public boolean save() throws Exception {
        return this._insert();
    }

    @Override
    public void getById(int id) throws Exception {
        this._id = id;
        this._select();
    }

    @Override
    public void setTaskId(int task_id) {
        this.taskId = task_id;
    }

    @Override
    public void setWorkId(int work_id) {
        this.workId = work_id;
    }

    @Override
    public void setAccept(boolean accept) {
        this.accepted = accept;
    }

    @Override
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public boolean isAccept() {
        return this.accepted;
    }

    @Override
    public int getWorkId() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getAnswer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getTaskId() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
