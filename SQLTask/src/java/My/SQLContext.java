/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import Struct.Context;
import Struct.ListFactory;
import Struct.TaskFactory;

/**
 *
 * @author ksinn
 */
public class SQLContext implements Context {

    @Override
    public ListFactory getListFactory() {
        return new SQLListFactory();
    }

    @Override
    public TaskFactory getTaskFactory() {
        return new SQLTaskFactory();        
    }

}
