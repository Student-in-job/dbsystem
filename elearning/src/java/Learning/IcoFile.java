/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import DataBasePak.*;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class IcoFile{
    
    
    protected Parent Owener;
    protected Part Part;
    protected final String Path = db.getRealPath()+db.getFileDir();
    
    
    

    public boolean CorrectExtension(){
        String Extension = extractFileExtension(this.extractFileName(Part));
        return "png".equals(Extension);
              
    }
    
    public IcoFile(Part part, Parent owner){
        Part = part;
        Owener = owner;
    }
    
    protected boolean SaveFile() throws IOException{
        
        String path = Path + Owener.getType() + File.separator;
        new File(path).mkdirs();
        path += Owener.getID()+".png";
        BufferedImage img = ImageIO.read(Part.getInputStream());
        
        int x, y, X, Y;
        float k = 266/164;
        X = img.getWidth();
        Y = img.getHeight();
        if(Y>X*k) {x=X; y = (int) (X*k);}
        else {y = Y; x=(int) (y/k);}
        img = img.getSubimage( 0, 0, x, y);
        
        BufferedImage img_litl = new BufferedImage(266, 164, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = img_litl.createGraphics();
        g.drawImage(img, 0, 0, 266, 164, null);
        g.dispose();
        ImageIO.write(img_litl, "png", new File(path));
        return new File(path).exists();
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=")+2, s.length()-1);
            }
        }
        return "";
    }
    
    private String extractFileExtension(String name) {
        
        String s = name;
        if(s.contains(".")){
            while(s.contains(".")){
                s = s.substring(s.indexOf(".")+1, s.length());
            }
            return s;
        }
        else return "";
    }
      

}
