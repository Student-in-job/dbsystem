<%-- 
    Document   : CreateProgram
    Created on : 08.07.2016, 15:12:56
    Author     : ksinn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/checkUser.jsp" %>
<%! String pageTitle = "Program";%>
<%@include file="/header.jsp"%>
<%@include file="/bar.jsp"%>
        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST" enctype="multipart/form-data">
                    <h3 class="text-centered">Program</h3>
                    <input type="hidden" name="id" value="${program.id}">
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" required type="text" name="name" value="${program.name}">
                    </div>                    
                                        
                    <div class="form-item">
                        <label>Description:</label>
                        <textarea rows="6" required  name="discription">${program.description}</textarea>
                    </div> 
                    
                    <div class="form-item">
                        <label>Duration:</label>
                        поставить условие длительности
                        <input class="width-100" required type="number" name="duration" min="1" value="${program.duration}"> days.
                    </div>
                    
                    <div class="form-item">
                        <label>Picture:</label>
                        <input class="width-100" type="file" name="picture" >
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
                            maxlength: 128,
                        },
                        
                        discription:{
                            required: true,
                            maxlength: 4096,
                        },
                        
                        duration:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 183
                        },
                        
                picture:{
                            accept: "png|jpg|jpeg",
                        }                       
                   },

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>