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
public class Task extends Parant{

    protected TaskGroup Group;
    protected String Answer;
    protected String Question;
    protected int Time;
    protected int Ball;
    protected int GroupId;
    
    
    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("ball", this.Ball);
        list.put("times", this.Time);
        list.put("question", this.Question);
        list.put("answer", this.Answer);
        list.put("group_id", this.GroupId);
        return list;
    }
    
    @Override
    protected void _setParams(HashMap<String, Object> list)  throws Exception {
        
        this.Ball = (int) list.get("ball");
        this.Time = (int) list.get("times");
        this.Question = (String) list.get("question");
        this.Answer = (String) list.get("answer");
        this.GroupId = (int) list.get("group_id");
    }
    
    @Override
    protected String _getTableName() {
        return "task";
    }
    
    @Override
    protected boolean _isCorrect() {
        if(this.Ball == 0) this.Ball = 1;
        if(this.Time == 0) this.Time = 5;
        return  (!this.Question.isEmpty()) 
                && (!this.Answer.isEmpty()) 
                && (this.Group._from_db) 
                && !this.Group.isActive();
    }
    
    public Task(){
        this._from_db = false;
    }
    
    public Task(int id) throws Exception{
        this._from_db = false;
        this.getById(id);
    }
    
    public boolean Write(int user_id) throws Exception{
        if(this.Group.getOwner() != user_id) return false;
        return this._insert();
    }
    
    public boolean Update(int user_id) throws Exception{
        if(this.Group.getOwner() != user_id) return false;
        if(this._from_db) return true;
        return this._update();
    }
    
    public boolean Delete(int user_id) throws Exception{
        if(this.Group.getOwner() != user_id) return false;
        return this._delete();
    }
    
    public void getById(int id) throws Exception{
        this._id = id;
        this._select();
        this.Group = new TaskGroup(this.GroupId);
    }
    
    public void setGroup(int group) throws Exception{
        this._from_db = false;
        this.GroupId = group;
        this.Group = new TaskGroup(group);
        if(!this.Group._from_db) throw new Exception();
    }
    
    public void setAnswer(String answer){
        this._from_db = false;
        this.Answer = answer;
    }
    
    public void setQuestion(String question){
        this._from_db = false;
        this.Question = question;
    }
    
    public void setTime(int time){
        this._from_db = false;
        this.Time = time;
    }
    
    public void setBall(int ball){
        this._from_db = false;
        this.Ball = ball;
    }
    
    public TaskGroup getGroup(){
        return this.Group;
    }
    
    public int getBall(){
        return Ball;
    }
    
    public int getTime(){
        return Time;
    }

    public String getAnswer() {
        return this.Answer;
    }
    
    public String getQuestion() {
        return this.Question;
    }
    
    
   /* 
    private Exception CorrectSQLQuery(){
        try{
            Statement stmt = db.getTuterConn().createStatement();
            stmt.executeQuery(this.Answer);
            return null;
        }catch(NamingException | SQLException ex){return ex;}
        
    }
    
    public ResultSet getAnswerResult() throws SQLException, NamingException{
        
            Connection conn = db.getStudentConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(this.Answer);
            //conn.close();
            return rs;
    }
*/

}
