<%-- 
    Document   : CreateProgram
    Created on : 08.07.2016, 15:12:56
    Author     : ksinn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Program :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="CreateProgram.jsp" method="POST" enctype="multipart/form-data">
                    <h3 class="text-centered">Program</h3>
                    <input type="hidden" name="program" value="<%=program%>">
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" required type="text" name="name" value="<%=name!=null?name:""%>">
                    </div>
                    <div class="form-item">
                        <label>Area:</label>
                        <select required name="area" >
<%
ArrayList<Area> arealist = (new Area()).getAll();
for(int i=0; i<arealist.size(); i++){
%>
                            <option value="<%=arealist.get(i).getId()%>" <%=area==arealist.get(i).getId()?"selected":""%>><%=arealist.get(i).getName()%></option>
<%}%>
                        </select>
                    </div>
                    <div class="form-item">
                        <label>Inventory:</label>
                        <textarea rows="6" required  name="inventory"><%=inventory!=null?inventory:""%></textarea>
                    </div>
                    
<%--                    <div class="form-item">
                        <label>Type:</label>
                        <select required required name="typ" >
                            <option <%="Seminar".equals(typ)?"selected":""%> value="Seminar">Seminar</option>
                            <option <%="Mini".equals(typ)?"selected":""%> value="Mini">Mini</option>
                            <option <%="Standard".equals(typ)?"selected":""%> value="Standard">Standard</option>
                        </select>
                    </div> 
--%>                        
                    <div class="form-item">
                        <label>Level:</label>
                        <label>Какой уровень будет после прохождения курса</label>
                        <input class="width-100" id="level" required type="number" min="1" max="3" name="level" value="<%=level!=0?level:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Min - Levet:</label>
                        <label>Какого уровня курс надо прайти, для зачисления</label>
                        <input class="width-100" required type="number" min="0" max="2" name="minlevel" value="<%=minlevel!=-1?minlevel:"0"%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Duration:</label>
                        поставить условие длительности
                        <input class="width-100" required type="number" name="duration" min="1" value="<%=duration!=0?duration:""%>"> days.
                    </div>
                    
                    <div class="form-item">
                        <label>Picture:</label>
                        <input class="width-100" <%=program==0?"required":""%> type="file" name="picture" >
                    </div>  
                    
		    <div class="form-item">        
                    	<button class="button primary width-100 big">Complete</button>
                    </div>  
                </form>
            </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
<script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        name:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 3000,
                        },
                        
                        level:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 3,
                        },
                        
                        minlevel:{
                            required: true,
                            number: true,
                            min: 0,
                            max: 2,
                        },
                        
                        duration:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 183
                        },
                        
<%if(program==0){%>     picture:{
                            <%=program==0?"required:true,":""%>
                            accept: "png|jpg|jpeg",
                        }
<%}%>                        
                   },

                });


            }); //end of ready
        </script>
        <%@include file="../footer.jsp" %>
    </body>
</html>
