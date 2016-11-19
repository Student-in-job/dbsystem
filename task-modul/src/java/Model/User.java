/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class User implements API.User{
    int Id;

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
    
    
}
