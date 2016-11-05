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
    public abstract class SWT {
    protected long ExpiresOn; //скор истечения жизни
    protected String Audience; //Кому преднознче
    protected String Issuer;// Автор токена
    protected String Sign;
    
    protected abstract HashMap<String, String> getData();
    
    public String getURLParam(){
        HashMap<String, String> data = this.getData();
        String res = "";
        res = "ExpiresOn="+this.ExpiresOn
                + "&Audience="+this.Audience
                + "&Issuer="+this.Issuer;
        for(Map.Entry<String, String> entry : data.entrySet()){
            res += "&"+entry.getKey()+"="+entry.getValue();
        }
        
        res += "&HMACSHA256="+HmacUtils.hmacSha256Hex(AppInf.HMACSHA256Key, res);
        
        return res;
    }
    
    public void setExpiresOn(long time){
        this.ExpiresOn = new Date().getTime() + time;
    }
    
    public void setAudience(String issuer){
        this.Audience = issuer;
    }
    
    public void setSign(String sign){
        this.Sign = sign;
    }
        
    public boolean CheckSign(){
        
        HashMap<String, String> data = this.getData();
        String res = "";
        res = "ExpiresOn="+this.ExpiresOn
                + "&Audience="+this.Audience
                + "&Issuer="+this.Issuer;
        for(Map.Entry<String, String> entry : data.entrySet()){
            res += "&"+entry.getKey()+"="+entry.getValue();
        }
        
        return Sign.equals(HmacUtils.hmacSha256Hex(AppInf.HMACSHA256Key, res));
    }
    
    public void setIssuer(String issure){
        this.Issuer = issure;
    }
    
    
}
