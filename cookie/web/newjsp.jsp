<%-- 
    Document   : newjsp
    Created on : 28.11.2016, 16:11:13
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="/cookie/eve/evercookie.js"></script>
        <script type="text/javascript" src="/cookie/jquery.min.js"></script>
    </head>
    <body>
        <div id="id">Loading..</div>       
    <script>  
        function show()  
        { 
            
            var ec = new evercookie();
            ec.get("ids", function(data) { 
                if(data!==null){
                    $("#id").html('if');
                    ec.get("ids", function(data) { $("#id").html("cookie value = "+data); });
                    function getCookie(best_candidate, all_candidates)
                    {
                        alert("The retrieved cookie is: " + best_candidate + "\n" +
                                "You can see what each storage mechanism returned " +
                                "by looping through the all_candidates object.");

                        for (var item in all_candidates)
                                document.write("Storage mechanism " + item +
                                        " returned: " + all_candidates[item] + "<br>");
                    }
    ec.get("id", getCookie);
                } else {
                    $("#id").html('cookie unexist');
                    /*$("#id").html('else');
                    $.ajax({  
                        url: "/cookie/set",  
                        cache: false, 
                        error: function(){$("#id").thml("error!");},
                        success: function(data){
                                var ec = new evercookie();
                                ec.set("ids", data);

                                $("#id").html("seting value = "+data);  
                            }  
                        }); */
                } 
            });
             
        } 
        
        
      
        $(document).ready(function(){  
            show();   
        });  
    </script>
    
    </body>
</html>
