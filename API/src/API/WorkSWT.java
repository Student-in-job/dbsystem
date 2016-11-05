/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import java.util.HashMap;
/**
 *
 * @author ksinn
 */
public class WorkSWT extends SWT{
    
    private String Id;
    private String Key;

    @Override
    protected HashMap<String, String> getData() {
        HashMap<String, String> res =  new HashMap<String, String>();
        res.put("id", this.Id);
        res.put("work_key", Key);
        
        return res;
    }
    
    public WorkSWT(){
    
    }
    
    public void setID(int id){
        this.Id = String.valueOf(id);
    }
    
    public void setKey(String key){
        this.Key=key;
    }
    
}
