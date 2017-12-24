/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import DAO.DBConnect;
import Entety.Course;
import Entety.Study;
import Entety.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

/**
 *
 * @author ksinn
 */
public class CourseService {

    public CourseService() {

    }

    public Course startCourse(Course course, User user) throws Exception {

        if (course.getUser().getId() == user.getId()) {
            course.setStatus(1);
            if (course.Update()) {
                return course;
            } else {
                return null;
            }
        }
        return null;
    }

    /**
     * 
     * @param tuter
     * @param course
     * @param user
     * @return
     * @throws Exception 
     */
    public Study joinToCourse(User tuter, Course course, User user) throws Exception {
        Study s = null;
        if (course.canAddToCourse(tuter, user)) {
            s = new Study();
            s.setCourse(course.getId());
            s.setUser(user.getId());
            if (!s.Write()) {
                s = null;
            }
        }
        return s;
    }

    /**
     * 
     * @param course
     * @param user
     * @return
     * @throws Exception 
     */
    public Study joinToCourse(Course course, User user) throws Exception {

        Study s = null;
        if (course.canStart(user)) {
            s = new Study();
            s.setCourse(course.getId());
            s.setUser(user.getId());
            if (!s.Write()) {
                s = null;
            }
        }
        return s;
    }

    /**
     * 
     * @param course
     * @param user
     * @return
     * @throws Exception 
     */
    public Study getStudy(Course course, User user) throws Exception {
        Study s = null;
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from (users join study on users = users.id) join course on course = course.id where course.id=? and users.id=? and completed = 0 and closed = 0");
            stmt.setInt(1, course.getId());
            stmt.setInt(2, user.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                HashMap<String, Object> Params = new HashMap<String, Object>();
                for (int i = 1; i < rs.getMetaData().getColumnCount() + 1; i++) {
                    Params.put(rs.getMetaData().getColumnName(i), rs.getObject(i));
                }
                s = new Study();
                s.getFromParam(Params);
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return s;

        /*Study s = new Study();        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("course", course.getId());
        param.put("user", user.getId());
        param.put("completed", 0);
        ArrayList<HashMap<String, Object>> Params;
        try {
            Params = s.getObjectsParam(param);
            for(int i=0; i<Params.size(); i++){
                task = new Task();
                try{
                    task.getFromParam(Params.get(i));
                    list.add(task);
                } catch (Exception ex) {
                    
                }
            }
        } catch (Exception ex) {
            
        }
        
        return s;*/
    }

    /**
     * 
     * @param course
     * @param user
     * @return
     * @throws Exception 
     */
    public boolean isLearnCourse(Course course, User user) throws Exception {
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from (users join study on users = users.id) join course on course = course.id where course.id=? and users.id=? and completed = 0 and closed = 0");
            stmt.setInt(1, course.getId());
            stmt.setInt(2, user.getId());
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

    }
}
