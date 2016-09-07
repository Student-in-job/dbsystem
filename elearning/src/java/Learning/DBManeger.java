/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Learning;

import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ksinn
 */
public class DBManeger {
    
    private int TypeQuery; 
            /*alter 1, select 2, create 3, delete 4, drop 5, index 6, update 7*/
    private String Query;
    private Exception Ex;
    private ResultSet Rs;
    
    public DBManeger(String query, Program prog){
        Query = query.toLowerCase();
        this.setType();
        this.RewriteQuery(prog.getID());
    }

    private void setType() {
        
    }

    private void RewriteQuery(int pref) {
        StringBuffer sb = new StringBuffer(Query);
        Pattern p = Pattern.compile("(create)|(alter) [a-z|0-9]* table []*", Pattern.CASE_INSENSITIVE);
        Matcher matcher = p.matcher(Query);
        if(matcher.find()){
            Pattern p1 = Pattern.compile("table[ ]+", Pattern.CASE_INSENSITIVE);
            Matcher matcher1 = p.matcher(Query);
            Query = matcher1.replaceAll("table "+String.valueOf(pref)+"_");
        }
    }

    private void to() {
        Query = Query.toLowerCase();
    }
    
}
