// object declaration
RMIConnector rmi = new RMIConnector();

// sql execution - get result and stores in two dimensional of ArrayList
// param 1: server host - STRING
// param 2: rmi port number - INTEGER
// param 3: query - STRING
// example query
String sql = "SELECT * FROM EHR_Central";
ArrayList<ArrayList<String>> data = rmi.getQuerySQL("10.73.32.200", 1099, sql);

// sql execution - execute query and stores result in boolean
// TRUE = success
// FALSE = failed
// param 1: server host - STRING
// param 2: rmi port number - INTEGER
// param 3: query - STRING
// example query
String sql = "CREATE TABLE tableA(column1 INT, column2 VARCHAR(200))";
boolean status = rmi.setQuerySQL("10.73.32.200", 1099, sql);