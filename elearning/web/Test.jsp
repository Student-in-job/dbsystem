<%-- 
    Document   : Test
    Created on : Aug 24, 2016, 5:17:51 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-8 ">
                <h3>TEST NAME</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio consequuntur, enim nemo quaerat animi dolor, inventore delectus explicabo voluptate eum totam quae porro, quas ducimus. Iste earum eligendi, qui culpa!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates numquam ipsam quod quae harum maxime error, voluptate doloribus vero. Iusto pariatur velit at, amet doloremque odit, doloribus commodi quos obcaecati.</p>
            </div>

            <div class="row centered best-results">
                <h4 class="col col-12">BEST RESULTS</h4>
                <div class="col">
                    <span class="chart" data-percent="90">
                        <span class="percent"></span>
                        <span class="answers"><br>26/30</span>
                    </span>
                    <p>Jane Shepard</p>
                </div>
                <div class="col">

                    <span class="chart" data-percent="85">
                        <span class="percent"></span>
                        <span class="answers"><br>24/30</span>
                    </span>
                    <p>Jane Shepard</p>
                </div>
                <div class="col">
                    <span class="chart" data-percent="80">
                        <span class="percent"></span>
                        <span class="answers"><br>22/30</span>
                    </span>
                    <p>Jane Shepard</p>
                </div>

            </div>
            <div class="col col-12 test-btn">
                <button class="button round outline">Start test &rarr;</button>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="js/jquery.min.js"></script>


        <script src="js/jquery.easypiechart.min.js"></script>
        <script>
            $(function () {
                $('.chart').easyPieChart({
                    easing: 'easeOutBounce',
                    onStep: function (from, to, percent) {
                        $(this.el).find('.percent').text(Math.round(percent));
                    }
                });
            });
        </script>

    </body>
</html>
