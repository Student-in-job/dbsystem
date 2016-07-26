/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.*;
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
    public String Correct(){
        
        String s = "";
        try{
            Program pg = this.getProgram();
            if(!pg.MayAddMaterial())
                s += "Невозможно добавить материал; ";
            if(Day<=0||Day>this.getProgram().getDuration())
            s += "Неправельный день; ";
        }catch(Exception ex){s+="Program; ";}
        
        if("".equals(Name))
             s += "Name; ";
        if("".equals(Inventory))
            s+="Inventory; ";
        if("".equals(Typ))
            s+="Type; ";
        if("".equals(Text))
            s += "Text; ";
       
        return "".equals(s)?null:s;
    }
    
    @Override
    public int getID(){
        return this.ID;
    }
    
    @Override
    public int getTypeIndex(){
        return 3;
    }
    
    @Override
    public String getType(){
        return "material";
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
        if(db.Done()&&rs!=null){
                try {
                    rs.next();
                    this.ProgramID = rs.getInt("program");
                    this.Name =  rs.getString("material_name");
                    this.ID = rs.getInt("material_id");
                    this.Day = rs.getInt("material_day");
                    this.Typ = rs.getString("material_type");
                    this.Text = rs.getString("material_file");
                    this.Inventory = rs.getString("material_text");

                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else throw new Exception();
    }
    
    @Override
    public String Write(Program prog, User user) throws Exception{
        
        if(user.getID()!=prog.getTeacherID()) return "Вы не можете этого сделать";
        ProgramID = prog.getID();
        return this.write();
    }
    
    public String Change(String typ, String text, String name, String inventory, int day, User user) throws Exception{
        
        if(this.getProgram().getTeacherID() != user.getID()) return "Вы не можете менять эту программу";
        Material mat = new Material(typ, text, name, inventory, day);
        mat.ProgramID = this.ProgramID;
        mat.ID = this.ID;
        DataBase db = new DataBase(mat);
        db.ReWrite();
        if(db.Done())
            return null;
        else return db.Message();
    }
    
    public ArrayList<Files> getFile() throws Exception{
        
        ArrayList<Files> list = new ArrayList<Files>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("files");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        list.add(new Files(rs.getInt("files_id")));
                    }
                    return list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else return null;
   }
    
    public ArrayList<Files> getVideoFile() throws Exception{
        
        ArrayList<Files> list = new ArrayList<Files>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("files");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        if("mp4".equals(rs.getString("files_type")))
                        list.add(new Files(rs.getInt("files_id")));
                    }
                    return list.size()==0?null:list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else return null;
   }
    
    public ArrayList<Files> getDocFile() throws Exception{
        
        ArrayList<Files> list = new ArrayList<Files>();
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find("files");
        if(db.Done()&&rs!=null){
                try {
                    while(rs.next()){
                        if(!"mp4".equals(rs.getString("files_type")))
                        list.add(new Files(rs.getInt("files_id")));
                    }
                    return list.size()==0?null:list;
                } catch (SQLException ex) {
                    Log.getOut(ex.getMessage());
                    throw new Error();
                }
        }
        else return null;
   }
    
    public String getTyp(){
    
        return this.Typ;
    }
    
    public String getText(){
    
        return this.Text;
    }
    
}
