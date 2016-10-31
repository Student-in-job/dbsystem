package controll;

import Model.Accept;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CheckTask extends HttpServlet {

    private void Proc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String answer = request.getParameter("answer");
            Accept accept = (Accept) request.getSession().getAttribute("accept");
            if(accept==null){
                response.sendRedirect("NextTask");
                return;
            } else {
                if(accept.putAnswer(answer)){
                    if(accept.getResult()==1){
                        accept.Write();
                        response.sendRedirect("NextTask");
                        return;
                    } else {
                        request.setAttribute("rs", accept.getResultArray());
                    }
                } else {
                    request.setAttribute("error", accept.getException().getMessage());
                }
                request.setAttribute("task", accept.getTask());
            }
        } catch(Exception ex){
            throw new ServletException(ex);
                }
            
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.Proc(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.Proc(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
