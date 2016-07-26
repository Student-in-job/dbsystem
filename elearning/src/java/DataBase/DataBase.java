/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import Learning.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
/**
 *
 * @author ksinn
 */
public class DataBase {
    
    protected String Type;
    protected int TypeIndex;
    protected boolean Done;
    protected String ErrorMessage;
    protected Parent Ons;
    protected Connection Connection;
    
    
    
    public DataBase(Parent par){
        Ons = par;
        Connection = db.getConn();
        Done = false;
        ErrorMessage = "Error; ";
        Type = par.getType();
        TypeIndex = par.getTypeIndex();
    }
    
    public boolean Done(){
        return Done;
    }
    
    public String Message(){
        return ErrorMessage;
    }
    
    public void Delete() throws SQLException{
        
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("update "+Type+" set "+Type+"_deleted = 1 where "+Type+"_id = ?;");
            stmt.setInt(1, Ons.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при удаление; Изменено "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }
    
    public void Write() throws Exception {
        
        String error_felds = Ons.Correct();
        if(error_felds!=null){
            
            Done=false;
            ErrorMessage += "Uncorrect input data in feld " + error_felds + "; ";
            return;
        }
        
        switch(TypeIndex){
            
            case 1 : {
                
                this.write_user();
                return;
            }
            
            case 2 : {
                
                this.write_program();
                break;
            }
            
            case 3 : {
                
                this.write_material();
                break;
            }
            
            case 4 : {
                
                this.write_test();
                break;
            }
            
            case 5 : {
                
                this.write_test_task();
                break;
            }
            
            case 6 : {
                
                this.write_files();
                break;
            }
            
            case 7 : {
                
                this.write_area();
                break;
            }
            
            default: {
                
                Done=false;
                ErrorMessage += "Unknow type object; ";
            }
        }
        
        
        if(!Done)
            ErrorMessage += "Can not save data; ";
    }
    
    public void ReWrite() throws Exception{
        
        String error_felds = Ons.Correct();
        if(error_felds!=null){
            
            Done=false;
            ErrorMessage += "Uncorrect input data in feld " + error_felds + "; ";
            return;
        }
        if(this.Find()==null){
            Done=false;
            ErrorMessage += "Такой записи не существует; ";
            return;
        }
        
        switch(TypeIndex){
            
            case 1 : {
                
                this.rewrite_user();
                return;
            }
            
            case 2 : {
                
                this.rewrite_program();
                break;
            }
            
            case 3 : {
                
                this.rewrite_material();
                break;
            }
            
            case 4 : {
                
                this.rewrite_test();
                break;
            }
            
            case 5 : {
                
                this.rewrite_test_task();
                break;
            }
            
            /*case 6 : {
                
                this.rewrite_files();
                break;
            }*/
            
            default: {
                
                Done=false;
                ErrorMessage += "Unknow type object; ";
            }
        }
        
        
        if(!Done)
            ErrorMessage += "Can not resave data; ";
        
        
    }    

    public ResultSet FindUser() throws SQLException {
        
        if(!"user".equals(Type)){
            Done=false;
            ErrorMessage += "Can not find " + Type + " as user; ";
            return null;
        }
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from user where user_mail = ? and user_deleted=0;");
            stmt.setString(1, ((User) Ons).getMail());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done=true;
                return rs;
            }
            else{
                Done = true;
                return null;
            }
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            Done = false;
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            throw ex;
            
        }
    }

