<%-- 
    Document   : s1
    Created on : 23.07.2012, 15:36:31
    Author     : r.khamidullin
--%>

<%@page import="org.jfree.chart.renderer.xy.XYStepAreaRenderer"%>
<%@page import="org.jfree.chart.renderer.xy.XYShapeRenderer"%>
<%@page import="org.jfree.chart.renderer.xy.XYBarRenderer"%>
<%@page import="org.jfree.chart.renderer.xy.XYDotRenderer"%>
<%@page import="org.jfree.chart.renderer.xy.XYItemRenderer"%>
<%@page import="org.jfree.chart.plot.XYPlot"%>
<%@page import="org.jfree.data.time.TimeSeriesCollection"%>
<%@page import="org.jfree.data.time.TimeSeries"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>

<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="image/png" pageEncoding="UTF-8"%> 
<%

    Connection conn = null;
    try {

        Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (Exception ex) {
    }
    try {
        conn
                = DriverManager.getConnection("jdbc:mysql://localhost:3306/xxx?"
                        + "user=xxxz");

    } catch (SQLException ex) {

        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());

    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    PreparedStatement statement = null;
    ResultSet resultSet = null;

    statement = conn.prepareStatement("SELECT * FROM XXX where CURRENT_TIMESTAMP - ddatetime < 12000 and XXX is not null and XXX < 100000");
    resultSet = statement.executeQuery();
    TimeSeries s1;
    s1 = new TimeSeries("Delays, sec");

    TimeSeriesCollection dataset = new TimeSeriesCollection();
    dataset.addSeries(s1);
    while (resultSet.next()) {
        s1.addOrUpdate(org.jfree.data.time.Second.parseSecond(resultSet.getString("ddatetime").substring(0, 19)), resultSet.getInt("XXX"));

    }

    JFreeChart mychart = ChartFactory.createTimeSeriesChart("Delays", "T, sec", "DateTime", dataset, true, true, true);

    XYPlot plot = (XYPlot) mychart.getPlot(); // график
    //plot.setRenderer(new XYDotRenderer()); // точки
    plot.setRenderer(new XYBarRenderer()); //столбики
    //plot.setRenderer(new XYShapeRenderer() ); // кружки - shapes
    //plot.setRenderer(new XYStepAreaRenderer() );
    ChartUtilities.writeChartAsPNG(response.getOutputStream(), mychart, 800, 200);
    out.close();
    statement.close();

%>  