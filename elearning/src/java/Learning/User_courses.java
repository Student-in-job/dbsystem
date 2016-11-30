/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import Staff.DataBase;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author javlonboy
 */
public class User_courses extends Parent {
    private User user;
    private Course course;
    private Date Datetime;

    @Override
    public int getID(){
        return this.ID;
    }
    
      @Override
    public String _getType(){
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
                    if(rs.getDate("user_has_course_complited")!=null) throw new IllegalAction();
                    this.user = new User(rs.getInt("user"));
                    this.course = new Course(rs.getInt("course"));
                    this.Datetime = rs.getDate("user_has_course_datetime");
    }
    
    public boolean Finish() throws Exception{
        DataBase db = new DataBase(this);
        db.ReWrite();
        return db.Done();
    }
    
    public int getUser_id() {
        return user.getID();
    }

    public int getCourse_id() {
        return course.getID();
    }
    
    public Course getCourse(){
        return course;
    }
    
    public User getUser(){
        return user;
    }

    public void setUser(User us) {
        this.user = us;
    }

    public void setCourse(Course cours) {
        this.course = cours;
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
