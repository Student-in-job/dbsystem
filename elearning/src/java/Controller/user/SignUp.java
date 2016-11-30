
package Controller.user;

import Controller.HttpServletParent;
import Learning.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class SignUp extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
                request.getRequestDispatcher("UserDataForm.jsp").forward(request, response);
            
        
    }


    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
                    String name = null;
                    String surname = null;
                    String mail = null;
                    String gender = null;

                    name = request.getParameter("name");
                    surname = request.getParameter("surname");
                    mail = request.getParameter("mail").toLowerCase();
                    gender = request.getParameter("gender");

                    User nuser = new User();

                    nuser.setMail(mail);
                    nuser.setSurname(surname);
                    nuser.setGender(gender);
                    nuser.setName(name);

                    if(nuser.Register()){
                        nuser.SaveIco(request.getPart("picture"));
                        request.setAttribute("message", "You registred!");
                        request.getRequestDispatcher("/Message.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "Error!");
                        request.setAttribute("user", nuser);
                        request.getRequestDispatcher("UserDataForm.jsp").forward(request, response);
                    }

        }
        


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForUnAuthorized;
    }

}
