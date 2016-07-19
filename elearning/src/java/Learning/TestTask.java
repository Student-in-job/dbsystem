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
public class TestTask {

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
    
    
    public boolean Delete(){
        return DataBase.t_test.delete_task_with_id(this.ID);
    }
    
    public TestTask()
    {
        TestID = "";
        Question = "";
        Answer = "";
        Variant1 = "";
        Variant2 = "";
        Variant3 = "";
        Variant4 = "";
        ID = "";
        Point = 0;
        Number = 0;
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
    
    public String getTestID(){
        return this.TestID;
    }
    
    public void setTestID(String testID){
        this.TestID = testID;
    }
    
    public String getQuestion(){
        return this.Question;
    }
    
    public void setQuestion(String question){
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

    public boolean Write() {
        
        if(this.isGood()){
            return t_test.set_task_information(TestID, Question, Answer, Variant1, Variant2, Variant3, Variant4, Point);
        }
        else return false;
            
    }

    private boolean isGood() {
        
        if("".equals(TestID)||"".equals(Question)||"".equals(Answer)||"".equals(Variant1)||"".equals(Variant2)||"".equals(Variant3)||"".equals(Variant4))
            return false;
        if(Point==0)
            return false;
        return true;
    }
    
}