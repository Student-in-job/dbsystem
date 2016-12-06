/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.task;

import API.AppInf;
import API.WorkSWT;
import Controller.HttpServletParent;
import Model.AcceptTask;
import Model.Teaching;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class StartTask extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Model.Task task = new Model.Task();
        
        task.getById(id);
        Teaching teach = user.getTeaching(task.getProgram());
        if(teach!=null){
            request.setAttribute("task", task);
            Calendar start = Calendar.getInstance();
            start.setTime(teach.getCourse().getStartDate());
            start.add(Calendar.DAY_OF_YEAR, task.getDay());
            request.setAttribute("startday", new java.sql.Date(start.getTimeInMillis()));
            if(task.canStartNow(teach.getCourse()))
                request.setAttribute("start", true);
            request.getRequestDispatcher("StartTask.jsp").forward(request, response);
        } else {
            throw new Exception("You cannot");
        }
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Model.Task task = new Model.Task();
        
        task.getById(id);
        Teaching teach = user.getTeaching(task.getProgram());
        if(teach!=null){
            AcceptTask accept = user.getAcceptTask(task);
            if(accept!=null) {
                if(accept.getCompleted()==-1){
                    WorkSWT wt = new WorkSWT();
                    wt.putData(accept, AppInf.main, AppInf.task+"/pass/Start", new Date().getTime() + 5*60*1000);
                    //response.setHeader("Location", AppInf.task + "/pass/Start?"+wt.getURLParam());
                    response.setStatus(301);
                } else {
                    throw new Exception("You cannot today");
                }
            } else {
                throw new Exception("You cannot");
            }
     
        }
    
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
