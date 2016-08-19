/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBasePak;

/**
 *
 * @author ksinn
 */
public class ObjectNotFind extends Exception{
    
    @Override
    public String getMessage(){
       return "Object not find!"; 
    }
}
