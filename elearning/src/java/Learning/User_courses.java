/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

/**
 *
 * @author javlonboy
 */
public class User_courses extends Parent {
    private int user_id;
    private int course_id;
    private int ID;

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
    
    
    public int getUser_id() {
        return user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
    
    public String Write() throws Exception
    {
        return this.write();
    }
    
}
