/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Task extends Parant{

    protected String Answer;
    protected String Question;
    protected int Time;
    protected int Ball;
    
    
    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("group_id", this.Ball);
        list.put("question", this.Question);
        list.put("answer", this.Answer);
        return list;
    }
    
    @Override
    protected void _setParams(HashMap<String, Object> list) {
        
        this.Ball = (int) list.get("group_id");
        this.Question = (String) list.get("question");
        this.Answer = (String) list.get("answer");
    }
    
    @Override
    protected String _getTableName() {
        return "task";
    }
    
    @Override
    protected boolean _isCorrect() {
        return true;
    }
    
    public Task(){
        this._from_db = false;
        /*this.Ball = 1;
        this.Question = "qwerty?";
        this.Answer = "qwerty!";
        this._write();
        this.Question = "1qwerty?";
        this.Answer = "1qwerty!";
        this._update();
        this._delete();*/
    }
    
    public Task(int id) throws Exception{
        this._from_db = false;
        this.getById(id);
    }
    
    public void getById(int id) throws Exception{
        this._id = id;
        this._read();
    }
    
    public void setAnswer(String answer){
        this._from_db = true;
        this.Answer = answer;
    }
    
    public void setQuestion(String question){
        this._from_db = true;
        this.Question = question;
    }
    
    public void setTime(int time){
        this._from_db = true;
        this.Time = time;
    }
    
    public void setBall(int ball){
        this._from_db = true;
        this.Ball = ball;
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
    
    
    
    /*public Task(String name, int day, String question, String inventory, String answer, int time, int ball){
        
        this.Name=name;
        this.Day=day;
        this.Question=question;  
        this.Inventory=inventory; 
        Time=time;
        Ball=ball;
        Answer=answer;
    }
    
    public int getBall(){
        return Ball;
    }

    public String getAnswer() {
        return this.Answer;
    }
    
    public String getQuestion() {
        return this.Question;
    }
    
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
    }*/


}
