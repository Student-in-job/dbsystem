/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.codec.digest.HmacUtils;

/**
 *
 * @author ksinn
 */
public abstract class SimpleWebToken {
    protected long ExpiresOn; //скор истечения жизни
    protected String Audience; //Кому преднознче
    protected String Issuer = AppInf.Name; // Автор токена
    
    protected abstract HashMap<String, String> getData();
    
    protected String getURLParam(){
        HashMap<String, String> data = this.getData();
        String res = "";
        res = "ExpiresOn="+this.ExpiresOn
                + "&Audience="+this.Audience
                + "&Issuer="+this.Issuer;
        for(Map.Entry<String, String> entry : data.entrySet()){
            res += "&"+entry.getKey()+"="+entry.getValue();
        }
        
        res = "&HMACSHA256="+HmacUtils.getHmacSha256(AppInf.HMACSHA256Key.getBytes());
        
        return res;
    }
    
    public void setExpiresOn(int time){
        this.ExpiresOn = new Date().getTime() + time;
    }
    
    public void setIssuer(String issuer){
        this.Issuer = issuer;
    }
    
}
