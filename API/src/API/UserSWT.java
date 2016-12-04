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
public class UserSWT extends SWT{

    private int Id;
    
    
    @Override
    protected HashMap<String, String> getData() {
        HashMap<String, String> res =  new HashMap<String, String>();
        res.put("id", String.valueOf(this.Id));
        
        return res;
    }
    
    public boolean getDataFromRequest(Map<String, String[]> request, User user){
        this.getData(request);
        this.Id = Integer.parseInt(request.get("id")[0]);
        
        if(this.CheckSign()){
            user.setId(this.Id);
            return true;
        } else {
            return false;
        }
        
    }
    
    public void putData(User user, String issuer, String audience, long expireson){
        this.Audience = audience;
        this.ExpiresOn = expireson;
        this.Issuer = issuer;
        this.Id = user.getId();
    }
            
    public UserSWT(){
    
    }
    
}