
import DataBase.Log;
import Learning.Area;
import Learning.Program;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

 
public class test extends HttpServlet {	

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            
             ServletContext s = request.getServletContext();
             String ss = s.getRealPath("index.jsp");
	}
        
        
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            
    try {
        PrintWriter out = response.getWriter();
        Area area = new Area(1);
        out.println(area.getID() + area.getName());
        out.println("/n");
        ArrayList<Program> er = area.getPrograms();
        for(int i=0; i<er.size(); i++)
            out.println(er.get(i).getID() + er.get(i).getName()+"\n");
    } catch (Exception ex) {
        Log.getOut(ex.getMessage());
    }
            
	}
}