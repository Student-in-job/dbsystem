<%-- 
    Document   : patients
    Created on : 08.12.2016, 17:23:40
    Author     : ksinn
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getMethod().equals("POST")){
        request.setCharacterEncoding("UTF-8");
        int patient_count = Integer.parseInt(request.getParameter("patient_count"));
        int doctor_count = Integer.parseInt(request.getParameter("doctor_count"));
        
        DateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Random ran = new Random();
        Calendar time = Calendar.getInstance();
        
        int j=1;
        
        for(int i=1; i<=doctor_count; i++){
            time.set(Calendar.YEAR, 2016);
            time.set(Calendar.MONTH, 6);
            time.set(Calendar.DAY_OF_MONTH, 1);
            time.set(Calendar.HOUR_OF_DAY, 9);
            time.set(Calendar.MINUTE, 0);
            time.set(Calendar.SECOND, 0);
            while(time.get(Calendar.YEAR)<2017){
                while(time.get(Calendar.HOUR_OF_DAY)<17){
                        j+=ran.nextInt(5);
                        if(j>patient_count)
                            j=1;
                        String query = "insert into appointments(doctor, patient, come, time) value ("
                                + String.valueOf(i)+", "
                                + String.valueOf(j)+", "
                                + String.valueOf(ran.nextInt(2))+", "
                                + "'"+form.format(time.getTime())+"' "
                                + ");<br>";
                        out.print(query);
                        time.add(Calendar.MINUTE, 30*(ran.nextInt(15)+1));      
                }
                time.add(Calendar.DAY_OF_YEAR, ran.nextInt(15)+1);
                time.set(Calendar.HOUR_OF_DAY, 9);
            }
        }
    
} else {%>
<form method = "post" action ="">
    doctor_count <input name="doctor_count"><br>
    patient_count <input name="patient_count"><br>
    count <input name="count"><br>
    <input type="submit"><br>
</form>
<%}%>
