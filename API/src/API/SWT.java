/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

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
    
    protected void getData(Map<String, String[]> request){
        this.Audience = request.get("Audience")[0];
        this.ExpiresOn = Long.parseLong(request.get("ExpiresOn")[0]);
        this.Issuer = request.get("Issuer")[0];
        this.Sign = request.get("HMACSHA256")[0];
    }
    
    public String getURLParam(){
        HashMap<String, String> data = this.getData();
        String res = "";
        res = "ExpiresOn="+this.ExpiresOn
                + "&Audience="+this.Audience
                + "&Issuer="+this.Issuer;
        for(Map.Entry<String, String> entry : data.entrySet()){
            res += "&"+entry.getKey()+"="+entry.getValue();
        }

        
        res += ("&HMACSHA256="+HmacUtils.hmacMd5Hex(AppInf.HMACSHA256Key, res));
        
        return res;
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
        
        return Sign.equals(HmacUtils.hmacMd5Hex(AppInf.HMACSHA256Key, res));
    }

    
    
}
