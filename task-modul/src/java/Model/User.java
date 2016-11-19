/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import API.AppInf;
import API.HTTPClient;
import API.UserJWT;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class User implements API.User{
    int Id;
    String Mail;
    String Name;
    String Surname;
    
    
    @Override
    public int getId() {
        return this.Id;
    }

    @Override
    public void setId(int data) {
        this.Id = data;
    }
    
    public ArrayList<TaskGroup> getGroup() {
        
        ArrayList<TaskGroup> list = new ArrayList<TaskGroup>();
        if(Id==0)
            return null;
        try {
            HashMap<String, Object> param = new HashMap<String, Object>();
            param.put("owner_id", this.Id);
            TaskGroup group = new TaskGroup();
            ArrayList<HashMap<String, Object>> Params = group.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                group = new TaskGroup();
                group.getFromParam(Params.get(i));
                group.ReadTasksFromBd();
                list.add(group); 
            }
        } catch (Exception ex) {
            
        }
        
        return list;
        
    }
    
    public boolean getUserData(){
        if(Id==0)
            return false;
        try {
            UserJWT wt = new UserJWT();
            HTTPClient client = new HTTPClient(AppInf.main+"/api/user_data", "id="+String.valueOf(this.Id), "POST");
            client.sendRequest();
            if(wt.getData(client.getRequestText(), this, AppInf.main)){
                return true;
            }
        } catch (Exception ex) {
            return false;
        }
        return false;
    }

    @Override
    public String getMail() {
        return this.Mail;
    }

    @Override
    public String getName() {
        return this.Name;
    }

    @Override
    public String getSurname() {
        return this.Surname;
    }

    @Override
    public void setMail(String data) {
        this.Mail = data;
    }

    @Override
    public void setName(String data) {
        this.Name = data;
    }

    @Override
    public void setSurname(String data) {
        this.Surname = data;
    }
    
    
}
