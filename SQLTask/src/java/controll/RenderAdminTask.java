/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import Model.Result;
import Model.StudentConnect;
import Model.Task;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class RenderAdminTask extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int task;
        Task new_task = new Task();

        StudentConnect conn = null;
        task = Integer.parseInt(request.getParameter("task"));
        new_task.getById(task);

        if (user_id == new_task.getList().getUser()) {
            ArrayList resultArray;
            Exception exp;
            try {
                conn = new StudentConnect(new_task.getList().getShema());
                conn.exequtQuery(new_task.getAnswer());
                resultArray = conn.getResultArray();
                exp = conn.getException();
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
            request.setAttribute("task", new_task);
            request.setAttribute("rs", resultArray);
            request.setAttribute("er", exp);
            request.getRequestDispatcher("Task.jsp").forward(request, response);
            return;
        } else {
            request.setAttribute("message", "You cannot see this page!");
            request.getRequestDispatcher("/Message.jsp").forward(request, response);
        }

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int task;
        Task new_task = new Task();

        StudentConnect conn = null;
        task = Integer.parseInt(request.getParameter("task"));
        new_task.getById(task);

        if (user_id == new_task.getList().getUser()) {
            ArrayList resultArray;
            Exception exp;
            try {
                conn = new StudentConnect(new_task.getList().getShema());
                conn.exequtQuery(new_task.getAnswer());
                resultArray = conn.getResultArray();
                exp = conn.getException();
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }

            ArrayList testArray = new ArrayList();
            String testExp = null;
            if (exp == null) {
                Result accept = new Result();
                accept.setTask(new_task);
                
                if (accept.putAnswer(request.getParameter("answer"))) {
                    testArray = accept.getResultArray();
                    if(accept.getResult()==1)
                        testExp = "Right answer";
                } else {
                    testExp = accept.getException().getMessage();
                }
                
            }
            
            request.setAttribute("task", new_task);
            request.setAttribute("rs", resultArray);
            request.setAttribute("er", exp);
            request.setAttribute("testArray", testArray);
            request.setAttribute("testExp", testExp);
            request.getRequestDispatcher("Task.jsp").forward(request, response);
            return;
        } else {
            request.setAttribute("message", "You cannot see this page!");
            request.getRequestDispatcher("/Message.jsp").forward(request, response);
        }

    }

}
