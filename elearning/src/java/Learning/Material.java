/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.Log;
import DataBasePak.DataBase;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ksinn
 */
public class Material extends Component {

    
    
    protected String Typ;
    protected String Text;

    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 3;
    }
    
    @Override
    public String _getType(){
        return "material";
    }
   
    @Override
    public boolean MayChange(){
        return !this.getProgram().isPublished();
    }
    
    public Material(String typ, String text, String name, String inventory, int day){
    
            Typ="Lecture";
            Text=text;
            Name=name;
            Inventory=inventory;
            Day=day;
    }
    
    public Material(int id) throws Exception{
        
        this.ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.Program = new Program(rs.getInt("program"));
                    this.Name =  rs.getString("material_name");
                    this.ID = rs.getInt("material_id");
                    this.Day = rs.getInt("material_day");
                    this.Typ = rs.getString("material_type");
                    this.Text = rs.getString("material_file");
                    this.Inventory = rs.getString("material_text");
        
    }
    
    @Override
    public boolean Write(Program program, User user) throws Exception{
        
        if(user.getID()!=program.getTeacherID()) throw new IllegalAction();
        if(!program.MayChange()) throw new IllegalAction();
        
        if(!program.MayAddMaterial()) throw new IllegalAction();
        if(Day>program.getDuration()) throw new InvalidParameter();
            
        Program = program;
        return this.write();
    }
    
    public boolean Change(String typ, String text, String name, String inventory, int day, User user) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) throw new IllegalAction();
        if(!this.MayChange()) throw new IllegalAction();
        Material mat = new Material(typ, text, name, inventory, day);
        mat.Program = this.Program;
        mat.ID = this.ID;
        DataBase db = new DataBase(mat);
        db.ReWrite();
        return db.Done();
    }
    
    public ArrayList<Files> getFile(){
        
        ArrayList<Files> list = new ArrayList<Files>();
        try{
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("files");
            while(rs.next()){
                try{
                        list.add(new Files(rs.getInt("files_id")));
                } catch (SQLException ex) {Log.getOut(ex.getMessage());}
            }
        }catch(Exception ex){Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());}
        
        return list;
   }
    
    public ArrayList<Files> getVideoFile(){
        
        ArrayList<Files> list = new ArrayList<Files>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("files");
                while(rs.next()){ 
                    try {
                            if("video".equals(rs.getString("files_type")))
                            list.add(new Files(rs.getInt("files_id")));
                    } catch (SQLException ex) { Log.getOut(ex.getMessage());}
                }
        }catch(Exception ex){Log.getOut(ex.getLocalizedMessage() + "\n" + ex.getMessage());}
        
        return list;
   }
    
    public ArrayList<Files> getDocFile(){
        
        ArrayList<Files> list = new ArrayList<Files>();
        try{
            DataBase db = new DataBase(this);
            ResultSet rs = db.Find("files");
                    while(rs.next()){
                            try {
                                if("document".equals(rs.getString("files_type")))
                                list.add(new Files(rs.getInt("files_id")));
                            } catch (SQLException ex) {Log.getOut(ex.getMessage());}
                    }
        } catch (Exception ex) { Log.getOut(ex.getMessage());}
        
        return list;
   }
    
    public String getTyp(){
    
        return this.Typ;
    }
    
    public String getText(){
    
        return this.Text;
    }
    
}
