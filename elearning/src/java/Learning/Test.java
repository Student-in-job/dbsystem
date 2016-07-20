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
public class Test extends Component {
    
    
    
    public int Delete(){
        return DataBase.t_test.delete_test_with_id(this.ID);
    }
    
    static public ArrayList<Test> getTestList(String Program) {
        
        ArrayList<Test> list = new ArrayList<Test>();
        ArrayList<HashMap<String, String>> inf = t_test.get_test_information_with_program(Program);
        for(int i=0; i<inf.size(); i++){
            
            Test tst = new Test();
            tst.Name=inf.get(i).get("name");
            tst.Day=Integer.parseInt(inf.get(i).get("day"));
           // this.Inventory=inf.get("inventory");
            tst.ProgramID=inf.get(i).get("program");
            tst.ID=inf.get(i).get("id");
            list.add(tst);
        }
        return list;
        
    }
    
    public ArrayList<TestTask> getTask(){
    
        return TestTask.getTaskList(this.ID);
    }
    
    
    public boolean isGood(){
    
        if(!this.getProgram().MayAddTest())
            return false;
        if(Name==""||ProgramID=="")
            return false;
        if(Day<=0||Day>this.getProgram().getDuration())
            return false;
        return true;
    }
    
    public Test(){}
    
    public Test(String program, String name, int day){
        
        this.Name=name;
        this.Day=day;
        this.Inventory="";
        this.ProgramID=program;        
    }
    
    
    public Test(String id){
        this.ID=id;
        this.ReRead();
    }
    
    protected void ReRead(){
        
        HashMap<String, String> inf = t_test.get_test_information_with_id(this.ID);
        this.Name=inf.get("name");
        this.Day=Integer.parseInt(inf.get("day"));
       // this.Inventory=inf.get("inventory");
        this.ProgramID=inf.get("program");
        this.ID=inf.get("id"); 
    }

    @Override
    public boolean Write(String user_id) {
    
        if(!this.getProgram().getTeacherID().equals(user_id)) return false;
        if(this.isGood())
        {
            return t_test.set_test_information(ProgramID, Name, Day);
        }
        else return false;
    }
    
    @Override
    public boolean ReWrite(String user_id) {
    
        if(!this.getProgram().getTeacherID().equals(user_id)) return false;
        if(this.isGood())
            if(t_test.update_test_information(this.ID, Name, Day)){
                this.ReRead();
                return true;
            }
         
        this.ReRead();
        return false;
        
    }
    
}
