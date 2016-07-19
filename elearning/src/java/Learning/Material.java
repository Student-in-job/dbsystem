/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Material extends Component {

    
    
    protected String Typ;
    protected String Text;
    
    
    public boolean Delete(){
        return DataBase.t_material.delete_with_id(this.ID);
    }
    
    static public ArrayList<Material> getMaterialList(String Program) {
        
        ArrayList<Material> list = new ArrayList<Material>();
        ArrayList<HashMap<String, String>> inf = t_material.get_information_with_program(Program);
        for(int i=0; i<inf.size(); i++){
            
            Material mtr = new Material();
            mtr.Name = inf.get(i).get("name");
            mtr.ID = inf.get(i).get("id");
            mtr.Day = Integer.parseInt(inf.get(i).get("day"));
            mtr.Typ = inf.get(i).get("typ");
            mtr.Text = inf.get(i).get("text");
            mtr.Inventory = inf.get(i).get("inventory");
            mtr.ProgramID = inf.get(i).get("program");
            list.add(mtr);
        }
        return list;
        
    }
    
    public Material(){}
    
    public Material(String program, String typ, String text, String name, String inventory, int day){
    
            Typ="Lecture";
            Text=text;
            Name=name;
            Inventory=inventory;
            Day=day;
            ProgramID=program;
    }
    
    protected void ReRead(){
    
            HashMap<String, String> inf = t_material.get_information(this.ID);
        
            Typ=inf.get("typ");
            Text=inf.get("text");
            ID = inf.get("id");
            Name=inf.get("name");
            Inventory=inf.get("inventory");
            Day=Integer.parseInt(inf.get("day"));
            ProgramID=inf.get("program");
    }
    
    public Material(String id){
        
        this.ID = id;
        this.ReRead();
    }
    
    @Override
    public boolean Write(String user_id){
        
        if(!this.getProgram().getTeacherID().equals(user_id)) return false;
        if(this.isGood())
        return t_material.set_information(ProgramID, Name, Inventory, Day, Typ, Text);
        else
            return false;
    }
    
    @Override
    public boolean ReWrite(String user_id){
        
        if(!this.getProgram().getTeacherID().equals(user_id)) return false;
        if(this.isGood())
         if(t_material.update_information(this.ID, Name, Inventory, Day, Typ, Text)){
            this.ReRead();
            return true;
        }
        this.ReRead();
        return false;
    }
    
    public boolean isGood(){
    
        if(!this.getProgram().MayAddMaterial())
            return false;
        if(Name==""||Inventory==""||Typ==""||ProgramID==""||Text=="")
            return false;
        if(Day<=0||Day>this.getProgram().getDuration())
            return false;
        return true;
    }
    
    public String getTyp(){
    
        return this.Typ;
    }
    
    public void setTyp(String typ){
    
        if("Lecture".equals(typ))
            this.Typ = typ;
    }
    
    public String getText(){
    
        return this.Text;
    }
    
    public void setText(String text){
    
        if("".equals(text))
            this.Text = text;
    }
    
}
