/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

/**
 *
 * @author ksinn
 */
public class Program {
    
    int ID;
    boolean Published;
    String Name;
    String Typ;
    String Inventory;
    String Area;
    int Level;
    int MinLevel;
    int Duration;
    
    public boolean isPublished()
    {
        return this.Published;
    }
    
    public String getName()
    {
        return this.Name;
    }
    
    public String getTyp()
    {
        return this.Typ;
    }
    
    public String getInventory()
    {
        return this.Inventory;
    }   
}
