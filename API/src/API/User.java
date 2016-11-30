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
public interface User extends Parent{
    public int getId();
    public String getMail();
    public String getName();
    public String getIco();
    public String getSurname();
    
    public void setId(int data);
    public void setMail(String data);
    public void setName(String data);
    public void setIco(String data);
    public void setSurname(String data);
}
