/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import DAO.DBConnect;
import Entety.Course;
import Entety.Study;
import Entety.Task;
import Entety.Work;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class TaskService {
    
    
    private boolean canStart(Course course, Task task){
        Calendar now = Calendar.getInstance();
        Calendar time = Calendar.getInstance();
        time.setTime(course.getStartDate());
        time.set(Calendar.HOUR_OF_DAY, task.getStartTime());
        time.add(Calendar.DAY_OF_YEAR, task.getDay()-1);
        time.set(Calendar.MINUTE, 0);
        time.set(Calendar.SECOND, 0);
        time.set(Calendar.MILLISECOND, 0);
        time.add(Calendar.MINUTE, task.getTime());
        
        int now_day = now.get(Calendar.DAY_OF_YEAR);
        int time_day = time.get(Calendar.DAY_OF_YEAR);
        if(now_day!=time_day)
            return false;
        
        int now_hour = now.get(Calendar.HOUR_OF_DAY);
        if(now_hour<task.getStartTime())
            return false;
        
        time.set(Calendar.DAY_OF_YEAR, now_day);
        if(now.after(time))
            return false;           
           
        return true;
    }
    
    private boolean userCanStart(Study study, Task task){
                
        if(study.getCourse().getId() != task.getCourse().getId())
          return false;  
        
            return true;
    }
    
    private Work getWork(Study study, Task task) throws NamingException, SQLException, Exception{
        
        Work w = null;
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from work where study = ? and task = ? and date(now()) = date(addDate)");
            stmt.setInt(1, study.getId());
            stmt.setInt(2, task.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                HashMap<String, Object> Params = new HashMap<String, Object>();
                for (int i = 1; i < rs.getMetaData().getColumnCount() + 1; i++) {
                    Params.put(rs.getMetaData().getColumnName(i), rs.getObject(i));
                }
                w = new Work();
                w.getFromParam(Params);
                w.ReadTaskFromDB();
                w.ReadTeachingFromDB();
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return w;
        
    }

    public boolean canStart(Study study, Task task) throws SQLException, Exception {
        if(userCanStart(study, task) && canStart(study.getCourse(), task)){
            Work work = getWork(study, task);
            if(work == null)
                return true;
            else return !work.isCompleated();
        } else return false;

    }

    public Work createWork(Study study, Task task) throws Exception {
        if(canStart(study, task)){
            Work work = getWork(study, task);
            if(work==null){
                work = new Work();
                work.setStudy(study.getId());
                work.setTask(task.getId());
                if(!work.Write())
                    return null;
            }
            return work;
        }
        return null;
    }
    
    
}
