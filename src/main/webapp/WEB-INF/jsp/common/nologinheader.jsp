<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>            
            function authenuser(){
                document.getElementById("uname").value = document.getElementById("username").value;
                document.getElementById("passwd").value = document.getElementById("password").value;
                document.userfrm.action="<%=request.getContextPath()%>/authuser";
                document.userfrm.submit();
            }
            
            function reguser(){
                showId('registeruser');
                showId('registeruserbackend');
            }
        </script>
    </head>
<body>
    <div class="container-fluid my-3 bg-secondary text-white" style="top: 0;position: sticky;float: top;z-index:100;">
        <div class="container p-3 my-3 bg-dark border" style="top: 0;position: sticky;float: top;"  id="nologonheaderdiv">
            <div class="row">
                    <div class="col-sm-1">
                    </div>
                    <div class="col-sm-10">
                        <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Email</span>
                                </div>
                                <input type="text" name="username" id="username" />
                                &nbsp;
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Password</span>
                                </div>
                                <input type="password" name="password" id="password" />
                                &nbsp;
                                <button type="button" class="btn btn-primary" onclick="authenuser();">
                                            Login
                                </button>
                                &nbsp;
                                <button type="button" class="btn btn-primary" onclick="reguser();">
                                            Register
                                </button>
                        </div>
                    </div>                    
                    <div class="col-sm-1">
                    </div>
            </div>
        </div>
        <form name="userfrm" action="POST" >
            <input type="hidden" name="uname" id="uname" />
            <input type="hidden" name="passwd" id="passwd" />
        </form>
    </div>
</body>
</html>