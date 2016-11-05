package controll;


import API.AppInf;
import API.HTTPClient;
import API.WorkJWT;
import API.WorkSWT;
import Model.Work;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;


public class CreateWork extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Work work = new Work();
        WorkSWT wt = new WorkSWT();
        wt.setID(Integer.parseInt(request.getParameter("id")));
        wt.setKey(request.getParameter("work_key"));
        wt.setAudience(request.getParameter("Audience"));
        wt.setExpiresOn(Integer.parseInt(request.getParameter("ExpiresOn")));
        wt.setIssuer(request.getParameter("Issuer"));
        wt.setSign(request.getParameter("HMACSHA256"));
        if(wt.CheckSign()){
            request.getSession().setAttribute("user_id", Integer.parseInt(request.getParameter("id")));
            int user_id = Integer.parseInt(request.getParameter("id"));
            try {
                String WORK_KEY = request.getParameter("work_key");
                HTTPClient client = new HTTPClient(AppInf.main+"/api/work_data", "work_key="+request.getParameter("work_key"), "GET");
                client.sendRequest();
                
                WorkJWT tok = new WorkJWT();
                tok.getData(client.getRequestText(), work);
                
                if(UUID.fromString(WORK_KEY).equals(work.getKey())){
                    if(work.Write()){
                        request.getSession().setAttribute("work_id", work.getId());
                        response.sendRedirect("NextTask");
                    } else {
                        throw new Exception();
                    }
                }
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
        
        } else {
            
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
