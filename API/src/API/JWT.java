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
    
    protected JSONObject getJSON() throws JSONException{
        JSONObject json = this.getDataJSON();
        JSONObject json1 = new JSONObject();
        json1.append("data", json);
        json1.append("sign", HmacUtils.hmacSha256Hex(AppInf.HMACSHA256Key, json.toString()));
        
        return json1;
    }
    
    protected boolean setText(String text) throws JSONException{
        JSONObject json = new JSONObject(text);
        JSONObject json1 = json.getJSONObject("data");
        if(HmacUtils.hmacSha256Hex(AppInf.HMACSHA256Key, json1.toString()).equals(json.getString("sign"))){
            this.setDataJSON(json1);
            return true;
        } else {
            return false;
        }
       
    }

    

    
}
