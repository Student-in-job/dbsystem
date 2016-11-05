/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;


import org.apache.commons.codec.digest.HmacUtils;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ksinn
 */
abstract public class JWT {
    
    
    abstract protected JSONObject getDataJSON() throws JSONException;  
    abstract protected void setDataJSON(JSONObject json) throws JSONException;
    
    protected String getJSON(String iss) throws JSONException{
        String res;
        JSONObject json1 = new JSONObject();
        json1.append("alg", "HS256");
        json1.append("typ", "JWT");
        res = json1.toString() + ".";
        JSONObject json2 = this.getDataJSON();
        json2.append("iss", iss);
        res += json2.toString() + ".";
        res += HmacUtils.hmacSha256Hex(AppInf.HMACSHA256Key, json2.toString());
        
        return res;
    }
    
    protected boolean setText(String text) throws JSONException{
        
        String p1, p2, p3;
        int i1=text.indexOf("}.{", 0);
        int i2=text.indexOf("}.", i1+3);
        p1 = text.substring(0, i1+1);
        p2 = text.substring(i1+2, i2+1);
        p3 = text.substring(i2+2);
        
        JSONObject json1 = new JSONObject(p1);
        JSONObject json2 = new JSONObject(p2);;
        if(HmacUtils.hmacSha256Hex(AppInf.HMACSHA256Key, json2.toString()).equals(p3)){
            this.setDataJSON(json2);
            return true;
        } else {
            return false;
        }
       
    }

    

    
}
