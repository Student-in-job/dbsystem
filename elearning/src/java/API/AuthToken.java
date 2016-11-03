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
public class AuthToken extends SimpleWebToken{
    
    private int id;

    @Override
    protected HashMap<String, String> getData() {
        HashMap<String, String> res =  new HashMap<String, String>();
        res.put("id", String.valueOf(this.id));
        
        return res;
    }
    
    public AuthToken(){
    
    }
    
}
