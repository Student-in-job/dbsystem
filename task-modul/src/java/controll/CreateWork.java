package controll;


import API.AppInf;
import API.HTTPClient;
import API.WorkJWT;
import API.WorkSWT;
import Model.Work;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateWork extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Work work = new Work();
        WorkSWT wt = new WorkSWT();
        if(wt.getDataFromRequest(request.getParameterMap(), work)){
            int user_id = work.getUser();
            request.getSession().setAttribute("user_id", user_id);
            try {
                
                if(work.isExistKey()){
                    request.getSession().setAttribute("work_id", work.getId());
                    response.sendRedirect("NextTask");
                    return;
                } else {
                    String WORK_KEY = request.getParameter("work_key");
                    HTTPClient client = new HTTPClient(request.getParameter("Issuer")+"/api/work_data", "work_key="+request.getParameter("work_key"), "POST");
                    client.sendRequest();

                    WorkJWT tok = new WorkJWT();
                    if(tok.getData(client.getRequestText(), work, AppInf.main)){

                        if(user_id == work.getUser()){
                            if(work.Write()){
                                request.getSession().setAttribute("work_id", work.getId());
                                response.sendRedirect("NextTask");
                                return;
                            } else {
                                throw new Exception();
                            }
                        }
                    } else {
                        throw new ServletException("You are not owner this work");
                    }
                }
                
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
        
        } else {
            throw new ServletException("Uncorect link");
        }
        //request.setAttribute("WORK_KEY", request.getParameter("work_key"));
        //request.getRequestDispatcher("StartWork.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
