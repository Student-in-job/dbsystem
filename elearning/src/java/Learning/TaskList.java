/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author ksinn
 */
public class TaskList {
    protected ArrayDeque<Task> Tasks;
    protected User_courses UserCourse;
    
    public TaskList(User_courses user_course, Program prog, int lengh){
        Tasks = new ArrayDeque<Task>();
        UserCourse = user_course;
        ArrayList<Task> tasks = prog.getTasks();
        Random rand = new Random();
        for(int i=0; i<lengh; i++)
            Tasks.add(tasks.get(rand.nextInt(tasks.size()-1)));
    }
    
    public AcceptTask NextAccept() throws Exception{
        if(Tasks.isEmpty()) return null;
        else return new AcceptTask(UserCourse, Tasks.poll());
    }
    
}
