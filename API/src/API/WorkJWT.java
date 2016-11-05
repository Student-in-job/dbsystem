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
public class WorkJWT extends JWT{
    
    JSONObject Data;
    

    public String getJson(Work work, String iss) throws JSONException{
        this.putDataJSON(work);
        return this.getJSON(iss);
    }
    
    public boolean getData(String text, Work work, String iss) throws JSONException{
        if(this.setText(text, iss)){
            this.putDataJSON(work);
            return true;
        } else {
            return false;
        }
    }
    
    protected void putDataJSON(Work work) throws JSONException{
        JSONObject json = new JSONObject();
        json.append("user_id", work.getUser());
        json.append("time", work.getTime());
        json.append("group", work.getGroup());
        json.append("count", work.getCount());
        json.append("livetime", work.getLiveTime());
        json.append("work_key", work.getWorkKey());
        
        Data = json;
        
    }

    protected void getData(Work work) throws JSONException, Exception {
        work.setCount(Data.getInt("count"));
        work.setUser(Data.getInt("user_id"));
        work.setTime(Data.getInt("time"));
        work.setGroup(Data.getInt("group"));
        work.setLiveTime(Data.getInt("livetime"));
        work.setWorkKey(Data.getString("work_key"));
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
