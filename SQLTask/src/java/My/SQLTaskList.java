/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import TasKer.Tasks.Impl.ListEntety;
import java.util.HashMap;


/**
 *
 * @author ksinn
 */
public class SQLTaskList extends ListEntety{
    
    private String schema;

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> _getParams = super._getParams();
        _getParams.put("sql_schema", this.schema);
        return _getParams;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        super._setParams(list);
        this.schema = (String) list.get("sql_schema");
    }

    @Override
    protected boolean _isCorrect() {
        return super._isCorrect()&&this.schema!=null&&!this.schema.isEmpty();
    }
    
    public SQLTaskList(){
    }
    
    public String getSchema(){
        return this.schema;
    }
    
    public void setSchema(String schema){
        this.schema = schema;
    }
    
    
}
