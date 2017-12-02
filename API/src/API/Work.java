/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;


/**
 *
 * @author ksinn
 */
public interface Work extends Parent{
    public String getWorkKey();
    public int getUser();
    
    public void setWorkKey(String data);
    public void setUser(int data);
    
}
