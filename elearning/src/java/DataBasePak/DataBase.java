/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBasePak;

import Learning.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author ksinn
 */
public class DataBase {
    
    protected String Type;
    protected int OnsID;
    protected int TypeIndex;
    protected boolean Done;
    protected String ErrorMessage;
    protected Parent Ons;
    protected Connection Connection;
    
    
    
    public DataBase(Parent par){
        Ons = par;
        Connection = db.getConn();
        Done = false;
        Type = par.getType();
        TypeIndex = par.getTypeIndex();
    }
    
    public boolean Done(){
        return Done;
    }
    
    public int ID(){
        return OnsID;
    }
    
    public void Delete() throws Exception{
        
            this.Find();
            PreparedStatement stmt = Connection.prepareStatement
        ("update "+Type+" set "+Type+"_deleted = 1 where "+Type+"_id = ?;");
            stmt.setInt(1, Ons.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
    }
    
    public void Write() throws SQLException{
        
        Done=false;       
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
            
            case 8 : {
                
                this.write_user_has_course();
                break;
            }
            
            case 9 : {
                
                this.write_course();
                break;
            }
            
            case 10 : {
                
                this.write_accept_test();
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
        
        
        this.Find();
        
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
            
            case 8 : {
                
                this.rewrite_user_has_course();
                break;
            }
            
            case 10 : {
                
                this.rewrite_accept_test();
                break;
            }
            
            default: {
                
                Done=false;
                ErrorMessage += "Unknow type object; ";
            }
        }
        
        
        
        if(!Done)
            ErrorMessage += "Can not resave data; ";
        
        
    }    

    public ResultSet FindUser() throws Exception {
        
        if(!"user".equals(Type)){
            throw new IllegalAction();
        }
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from user where user_mail = ? and user_deleted=0;");
            stmt.setString(1, ((User) Ons).getMail());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done=true;
                return rs;
            }
            else throw new ObjectNotFind();
        
    }

