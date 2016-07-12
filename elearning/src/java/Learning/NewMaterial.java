/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;

/**
 *
 * @author ksinn
 */
public class NewMaterial extends NewComp {
    
    String Typ;
    
    public boolean Write(){
        
        return t_material.set_information(Program.ID, Name, Inventory, Day, Typ);
    }
    
    public boolean isGood(){
    
        if(!Program.MayAddMaterial())
            return false;
        if(Name==""||Inventory==""||Typ=="")
            return false;
        if(Day<=0||Day>Integer.parseInt(Program.Duration))
            return false;
        return true;
    }
    
    public String getTyp(){
    
        return this.Typ;
    }
    
    public void setTyp(String typ){
    
        this.Typ = typ;
    }
    
    
}
