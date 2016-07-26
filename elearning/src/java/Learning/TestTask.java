/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ksinn
 */
public class TestTask extends Parent{

    protected int TestID;
    protected String Question;
    protected String Answer;
    protected String Variant1;
    protected String Variant2;
    protected String Variant3;
    protected String Variant4;
    protected int Point;
    protected int Number;
    
    @Override
    public String Correct() {
        
        String s = "";
        try{
            Test pg = this.getTest();
        }catch(Exception ex){s+="Program; ";}
        
        if("".equals(Question))
            s+="Question; ";
        if("".equals(Answer))
            s+="Answer; ";
        if("".equals(Variant1))
            s+="Variant1; ";
        if("".equals(Variant2))
            s+="Variant2; ";
        if("".equals(Variant3))
            s+="Variant3; ";
        if("".equals(Variant4))
            s+="Variant4; ";
        if(Point==0)
            s+=" ; ";
        return "".equals(s)?null:s;
    }
    
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
    
    public TestTask(int id) throws Exception
    {
        this.ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    this.Number = rs.getInt("test_task_no");
                    this.Question = rs.getString("test_task_text");
                    this.Answer = rs.getString("test_task_answer");
                    this.Variant1 = rs.getString("test_task_v1");
                    this.Variant2 = rs.getString("test_task_v2");
                    this.Variant3 = rs.getString("test_task_v3");
                    this.Variant4 = rs.getString("test_task_v4");
                    this.Point = rs.getInt("test_task_ball");
                    this.TestID = rs.getInt("test");

                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else throw new Error();
    }
    
    
    
    public String Write(Test test, User user) throws Exception{
        
        if(user.getID()!=test.getProgram().getTeacherID()) return "Вы не можете этого сделать";
        TestID = test.getID();
        return this.write();
    }
    
    public String Change(String question, String answer, String v1, String v2, String v3, String v4, int point, User user) throws Exception{
        
        if(this.getTest().getProgram().getTeacherID() != user.getID()) return "Вы не можете менять эту программу";
        TestTask task = new TestTask(question, answer, v1, v2, v3, v4, point);
        task.TestID = this.TestID;
        task.ID = this.ID;
        DataBase db = new DataBase(task);
        db.ReWrite();
        if(db.Done())
            return null;
        else return db.Message();
    }
    
    
   
    
    
    
    public Test getTest() throws Exception{
        
        return new Test(this.TestID);
    }
    
    public int getTestID(){
        return this.TestID;
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
    
    public int getNumber(){
        return this.Number;
    }
    
    
}