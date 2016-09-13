/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.DataBase;
import DataBasePak.IllegalAction;
import java.sql.ResultSet;

/**
 *
 * @author ksinn
 */
public class TestTask extends Parent{

    protected Test Test;
    protected String Question;
    protected String Answer;
    protected String Variant1;
    protected String Variant2;
    protected String Variant3;
    protected String Variant4;
    protected int Point;
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 5;
    }
    
    @Override
    public String getType(){
        return "test_task";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getTest().getProgram().isPublished();
    }
    
    public TestTask(String question, String answer, String v1, String v2, String v3, String v4, int point)
    {
        
        this.Question = question;
        this.Answer = answer;
        this.Variant1 = v1;
        this.Variant2 = v2;
        this.Variant3 = v3;
        this.Variant4 = v4;
        this.Point = point;
    }
    
    public TestTask(int id) throws Exception{
        this.ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Question = rs.getString("test_task_text");
                    this.Answer = rs.getString("test_task_answer");
                    this.Variant1 = rs.getString("test_task_v1");
                    this.Variant2 = rs.getString("test_task_v2");
                    this.Variant3 = rs.getString("test_task_v3");
                    this.Variant4 = rs.getString("test_task_v4");
                    this.Point = rs.getInt("test_task_ball");
                    this.Test = new Test(rs.getInt("test"));
    }
    
    
    
    public boolean Write(Test test, User user) throws Exception{
        
        if(user.getID()!=test.getProgram().getTeacherID()) throw new IllegalAction();
        if(!test.MayChange()) throw new IllegalAction();
        
        Test = test;
        return this.write();
    }
    
    public boolean Change(String question, String answer, String v1, String v2, String v3, String v4, int point, User user) throws Exception{
        
        if(this.getTest().getProgram().getTeacherID() != user.getID()) throw new IllegalAction();
        if(!this.MayChange()) throw new IllegalAction();
        TestTask task = new TestTask(question, answer, v1, v2, v3, v4, point);
        task.Test = this.Test;
        task.ID = this.ID;
        DataBase db = new DataBase(task);
        db.ReWrite();
        return db.Done();
    }
    
    
   
    
    
    
    public Test getTest(){
        
        return Test;
    }
    
    public int getTestID(){
        return this.Test.getID();
    }
    
    public String getQuestion(){
        return this.Question;
    }
    
    public String getAnswer(){
        return this.Answer;
    }
    
    public String getVariant1(){
        return this.Variant1;
    }
    
    public String getVariant2(){
        return this.Variant2;
    }
    
    public String getVariant3(){
        return this.Variant3;
    }
    
    public String getVariant4(){
        return this.Variant4;
    }
    
    public int getPoint(){
        return this.Point;
    }

    
    
}