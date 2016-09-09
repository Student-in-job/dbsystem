<%-- 
    Document   : CreateTestTask
    Created on : 13.07.2016, 18:49:09
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../logfrag.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    int test = 0;
    Test tst;
    try{
        test = Integer.parseInt(request.getParameter("test"));
        tst = new Test(test);
        
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    if(user.getID()!=tst.getProgram().getTeacherID()) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}       
    
    String question=null, answer=null, v1=null, v2=null, v3=null, v4=null;
    int point=0, testtask;
    TestTask nt;
    testtask = Integer.parseInt(request.getParameter("testtask")==null?"0":request.getParameter("testtask"));
    
if(request.getMethod().equals("GET")){
    if(0!=testtask){
        
        try{
            nt = new TestTask(testtask);
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
        question=nt.getQuestion();
        answer=nt.getAnswer();
        v1=nt.getVariant1();
        v2=nt.getVariant2();
        v3=nt.getVariant3();
        v4=nt.getVariant4();
        point=nt.getPoint();
        tst = nt.getTest();
    }
}    
    
if(request.getMethod().equals("POST")){
    
    
    question=request.getParameter("question");
    answer=request.getParameter("answer");
    v1=request.getParameter("v1");
    v2=request.getParameter("v2");
    v3=request.getParameter("v3");
    v4=request.getParameter("v4");
    point = Integer.parseInt(request.getParameter("point"));
            try{
                if(0==testtask){

                    nt = new TestTask(question, answer, v1, v2, v3, v4, point);
                    nt.Write(tst, user);
                    response.sendRedirect("Test.jsp?test="+tst.getID());
                }
                else{

                    nt = new TestTask(testtask);
                    nt.Change(question, answer, v1, v2, v3, v4, point, user);
                    response.sendRedirect("Test.jsp?test="+tst.getID());
                }
            }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
            catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
            catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
            catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TestTask</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="CreateTestTask.jsp" method="POST">
                    <input type="hidden" name="testtask" value="<%=testtask%>"> 
                    <input type="hidden" name="test" value="<%=test%>"> 
                    
                    <div class="form-item">
                        <label>Question:</label>
                        <input class="width-100" required type="text" name="question" value="<%=question!=null?question:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Point:</label>
                        <input class="width-100" required type="number" name="point" value="<%=point!=0?point:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>*Answer:</label>
                        <input class="width-100" required type="text" name="answer" value="<%=answer!=null?answer:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>V1:</label>
                        <input class="width-100" required type="text" name="v1" value="<%=v1!=null?v1:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>V2:</label>
                        <input class="width-100" required type="text" name="v2" value="<%=v2!=null?v2:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>V3:</label>
                        <input class="width-100" required type="text" name="v3" value="<%=v3!=null?v3:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>V4:</label>
                        <input class="width-100" required type="text" name="v4" value="<%=v4!=null?v4:""%>">
                    </div>
            
                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        question:{
                            required: true,
                            minlength: 6,
                            maxlength: 200,
                        },
                        
                        point:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 100,
                        },
                        
                        answer:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        v1:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        v2:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        v3:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        v4:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>
