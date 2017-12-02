/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author ksinn
 */
public class WorkSWT extends SWT{
    
    private int Id;
    private String Key;

    @Override
    protected HashMap<String, String> getData() {
        HashMap<String, String> res =  new HashMap<String, String>();
        res.put("id", String.valueOf(this.Id));
        res.put("work_key", Key);
        
        return res;
    }
    
    public boolean getDataFromRequest(Map<String, String[]> request, Work work){
        this.getData(request);
        this.Id = Integer.parseInt(request.get("id")[0]);
        this.Key = request.get("work_key")[0];
        if(this.CheckSign()){
            work.setWorkKey(this.Key);
            work.setUser(this.Id);
            return true;
        } else {
            return false;
        }
        
    }
    
    public void putData(Work work, String issuer, String audience, long expireson){
        this.Audience = audience;
        this.ExpiresOn = expireson;
        this.Issuer = issuer;
        this.Key = work.getWorkKey();
        this.Id = work.getUser();
    }
            
    public WorkSWT(String key){
        this.HMACSHA256Key = key;
    
    }
    
    
    
}
