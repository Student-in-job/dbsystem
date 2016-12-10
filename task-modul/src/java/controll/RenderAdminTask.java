/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import Model.StudentConnect;
import Model.Task;
import java.util.ArrayList;
import javax.servlet.ServletException;
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
                ArrayList resultArray;
                try{
                    conn = new StudentConnect();
                    conn.exequtQuery(new_task.getAnswer());
                    resultArray = conn.getResultArray();
                } finally {
                    if(conn!=null)
                        conn.close();
                }
            

            if(user_id==new_task.getGroup().getOwner()){
                request.setAttribute("task", new_task);
                request.setAttribute("rs", resultArray);
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