    public ResultSet Find() throws SQLException {
        
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+Type+"_id = ? and "+Type+"_deleted=0;");
            stmt.setInt(1, Ons.getID());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else{
                Done = true;
                return null;
            }
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            Done = false;
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            throw ex;
            
        }
    }
    
    public ResultSet Find(String where) throws SQLException {
        
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+where+" where "+Type+" = ? and "+where+"_deleted=0;");
            stmt.setInt(1, Ons.getID());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else{
                Done = true;
                return null;
            }
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            Done = false;
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            throw ex;
            
        }
    }
    
    public ResultSet All() throws SQLException {
        
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+Type+"_deleted=0;");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else{
                Done = true;
                return null;
            }
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            Done = false;
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            throw ex;
            
        }
    }
    
    public ResultSet FindLast() throws SQLException {
        
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+Type+"_id = (select max("+Type+"_id) from "+Type+") and "+Type+"_deleted=0;");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else{
                Done = true;
                return null;
            }
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            Done = false;
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            throw ex;
            
        }
    }
    
    public ResultSet FindLast(String where) throws SQLException {
        
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+where+" where "+where+"_id = (select max("+where+"_id) from "+where+" where "+Type+"=?) and "+where+"_deleted=0;");
            stmt.setInt(1, Ons.getID());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else{
                Done = true;
                return null;
            }
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            Done = false;
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            throw ex;
            
        }
    }
    
    protected void write_user() throws SQLException{
        
        User user = (User) Ons;
        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            PreparedStatement stmt = Connection.prepareStatement
        ("insert into user (user_mail, passwords, user_name, user_surname, birthday, gender, date_reg)  values (?, ?, ?, ?, ?, ?, now());");
            stmt.setString(1, user.getMail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getSurname());
            stmt.setString(5, dateFormat.format(user.getDirthday()));
            stmt.setString(6, user.getGender());
            Done = stmt.executeUpdate() == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            if(ex.getErrorCode()==1062)
                ErrorMessage += "This mail already registre; ";
            else 
                ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
        
    }

    protected void write_program() throws SQLException {
        
        Program program = (Program) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO program  (program_name,  program_description,  program_min_level,  program_level,  program_duration,  user,  area,  program_date,  program_controled,  program_typ) VALUES  (?,  ?,  ?,  ?,  ?,  ?,  ?,  now(),  ?,  ?);");
            stmt.setString(1, program.getName());
            stmt.setString(2, program.getInventory());
            stmt.setInt(3, program.getMinLevel());
            stmt.setInt(4, program.getLevel());
            stmt.setInt(5, program.getDuration());
            stmt.setInt(6, program.getTeacherID());
            stmt.setInt(7, program.getAreaID());
            stmt.setInt(8, 0);
            stmt.setString(9, program.getTyp());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void write_files() throws Exception {
        
        Files file = (Files) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement("insert into files(files_name, material, files_type) values (?, ?, ?);");
            stmt.setString(1, file.getName());
            stmt.setInt(2, file.getMaterialID());
            stmt.setString(3, file.getExtension());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void write_test_task() throws SQLException {
        
        TestTask task = (TestTask) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement("select (case when max(test_task_no) is null then 0 else max(test_task_no) end)+1 as 'nom' from test_task where test=? and test_task_deleted=0;");
            stmt.setInt(1, task.getTestID());
            ResultSet rs = stmt.executeQuery();
            int no=0;
            if(rs.next()) 
                no = rs.getInt("nom");
            
            stmt = Connection.prepareStatement
        ("INSERT INTO test_task (test_task_no, test_task_text, test_task_answer, test_task_v1, test_task_v2, test_task_v3, test_task_v4, test_task_ball, test) " +
                                            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, no);
            stmt.setString(2, task.getQuestion());
            stmt.setString(3, task.getAnswer());
            stmt.setString(4, task.getVariant1());
            stmt.setString(5, task.getVariant2());
            stmt.setString(6, task.getVariant3());
            stmt.setString(7, task.getVariant4());
            stmt.setInt(8, task.getPoint());
            stmt.setInt(9, task.getTestID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void write_test() throws SQLException {
        
        Test test = (Test) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO test(test_name, test_day, program, test_text) VALUES (?, ?, ?, ?);");
            stmt.setString(1, test.getName());
            stmt.setInt(2, test.getDay());
            stmt.setInt(3, test.getProgramID());
            stmt.setString(4, test.getInventory());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void write_material() throws SQLException {
        
        Material mat = (Material) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO material (material_name, material_day, material_type, program, material_text, material_file) VALUES (?,?,?,?,?,?);");
            stmt.setString(1, mat.getName());
            stmt.setInt(2, mat.getDay());
            stmt.setString(3, mat.getTyp());
            stmt.setInt(4, mat.getProgramID());
            stmt.setString(5, mat.getInventory());  
            stmt.setString(6, mat.getText());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void rewrite_user() throws SQLException {
        
        User user = (User) Ons;
        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement
        ("update user set passwords=?, user_name=?, user_surname=?, birthday=?, gender=?, user_mail=? where user_id = ?;");
            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getSurname());
            stmt.setString(4, dateFormat.format(user.getDirthday()));
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getMail());
            stmt.setInt(7, user.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            if(ex.getErrorCode()==1062)
                ErrorMessage += "This mail already registre; ";
            else 
                ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void rewrite_program() throws SQLException {
        
        Program program = (Program) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE program  set program_name=?,  program_description=?,  program_min_level=?,  program_level=?,  program_duration=?, area=?, program_typ=? where program_id=?;");
            stmt.setString(1, program.getName());
            stmt.setString(2, program.getInventory());
            stmt.setInt(3, program.getMinLevel());
            stmt.setInt(4, program.getLevel());
            stmt.setInt(5, program.getDuration());
            stmt.setInt(6, program.getAreaID());
            stmt.setString(7, program.getTyp());
            stmt.setInt(8, program.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void rewrite_material() throws SQLException {
        
        Material mat = (Material) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE material set material_name=?, material_day=?, material_type=?, material_text=?, material_file=? where material_id=?;");
            stmt.setString(1, mat.getName());
            stmt.setInt(2, mat.getDay());
            stmt.setString(3, mat.getTyp());
            stmt.setString(4, mat.getInventory());  
            stmt.setString(5, mat.getText());
            stmt.setInt(6, mat.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void rewrite_test() throws SQLException {
        
        Test test = (Test) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE test set test_name=?, test_day=?, test_text=? where test_id=?;");
            stmt.setString(1, test.getName());
            stmt.setInt(2, test.getDay());
            stmt.setString(3, test.getInventory());
            stmt.setInt(4, test.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void rewrite_test_task() throws SQLException {
        
        TestTask task = (TestTask) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE test_task set test_task_text=?, test_task_answer=?, test_task_v1=?, test_task_v2=?, test_task_v3=?, test_task_v4=?, test_task_ball=? where test_task_id=?;");
            stmt.setString(1, task.getQuestion());
            stmt.setString(2, task.getAnswer());
            stmt.setString(3, task.getVariant1());
            stmt.setString(4, task.getVariant2());
            stmt.setString(5, task.getVariant3());
            stmt.setString(6, task.getVariant4());
            stmt.setInt(7, task.getPoint());
            stmt.setInt(8, task.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; Затронуто "+n+" строк; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        }
    }

    private void rewrite_files() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void write_area() throws Exception {
        
      Area area = (Area) Ons;
        try
        {
            PreparedStatement stmt = Connection.prepareStatement
        ("insert into area (area_name)  values (?);");
            stmt.setString(1, area.getName());
            Done = stmt.executeUpdate() == 1;
            if(Done) return;
            else{
                ErrorMessage += "Ошибка при записи; ";
                return;
            }
            
        }
        catch(SQLException ex)
        {
            Log.getOut(ex.getMessage());
            ErrorMessage += "MySQL: "+ex.getMessage()+"; ";
            Done = false;
            throw ex;
        } 
    }

    
}
