/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.sql.SQLException;

/**
 *
 * @author ksinn
 */
abstract class Component extends Parent{
    
    protected String Name;
    protected String Inventory;
    protected int Day;
    protected int ProgramID;
    
    public String Write(Program prog, User user) throws Exception{
        return null;
    }
    
    public int getProgramID(){
    
        return this.ProgramID;
    } 
    
    public Program getProgram() throws Exception{
    
        return new Program(this.ProgramID);
    } 
    
    public String getName(){
    
    return this.Name;
    }
    
    public String getInventory(){
    
    return this.Inventory;
    }
    
    public int getDay(){
    
    return this.Day;
    }
 
}
