/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBasePak;

import java.sql.SQLException;

/**
 *
 * @author ksinn
 */
public class InvalidQuery extends SQLException{
    protected String Message;
    
    
    public InvalidQuery(Exception e){
        Message = e.getMessage();
    }
    
    @Override
    public String getMessage(){
        return Message;
    }
    
}
