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
    protected String FilePath;
    protected String Text;
    
    static public ArrayList<Component> getMaterialList(String Program) {
        
        
        ArrayList<HashMap<String, String>> inf = t_material.get_information_with_program(Program);
    }
    
    public Material(){
    
            Typ="";
            Text="";
            FilePath="";
            ID = "";
            Name="";
            Inventory="";
            Day=0;
            Program=null;
    }
    
    protected boolean Write(){
        
        return t_material.set_information(Program.getID(), Name, Inventory, Day, Typ, Text);
    }
    
    public boolean isGood(){
    
        if(Program==null)
            return false;
        if(!Program.MayAddMaterial())
            return false;
        if(Name==""||Inventory==""||Typ=="")
            return false;
        if(Day<=0||Day>Program.getDuration())
            return false;
        return true;
    }
    
    public String getTyp(){
    
        return this.Typ;
    }
    
    public void setTyp(String typ){
    
        this.Typ = typ;
    }
    
    public String getText(){
    
        return this.Text;
    }
    
    public void setText(String text){
    
        this.Text = text;
    }
    
    public String getFilePath(){
    
        return this.FilePath;
    }
    
    public void setFilePath(String FilePath){
    
        File exs = new File(FilePath);
        if(exs.exists())
            this.FilePath = FilePath;
    }
    
}
