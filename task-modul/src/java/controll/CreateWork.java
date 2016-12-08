package controll;


import API.AppInf;
import API.HTTPClient;
import API.WorkJWT;
import API.WorkSWT;
import Model.User;
import Model.Work;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateWork extends MyServlet {


    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Work work = new Work();
        WorkSWT wt = new WorkSWT();
        if(wt.getDataFromRequest(request.getParameterMap(), work)){
            user_id = work.getUser();
            request.getSession().setAttribute("user_id", user_id);
            User user = new User();
            user.setId(user_id);
            if(user.getUserData())
                request.getSession().setAttribute("user", user);
            
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
 
        } else {
            throw new Exception("Uncorect link");
        }
        //request.setAttribute("WORK_KEY", request.getParameter("work_key"));
        //request.getRequestDispatcher("StartWork.jsp").forward(request, response);
    }

    
    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
    }

    
    @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;
    }

}
