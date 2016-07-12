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
public class NewProgram {
    String name;
    String area_name;
    int area;
    String inventory;
    String typ;
    int leavel;
    int minleavel;
    int duration;
    User user;
    
    
    public NewProgram()
    {
        this.name = "";
        this.inventory = "";
        this.area_name = "";
        this.typ = "";
        this.area = 0;
        this.leavel = 0;
        this.minleavel  = 0;
        this.duration = 0;
    }
    
    public boolean Write(int user_id)
    {
        return t_program.set_information(user_id, name, inventory, area, typ, leavel, minleavel, duration);
    }
    
    public boolean isGood()
    {
        if(name==""||area_name==""||inventory==""||typ=="")
            return false;
        if(area*leavel*(minleavel+1)*duration==0)
            return false;
        if(minleavel>=leavel)
            return false; 
        if(typ=="Seminar"&&duration>7)
            return false;
        if(typ=="Mini"&&duration<7&&duration>31)
            return false;
        if(typ=="Standard"&&duration<7&&duration>183)
            return false;
        
        return true;
    }
    
    public String getName(){
        
        return this.name;
    }
    
    public void setName(String name){
        
        this.name = name;
    }
    
    public String getAreaname(){
        
        return this.area_name;
    }
    
    public int getArea(){
        
        return this.area;
    }
    
    public void setArea(int area){
        
        this.area = area;
        this.area_name = t_area.get_information(area);
    }
    
    public String getInventory(){
        
        return this.inventory;
    }
    
    public void setInventory(String inventory){
        
        this.inventory = inventory;
    }
    
    public String getTyp(){
        
        return this.typ;
    }
    
    public void setTyp(String typ){
        
        this.typ = typ;
    }
    
    public int getLeavel(){
        
        return this.leavel;
    }
    
    public void setLeavel(int leavel){
        
        if(leavel>0)this.leavel = leavel;
    }
    
    public int getMinLeavel(){
        
        return this.minleavel;
    }
    
    public void setMinLeavel(int minleavel){
        
        if(minleavel>=0)this.minleavel = minleavel;
    }
    
    public int getDuration(){
        
        return this.duration;
    }
    
    public void setDuration(int duration){
        
        if(duration>0)this.duration = duration;
    }
}

