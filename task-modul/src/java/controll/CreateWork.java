package controll;

import Model.Work;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateWork extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //проверка ключа и получение user_id
        request.setAttribute("WORK_KEY", request.getParameter("work_key"));
        request.getRequestDispatcher("StartWork.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //обращение за данными
            String WORK_KEY = request.getParameter("work_key");
            int user_id = 123;
            int group_id = 1;
            Date times = new Date();
            String mods = "rand";
            int count = 0;
            
            Work work = new Work();
            work.setCount(count);
            work.setGroup(group_id);
            work.setMods(mods);
            work.setTime(times);
            work.setUser(user_id);
            if(work.Write(WORK_KEY)){
                if(work.Start()){
                    request.getSession().setAttribute("work", work);
                    response.sendRedirect("DoTask");
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
        
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
