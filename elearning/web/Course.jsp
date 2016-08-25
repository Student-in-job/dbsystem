<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Program</title>
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/style.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/extend/tabs.js"></script>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="row centered">
            <div class="col col-8">
                <h3>Course Name</h3>

                <div class="row green-bg">



                    <div class="col col-8">
                        <img src="img/c_1.png" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                        <p class="middle">
                            Type: <br>
                            Area: <br>
                            Duration: <br>
                            Level: <br>
                            Minimal Level: <br>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam eaque dolore temporibus perferendis, corporis consequuntur odit eum. Soluta natus, consequuntur. Quod aut aspernatur, consequatur nisi. Quod beatae sint, assumenda voluptatum.
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis recusandae vitae obcaecati deleniti quasi, molestiae velit distinctio eaque, quod provident debitis soluta. Dolor perferendis cumque quis accusantium magnam. Facilis, debitis.
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus non officiis accusantium ea sequi aliquid nam assumenda tempora ducimus, quae ad doloremque quisquam soluta animi mollitia, accusamus esse. Molestias, commodi.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered  course-2">
            <div class="col col-8">
                <nav class="tabs" data-component="tabs" data-equals="true">
                    <ul>
                        <li class="active"><a href="#tab11">MATERIAL</a></li>
                        <li><a href="#tab12">TEST</a></li>
                    </ul>
                </nav>

                <div id="tab11"  >
                    <div class="row">
                        <div class="col">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                            </p>
                        </div>
                        <div>
                            <button class="button small round success">UPDATE</button>
                            <button class="button small round primary">DELETE</button>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <p>
                                Create new material 
                            </p>
                        </div>
                        <div>
                            <button class="button small round error">ADD</button>
                        </div>
                    </div>

                </div>

                <div id="tab12">
                    <div class="row">
                        <div class="col">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                            </p>
                        </div>
                        <div>
                            <button class="button small round success">UPDATE</button>
                            <button class="button small round primary">DELETE</button>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <p>
                                Create new test 
                            </p>
                        </div>
                        <div>
                            <button class="button small round error">ADD</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
