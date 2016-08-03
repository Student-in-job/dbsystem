Statement stmt = null;   
ResultSet rs = null;   


stmt = conn.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY, java.sql.ResultSet.CONCUR_UPDATABLE);    //    // Issue the DDL queries for the table for this example    //    

stmt.executeUpdate("DROP TABLE IF EXISTS autoIncTutorial");    
stmt.executeUpdate(            "CREATE TABLE autoIncTutorial ("            + "priKey INT NOT NULL AUTO_INCREMENT, "            + "dataField VARCHAR(64), PRIMARY KEY (priKey))");    //    // Insert one row that will generate an AUTO INCREMENT    // key in the 'priKey' field    //    
stmt.executeUpdate(            "INSERT INTO autoIncTutorial (dataField) "            + "values ('Can I Get the Auto Increment Field?')",            Statement.RETURN_GENERATED_KEYS);    //    // Example of using Statement.getGeneratedKeys()    // to retrieve the value of an auto-increment    // value    //    i
nt autoIncKeyFromApi = -1;    rs = stmt.getGeneratedKeys();    
if (rs.next()) {        autoIncKeyFromApi = rs.getInt(1);    } 
else {        // throw an exception from here    
}    
rs.close();    
rs = null;    
System.out.println("Key returned from getGeneratedKeys():"        + autoIncKeyFromApi);} 
