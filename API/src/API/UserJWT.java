/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import org.json.JSONException;
import org.json.JSONObject;


/**
 *
 * @author ksinn
 */
public class UserJWT extends JWT{
    
    JSONObject Data;
    

    public String getJson(User user, String iss) throws JSONException{
        this.putDataJSON(user);
        return this.getJSON(iss);
    }
    
    public boolean getData(String text, User user, String iss) throws JSONException, Exception{
        if(this.setText(text, iss)){
            this.getData(user);
            return true;
        } else {
            return false;
        }
    }
    
    protected void putDataJSON(User user) throws JSONException{
        JSONObject json = new JSONObject();
        json.put("id", user.getId());
        json.put("name", user.getName());
        json.put("surname", user.getSurname());
        json.put("mail", user.getMail());
        
        Data = json;
        
    }

    protected void getData(User user) throws JSONException, Exception {
        user.setId(Data.getInt("id"));
        user.setName(Data.getString("name"));
        user.setSurname(Data.getString("surname"));
        user.setMail(Data.getString("mail"));
        
    }

    @Override
    protected JSONObject getDataJSON() throws JSONException {
        return Data;
    }

    @Override
    protected void setDataJSON(JSONObject json) throws JSONException {
        Data = json;
    }

}
