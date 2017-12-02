/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Task;

import API.WorkSWT;
import Controller.HttpServletParent;
import Entety.Service;
import Entety.Task;
import Entety.Study;
import Entety.Work;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class StartWork extends HttpServletParent {

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String myURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        
        int idTask = Integer.parseInt(request.getParameter("t"));
        Task task = new Task();
        task.getById(idTask);

        int studyId = Integer.parseInt(request.getParameter("s"));
        Study study = new Study();
        study.getById(studyId);
        
        if (taskService.canStart(study, task)) {
            Work work = taskService.createWork(study, task);
            if (work != null) {
                if (!work.isCompleated()) {
                    Service service = new Service();
                    service.getById(task.getServiceId());
                    WorkSWT wt = new WorkSWT(service.getMyKey());                    
                    wt.putData(work, myURL,  task.getService().getWorkStartPointURL(), new Date().getTime() + 5 * 60 * 1000);
                    response.setHeader("Location", task.getService().getWorkStartPointURL()+"?" + wt.getURLParam());
                    response.setHeader("Cache-Control", "no-store");
                    response.setStatus(301);
                } else {
                    request.setAttribute("message", "You already do this task today!");
                    request.getRequestDispatcher("/Message.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Error!");
                request.getRequestDispatcher("/Message.jsp").forward(request, response);
            }
        } else {
                request.setAttribute("message", "You cannot start this component!");
                request.getRequestDispatcher("/Message.jsp").forward(request, response);
            }

    }

}
