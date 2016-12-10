/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Staff.Storage;
import Staff.Log;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class Area extends Parent{
    
    protected String Name; 
    
    @Override
    protected HashMap<String, Object> _getParams() {
        
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("name", this.Name);
        return list;
    
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        
        this.Name = (String) Params.get("name");
    
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }    
    
    @Override
    public String _getType(){
        return "area";
    }
    
        
    
    public Area(){
    
    }
    
    public void getById(int id) throws Exception{
        if(id>0){
            this.ID = id;
            this._select();
        } else 
            throw new Exception("Invalid input data for Area whith id="+id);
    }
    
    public boolean Write() throws Exception{
        
        return this._insert();
        
    }
    
    public ArrayList<Program> getPrograms(){
        ArrayList<Program> list = new ArrayList<Program>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("area", this.ID);
        Program program = new Program();
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = program.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                program = new Program();
                try{
                    program.getFromParam(Params.get(i));
                    list.add(program);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
        return list;
    }
    
    public ArrayList<Area> getAll(){
        ArrayList<Area> list = new ArrayList<Area>();
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("deleted", 0);
        Area area;
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = this.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                area = new Area();
                try{
                    area.getFromParam(Params.get(i));
                    list.add(area);
                } catch (Exception ex) {
                    Log.Write(ex.getLocalizedMessage());
                }
            }
        } catch (Exception ex) {
            Log.Write(ex.getLocalizedMessage());
        }
        
        return list;
    }
    
    public String getName(){
        return Name;
    }
    
    public void setName(String data){
        this._from_db = false;
        this.Name = data;
    }
    
    public String getIco(){
        String path = Storage.getRealPath()+Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";
        if(new File(path).exists())
            return Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";
        else return "img/default_area.png";
    } 

    @Override
    public boolean MayChange() {
        return false;
    }

    
}


