<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <style>
        .initialhide {
            display: none;
        }
        
        .hover-highlight:hover {
            color: blue; 
        }
        
        .blurdiv {
            border: 1px solid black;
            opacity: 0.5;
            background: white;
            border-radius: 5px;
            z-index: 400;
        }
    </style>
    <script>
        function showId(id){
            document.getElementById(id).style.display = 'block';
        }
        
        function hideId(id){
            document.getElementById(id).style.display = 'none';
        }
        
        function setFocus(id){
            document.getElementById(id).focus();
        }
        
        function takemeuserhome(){
            document.basicformforpagenav.action="<%=request.getContextPath()%>/home";
            document.basicformforpagenav.submit();
        }
    </script>
<body>
<!--    <div class="container-fluid p-3 my-3 bg-dark text-white" style="bottom: 0;position: fixed;float: bottom;z-index:100;">
            <h3>Footer options</h3>
    </div>-->

    <form name="basicformforpagenav" action="POST">
        <input type="hidden" id="user" name="user" value="<%=session.getAttribute("user")%>"/>
        <input type="hidden" id="memberuser" name="memberuser" value="<%=session.getAttribute("memberuser")%>"/>
    </form>
        
</body>
</html>