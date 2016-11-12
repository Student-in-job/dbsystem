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
    public long getTime();
    public int getGroup();
    public int getCount();
    public long getLiveTime();
    public int getResult();
    
    public void setWorkKey(String data);
    public void setUser(int data);
    public void setTime(long data);
    public void setGroup(int data) throws Exception;
    public void setCount(int data);
    public void setLiveTime(long data);
    public void setResult(int data);
}
