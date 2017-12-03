/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Struct;

import Struct.d.Checker;
import Struct.d.ExamTasksGenerator;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public interface TasKer {

    static String getInitParam(String name) throws NamingException {
        InitialContext initContext;
        initContext = new InitialContext();
        String param = (String) initContext.lookup("java:comp/env/cntxt/"+name);
        return param;
    }

    static TaskFactory getTaskFactory() throws ClassNotFoundException, NamingException, InstantiationException, IllegalAccessException {
        
        Class forName = Class.forName(getInitParam("taskFactory"));
        return (TaskFactory) forName.newInstance();
        
    }
    
    static ListFactory getListFactory() throws ClassNotFoundException, NamingException, InstantiationException, IllegalAccessException {
        
        Class forName = Class.forName(getInitParam("listFactory"));
        return (ListFactory) forName.newInstance();
        
    }
    
    static Checker getChecker() throws ClassNotFoundException, NamingException, InstantiationException, IllegalAccessException {
        
        Class forName = Class.forName(getInitParam("checker"));
        return (Checker) forName.newInstance();
        
    }
    
    static ExamTasksGenerator getExamTasksGenerator() throws ClassNotFoundException, NamingException, InstantiationException, IllegalAccessException {
        
        Class forName = Class.forName(getInitParam("examTasksGenerator"));
        return (ExamTasksGenerator) forName.newInstance();
        
    }

}
