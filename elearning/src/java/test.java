
import DataBase.Log;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;



/*@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB*/
 
public class test extends HttpServlet {	

	 private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
        private static final String SAVE_DIR = "uploadFiles"; 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            
           /* try{
               Part part = request.getPart("data");
               String fileName = "/home/ksinn/NetBeansProjects/dbsystem/uploadFiles/"+UUID.randomUUID()+extractFileName(part);
               part.write(fileName);
        }
                }
                catch (Exception ex)
                {
                    Log.getOut(ex.getMessage());
}

            */
	}
}