    public ResultSet Find() throws Exception{
        
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+Type+"_id = ? and "+Type+"_deleted=0;");
            stmt.setInt(1, Ons.getID());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else throw new ObjectNotFind();
        }
        
    
    
    public ResultSet Find(String where) throws Exception {
        
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+where+" where "+Type+" = ? and "+where+"_deleted=0 order by addDate desc;");
            stmt.setInt(1, Ons.getID());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else throw new ObjectNotFind();
        
    }
    
    public ResultSet All() throws Exception {
        
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+Type+"_deleted=0 order by addDate desc;");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else throw new ObjectNotFind();
        
    }
    
    public ResultSet All(String column, String value) throws Exception {
        
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+column+" = ? and "+Type+"_deleted=0 order by addDate desc;");
            //stmt.setString(1, column);
            stmt.setString(1, value);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else throw new ObjectNotFind();
        
    }
    
    /*public ResultSet FindLast() throws Exception {
        
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+Type+" where "+Type+"_id = (select max("+Type+"_id) from "+Type+") and "+Type+"_deleted=0;");
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else throw new ObjectNotFind();
        
    }*/
    /*
    public ResultSet FindLast(String where) throws Exception{
        
        
            PreparedStatement stmt = Connection.prepareStatement
        ("select * from "+where+" where "+where+"_id = (select max("+where+"_id) from "+where+" where "+Type+"=?) and "+where+"_deleted=0;");
            stmt.setInt(1, Ons.getID());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                rs.beforeFirst();
                Done = true;
                return rs;
            }
            else throw new ObjectNotFind();
        
    }
    */
    protected void write_user() throws SQLException{
        
        User user = (User) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("insert into user (user_mail, passwords, user_name, user_surname, birthday, gender)  values (?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getMail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getSurname());
            stmt.setDate(5, new Date(user.getBirthday().getTime()));
            stmt.setString(6, user.getGender());
            Done = stmt.executeUpdate() == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) 
                OnsID = rs.getInt(1);    
        
    }

    protected void write_program() throws SQLException {
        
        Program program = (Program) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO program  ("
                + "program_name,  "
                + "program_description,  "
                + "program_min_level,  "
                + "program_level,  "
                + "program_duration,  "
                + "user,  "
                + "area,  "
                + "program_date,  "
                + "program_controled,  "
                + "program_typ) "
                + "VALUES  (?,  ?,  ?,  ?,  ?,  ?,  ?,  now(),  ?,  ?);", Statement.RETURN_GENERATED_KEYS);
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
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) 
                OnsID = rs.getInt(1);
    }

    private void write_files() throws SQLException {
        
        Files file = (Files) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement("insert into files(files_name, material, files_type, files_title) values (?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, file.getName());
            stmt.setInt(2, file.getMaterialID());
            stmt.setString(3, file.getFileType());
            stmt.setString(3, file.getTitle());
            int n = stmt.executeUpdate();
            Done = n == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) 
                OnsID = rs.getInt(1);
            
        
    }

    private void write_test_task() throws SQLException {
        
        TestTask task = (TestTask) Ons;
            
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO test_task (test_task_text, test_task_answer, test_task_v1, test_task_v2, test_task_v3, test_task_v4, test_task_ball, test) " +
                                            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, task.getQuestion());
            stmt.setString(2, task.getAnswer());
            stmt.setString(3, task.getVariant1());
            stmt.setString(4, task.getVariant2());
            stmt.setString(5, task.getVariant3());
            stmt.setString(6, task.getVariant4());
            stmt.setInt(7, task.getPoint());
            stmt.setInt(8, task.getTestID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) 
                OnsID = rs.getInt(1);
            
        
    }

    private void write_test() throws SQLException {
        
        Test test = (Test) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO test(test_name, test_day, program, test_text) VALUES (?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, test.getName());
            stmt.setInt(2, test.getDay());
            stmt.setInt(3, test.getProgramID());
            stmt.setString(4, test.getInventory());
            stmt.setInt(5, test.getTime());
            int n = stmt.executeUpdate();
            Done = n == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) 
                OnsID = rs.getInt(1);
            
    }

    private void write_material() throws SQLException {
        
        Material mat = (Material) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO material (material_name, material_day, material_type, program, material_text, material_file) VALUES (?,?,?,?,?,?);", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, mat.getName());
            stmt.setInt(2, mat.getDay());
            stmt.setString(3, mat.getTyp());
            stmt.setInt(4, mat.getProgramID());
            stmt.setString(5, mat.getInventory());  
            stmt.setString(6, mat.getText());
            int n = stmt.executeUpdate();
            Done = n == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            
            
            if(rs.next()) 
                OnsID = rs.getInt(1);
            
        
    }
    
    private void write_user_has_course() throws SQLException {
        
        User_courses has_course = (User_courses) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("INSERT INTO user_has_course ("
                + "user, "
                + "course, "
                + "user_has_course_datetime ) VALUES (?,?, now());", Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, has_course.getUser_id());
            stmt.setInt(2, has_course.getCourse_id());
            
            int n = stmt.executeUpdate();
            Done = n == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) 
                OnsID = rs.getInt(1);
            
        
    }
    
    private void write_area() throws SQLException {
        
      Area area = (Area) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("insert into area (area_name)  values (?);", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, area.getName());
            Done = stmt.executeUpdate() == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) OnsID = rs.getInt(1);
            
            
        
    }

    private void write_course() throws SQLException {
        
        Course course = (Course) Ons;
        
        PreparedStatement stmt = Connection.prepareStatement
        ("insert into course (course_start_date, program, course_public, course_end_date)  values (?,?,?,?);", Statement.RETURN_GENERATED_KEYS);
        
            stmt.setDate(1, new Date(course.getDate().getTime()));
            stmt.setInt(2, course.getProgramID());
            stmt.setInt(3, course.getPublic()?1:0);
            stmt.setDate(4, new Date(course.getEndDate().getTime()));
            Done = stmt.executeUpdate() == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) OnsID = rs.getInt(1);
                        
                for(int i=0; i<course.getSchadule().getList().size(); i++){
                    stmt = Connection.prepareStatement
                    ("insert into schedule_has_"+course.getSchadule().getList().get(i).getType()+" ("+course.getSchadule().getList().get(i).getType()+", course, date_time)  values (?, ?, ?);");
                        stmt.setInt(1, course.getSchadule().getList().get(i).getID());
                        stmt.setInt(2, OnsID);
                        stmt.setDate(3, new Date(course.getSchadule().getList().get(i).getDate().getTime()));
                        Done &= stmt.executeUpdate() == 1;
                }
                
            
            
    
    }
    
    private void write_accept_test() throws SQLException {
        
        AcceptTest accept = (AcceptTest) Ons;
        
        PreparedStatement stmt = Connection.prepareStatement
        ("insert into accept_test (accept_test_date, user_has_course, test) VALUES (now(), ?, ?);", Statement.RETURN_GENERATED_KEYS);
        
            stmt.setInt(1, accept.getUserHasCourse().getID());
            stmt.setInt(2, accept.getTestID());
            Done = stmt.executeUpdate() == 1;
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()) OnsID = rs.getInt(1);
            
    }

    private void rewrite_user() throws SQLException {
        
        User user = (User) Ons;
        
            Connection conn  = db.getConn();
            PreparedStatement stmt = conn.prepareStatement
        ("update user set passwords=?, user_name=?, user_surname=?, birthday=?, gender=?, user_mail=? where user_id = ?;");
            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getSurname());
            stmt.setDate(4, new Date(user.getBirthday().getTime()));
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getMail());
            stmt.setInt(7, user.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            
            
    }

    private void rewrite_program() throws SQLException {
        
        Program program = (Program) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE program  set program_name=?,  program_description=?,  program_min_level=?,  program_level=?,  program_duration=?, area=?, program_typ=?, program_state=? where program_id=?;");
            stmt.setString(1, program.getName());
            stmt.setString(2, program.getInventory());
            stmt.setInt(3, program.getMinLevel());
            stmt.setInt(4, program.getLevel());
            stmt.setInt(5, program.getDuration());
            stmt.setInt(6, program.getAreaID());
            stmt.setString(7, program.getTyp());
            stmt.setString(8,  program.getState());
            stmt.setInt(9, program.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            
        
    }

    private void rewrite_material() throws SQLException {
        
        Material mat = (Material) Ons;
        
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
            
            
        
    }

    private void rewrite_test() throws SQLException {
        
        Test test = (Test) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE test set test_name=?, test_day=?, test_text=?, test_time=? where test_id=?;");
            stmt.setString(1, test.getName());
            stmt.setInt(2, test.getDay());
            stmt.setString(3, test.getInventory());
            stmt.setInt(4, test.getTime());
            stmt.setInt(5, test.getID());
            int n = stmt.executeUpdate();
            Done = n == 1;
            
            
       
    }

    private void rewrite_test_task() throws SQLException {
        
        TestTask task = (TestTask) Ons;
        
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
            
    }
    
     private void rewrite_user_has_course() throws SQLException {
        
        User_courses has_course = (User_courses) Ons;
        
            PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE user_has_course SET user_has_course_complited=now() WHERE user_has_course_id=?;");
            
            stmt.setInt(1, has_course.getID());
            
            int n = stmt.executeUpdate();
            Done = n == 1;
            
     }

    private void rewrite_accept_test() throws SQLException {
        
        AcceptTest accept = (AcceptTest) Ons;
        
        PreparedStatement stmt = Connection.prepareStatement
        ("UPDATE accept_test SET accept_test_ball=? WHERE accept_test_id=?;");
        
            stmt.setInt(1, accept.getBall());
            stmt.setInt(2, accept.getID());
            Done = stmt.executeUpdate() == 1;
            
    }


    
}
