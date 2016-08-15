/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBase.DataBase;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author javlonboy
 */
public class User_courses extends Parent {
    private int user_id;
    private int course_id;
    private int ID;
    private Date Datetime;

    @Override
    public int getID(){
        return this.ID;
    }
    
      @Override
    public String getType(){
        return "user_has_course";
    }
    
    @Override
    public int getTypeIndex(){
        return 8;
    }
    
    public User_courses(){}
    
    public User_courses(int id) throws Exception{
        ID = id;
        DataBase db = new DataBase(this);
        ResultSet rs = db.Find();
                    rs.next();
                    this.user_id = rs.getInt("user");
                    this.course_id = rs.getInt("course");
                    this.Datetime = rs.getDate("user_has_course_datetime");
    }
    
    public int getUser_id() {
        return user_id;
    }

    public int getCourse_id() {
        return course_id;
    }
    
    public Course getCourse() throws Exception {
        return new Course(course_id);
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    /*public void setID(int ID) {
        this.ID = ID;
    }*/
    
    public boolean Write() throws Exception
    {
        return this.write();
    }

    @Override
    public boolean MayChange() {
        return false;
    }
    
}
