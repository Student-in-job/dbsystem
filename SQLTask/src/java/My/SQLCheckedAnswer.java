/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import TasKer.Exam.Impl.SimpleCheckedAnswer;
import TasKer.Exam.Answer;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author ksinn
 */
public class SQLCheckedAnswer extends SimpleCheckedAnswer{

    private SQLException exception;
    private ArrayList resultArray;

    public SQLCheckedAnswer(boolean accept, Answer answer) {
        super(accept, answer);
    }
    
    public boolean hasException(){
        return exception!=null;
    }
    
    public boolean hasResultArray(){
        return resultArray!=null;
    }
    
    public SQLException getException(){
        return this.exception;
    }
    
    public ArrayList getResultArray(){
        return this.resultArray;
    }
        
    
    public void setException(SQLException ex){
        this.exception = ex;
    }
    
    public void setResultArray(ArrayList resultArray){
        this.resultArray = resultArray;
    } 
   
}
