/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ksinn
 */
public class Test extends Component {

    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 4;
    }
    
    @Override
    public String getType(){
        return "test";
    }
    
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public Test(String name, int day, String inventory){
        
        this.Name=name;
        this.Day=day;
        this.Inventory=inventory;       
    }
    
    
    public Test(int id) throws Exception{
        this.ID=id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    this.Name = rs.getString("test_name");
                    this.Day = rs.getInt("test_day");
                    this.ProgramID = rs.getInt("program");
                    this.Inventory = rs.getString("test_text");

                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else throw new Error();
    }
   
    
    @Override
    public String Write(Program program, User user) throws Exception{
        
        if(user.getID()!=program.getTeacherID()) return "Вы не можете этого сделать";
        if(!program.MayChange()) return "Вы не можете менять опублекованную программу";
        
        if(!program.MayAddTest()) return "Невозможно добавить тест; ";
        if(Day>program.getDuration()) return "Прграмма длиться всего "+program.getDuration()+"; ";
        
        ProgramID = program.getID();
        return this.write();
    }
    
    public String Change(String name, String inventory, int day, User user) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) return "Вы не можете менять эту программу";
        if(this.getProgram().isPublished()) return "Вы не можете менять опублекованную программу";
        Test test = new Test(name, day, inventory);
        test.ProgramID = this.ProgramID;
        test.ID = this.ID;
        DataBase db = new DataBase(test);
        db.ReWrite();
        if(db.Done())
            return null;
        else return db.Message();
    }
    
    public ArrayList<TestTask> getTask(){
        ArrayList<TestTask> list = new ArrayList<TestTask>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("test_task");
            if(db.Done()&&rs!=null){
                while(rs.next()){
                        try {
                            int i = rs.getInt("test_task_id");
                            TestTask task = new TestTask(i);
                            list.add(task);
                        } catch (Exception ex) {Log.getOut(ex.getMessage());}
                }
            }
        }catch (Exception ex) { Log.getOut(ex.getMessage());}
        
        return list;
    }
    
    
}
