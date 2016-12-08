/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Rederect;

import API.AppInf;
import API.UserSWT;
import Controller.HttpServletParent;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Task extends HttpServletParent {

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserSWT wt = new UserSWT();
        wt.putData(user, AppInf.main, AppInf.task+"/Auth", System.currentTimeMillis() + 5*60*1000);
        response.setHeader("Location", AppInf.task+"/Auth?"+wt.getURLParam());
        response.setHeader("Cache-Control", "no-store");
        response.setStatus(301);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
