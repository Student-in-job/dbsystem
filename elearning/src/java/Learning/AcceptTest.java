/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

/**
 *
 * @author ksinn
 */
public class AcceptTest  extends Parent{
    
    private Test Test;
    private User_courses UserHasCourse;
    private ArrayList<TestTask> Task;
    private ArrayList<ArrayList<String>> Variant;
    private HashMap<Integer, String> Answer; 
    private int Ball;
    private int Right;
    private Date StartTime;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 10;
    }
    
    @Override
    public String getType(){
        return "accept_test";
    }
    
    public AcceptTest(User_courses user_course, Test test) throws Exception{
        this.Test = test;
        this.UserHasCourse = user_course;
        StartTime=new Date();
        DataBase db = new DataBase(this);
        db.Write();
        if(db.Done()) {
            ID = db.ID();
        }
        else throw new Exception();
        
        Task = Mix(this.getTest().getTask());
        Variant = new  ArrayList<ArrayList<String>>();
        for(int i=0; i<Task.size(); i++)
            Variant.add(this.getVar(i));
        Answer = new HashMap<Integer, String>();
        
    }
    
    public void Final() throws Exception{
        Ball=0; Right =0;
        for(int i=0; i<Task.size(); i++){
            if(Task.get(i).getAnswer().equals(Answer.get(i))){ Ball+=Task.get(i).getPoint(); Right++;}
        }
        DataBase db = new DataBase(this);
        db.ReWrite();
        
        PreparedStatement stmt = DataBasePak.db.getConn().prepareStatement
        ("select test_id from test where program = ? and test_id not in " +
        "(select DISTINCT test from accept_test where not(accept_test_ball is null) and user_has_course = ?);");
        stmt.setInt(1, UserHasCourse.getCourse().getProgram().getID());
        stmt.setInt(2, UserHasCourse.getID());
        ResultSet rs = stmt.executeQuery();
        if(!rs.next()){
            db = new DataBase(UserHasCourse);
            UserHasCourse.Finish();
        }
        
        
    }
    
    public void putAnswer(int i, String answer){
        Answer.put(i, answer);
    }
    
    public String getAnswer(int i){
        return Answer.get(i);
    }
    
    
    public int getBall(){
        return Ball;
    }
    
    public int getRightPointer(){
        return Right;
    }
    
    public int getQuantity(){
        return Task.size();
    }
    
    public String getQuestion(int i){
        return Task.get(i).getQuestion();
    }
    
    private ArrayList<String> getVar(int i){
        ArrayList<String> v = new ArrayList<String>();
        v.add(Task.get(i).getVariant1());
        v.add(Task.get(i).getVariant2());
        v.add(Task.get(i).getVariant3());
        v.add(Task.get(i).getVariant4());
        v.add(Task.get(i).getAnswer());
        return Mix(v);
    }
    
    public ArrayList<String> getVariants(int i){
        return Variant.get(i);
    }
    
    static private ArrayList Mix(ArrayList list){
        Random r = new Random();
        Object b;
        int j, k;
        for(int i=0; i<list.size(); i++){
            j = r.nextInt(list.size());
            k = r.nextInt(list.size());
            b=list.get(k);
            list.set(k, list.get(j));
            list.set(j, b);
        }
        return list;
    }
    
    public User_courses getUserHasCourse(){
        return UserHasCourse;
    }
    
    public int getTestID(){
        return Test.getID();
    }
    
    public Test getTest(){
        return Test;
    }
    
    public Date getStartTime(){
        return StartTime;
    }
    
    public Date getEndTime(){
        return new Date(StartTime.getTime()+Test.getTime()*1000);
    }

    @Override
    public boolean MayChange(){
        return false;
    }
    
}