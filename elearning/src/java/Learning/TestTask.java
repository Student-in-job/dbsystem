/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class TestTask{

    protected String TestID;
    protected String Question;
    protected String Answer;
    protected String Variant1;
    protected String Variant2;
    protected String Variant3;
    protected String Variant4;
    protected String ID;
    protected int Point;
    protected int Number;
    
    protected void ReRead(){
        
        HashMap<String, String> inf = t_test.get_task_information(this.ID);
        this.TestID = inf.get("test");
        this.Question = inf.get("question");
        this.Answer = inf.get("answer");
        this.Variant1 = inf.get("var1");
        this.Variant2 = inf.get("var2");
        this.Variant3 = inf.get("var3");
        this.Variant4 = inf.get("var4");
        this.Point = Integer.parseInt(inf.get("point"));
        this.Number = Integer.parseInt(inf.get("number"));
        
        
    }
    
    public boolean Write(String user_id){
        
        if(!this.getTest().getProgram().getTeacherID().equals(user_id)) return false;
        if(this.isGood()){
            return t_test.set_task_information(TestID, Question, Answer, Variant1, Variant2, Variant3, Variant4, Point);
        }
        else return false;
    }
    
    public boolean ReWrite(String user_id){
        
        if(!this.getTest().getProgram().getTeacherID().equals(user_id)) return false;
        if(this.isGood()){
            if(t_test.update_task_information(ID, Question, Answer, Variant1, Variant2, Variant3, Variant4, Point))
            {this.ReRead(); return true;}
        }
        this.ReRead();
        return false;
    }
    
    public int Delete(){
        return DataBase.t_test.delete_task_with_id(this.ID);
    }
    
    public TestTask()
    {
    }
    
    public TestTask(String test, String question, String answer, String v1, String v2, String v3, String v4, int point)
    {
        
        this.TestID = test;
        this.Question = question;
        this.Answer = answer;
        this.Variant1 = v1;
        this.Variant2 = v2;
        this.Variant3 = v3;
        this.Variant4 = v4;
        this.Point = point;
    }
    
    public TestTask(String id)
    {
        this.ID = id;
        this.ReRead();
    }
    
    static ArrayList<TestTask> getTaskList(String test) {
        
        ArrayList<TestTask> list = new ArrayList<TestTask>();
        ArrayList<HashMap<String, String>> inf = t_test.get_task_information_with_test(test);
        TestTask tt;
        for(int i=0; i<inf.size(); i++){
            tt = new TestTask();
            tt.TestID = inf.get(i).get("test");
            tt.Question = inf.get(i).get("question");
            tt.Answer = inf.get(i).get("answer");
            tt.Variant1 = inf.get(i).get("var1");
            tt.Variant2 = inf.get(i).get("var2");
            tt.Variant3 = inf.get(i).get("var3");
            tt.Variant4 = inf.get(i).get("var4");
            tt.ID = inf.get(i).get("id");
            tt.Point = Integer.parseInt(inf.get(i).get("point"));
            tt.Number = Integer.parseInt(inf.get(i).get("number"));
            list.add(tt);
        }
        return list;
    }
    
    public Test getTest(){
        
        return new Test(this.TestID);
    }
    
    public String getTestID(){
        return this.TestID;
    }
    
    
    public String getQuestion(){
        return this.Question;
    }
    
    public void setQuestion(String question){
        
        if(!"".equals(question))
        this.Question = question;
    }
    
    public String getAnswer(){
        return this.Answer;
    }
    
    public void setAnswer(String answer){
        this.Answer = answer;
    }
    
    public String getVariant1(){
        return this.Variant1;
    }
    
    public void setVariant1(String variant){
        this.Variant1 = variant;
    }
    
    public String getVariant2(){
        return this.Variant2;
    }
    
    public void setVariant2(String variant){
        this.Variant2 = variant;
    }
    
    public String getVariant3(){
        return this.Variant3;
    }
    
    public void setVariant3(String variant){
        this.Variant3 = variant;
    }
    
    public String getVariant4(){
        return this.Variant4;
    }
    
    public void setVariant4(String variant){
        this.Variant4 = variant;
    }

    public int getPoint(){
        return this.Point;
    }
    
    public void setPoint(int point){
        this.Point = point;
    }
    
    public int getNumber(){
        return this.Number;
    }
        
    public String getID(){
        return this.ID;
    }

    private boolean isGood() {
        
        if("".equals(TestID)||"".equals(Question)||"".equals(Answer)||"".equals(Variant1)||"".equals(Variant2)||"".equals(Variant3)||"".equals(Variant4))
            return false;
        if(Point==0)
            return false;
        return true;
    }
    
}