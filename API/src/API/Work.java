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
    public long getCreateTime();
    public int getGroupId();
    public int getCount();
    public long getLiveTime();
    public int getCompleted();
    
    public void setWorkKey(String data);
    public void setUser(int data);
    public void setCreateTime(long data);
    public void setGroup(int data) throws Exception;
    public void setCount(int data);
    public void setLiveTime(long data);
    public void setCompleted(int data);
}
