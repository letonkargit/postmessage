<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            .initialhide {
                display: none;
            }

            .hover-highlight:hover {
                color: blue; 
            }
        </style>
        <script>
            function checklogon() {
                var user = "<%=session.getAttribute("user")%>";

//                alert("${userstat}");
//                alert(user);
                if (user === null || user === "null" || user === "") {
                    if("${userstat}" === "Unauthorized"){
                        document.getElementById('loginfailure').style.display = 'block';
                    } else if("${userstat}" === "Thanks"){
                        document.getElementById('thanksmsg').style.display = 'block';
                    } else if("${userstat}" === "Regfailure"){
                        document.getElementById('alregi').style.display = 'block';
                    }
                    document.getElementById('logonpage').style.display = 'block';
                    document.getElementById('email').focus();
                } else {
                    document.regorlogin.action = "<%=request.getContextPath()%>/userhome";
                    document.regorlogin.submit();
                }
            }

            function submitlogonrequest() {
                if (validateId('email') && validateId('secter')) {
                    document.regorlogin.action = "<%=request.getContextPath()%>/logon";
                    document.regorlogin.submit();
                }
            }

            function submitregrequest() {
                if (validateId('secter') && validateId('email') && validateId('name')) {
                    document.regorlogin.action = "<%=request.getContextPath()%>/register";
                    document.regorlogin.submit();
                }
            }

            function alertId(id) {
                document.getElementById(id).style.borderColor = 'red';
            }

            function alertLooseId(id) {
                document.getElementById(id).style.borderColor = 'black';
            }

            function validateId(id) {
                var val = document.getElementById(id).value;
                if (val === null || val === "") {
                    alertId(id);
                    return false;
                }
                return true;
            }

            //----------------------------------------------
            function verifyandregister() {
                showAndClose('youaregoodmessage', 5000);
            }

            function showAndClose(id, time) {
                document.getElementById(id).style.display = 'block';
                setTimeout(function () {
                    hideId(id);
                }, time);
            }

            function registerandlogin() {
                document.registrationform.action = "<%=request.getContextPath()%>/registeruser";
                document.registrationform.submit();
            }

            function closeregisterdiv() {
                hideId('registeruser');
                hideId('registeruserbackend');
            }

            function blurmemberdiv(checkboxid, showdivid, disbalecheckboxid) {
                if (document.getElementById(checkboxid).checked === true) {
                    document.getElementById(disbalecheckboxid).disabled = true;
                    document.getElementById(showdivid).disabled = true;
                } else {
                    document.getElementById(disbalecheckboxid).disabled = false;
                }
            }
        </script>
    </head>
    <body onload="checklogon()">
        <form name="regorlogin"  method="POST">
            <div id="logonpage" class="initialhide" style="border-radius: 10px ;left: 10%;right: 10%;top:10%;background: beige;position: absolute;align-content: center">
                <center>
                    <div style="align-content: center;top: 10%;left: 10%;right: 10%">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Email</span>
                            </div>
                            <input type="text" name="email" id="email" />
                            &nbsp;
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Password</span>
                            </div>
                            <input type="password" name="secter" id="secter" />
                        </div>
                        <div class="input-group mb-3">
                            &nbsp;
                            <div class="input-group-prepend">
                                <span class="input-group-text">Name</span>
                            </div>
                            <input type="text" name="name" id="name" />
                        </div>
                        <div class="input-group mb-3">
                            &nbsp;
                            <button type="button" class="btn btn-primary" onclick="submitlogonrequest();">
                                Login
                            </button>
                            &nbsp;
                            <button type="button" class="btn btn-primary" onclick="submitregrequest();">
                                Register & Login
                            </button>
                        </div>
                        
                        <!--                Email    : <input type="text" name="email" id="email" onkeypress="alertLooseId('email')"/> <br>
                                        Password : <input type="password" name="secter" id="secter" onkeypress="alertLooseId('secter')"/> <br>
                                        Name     : <input type="text" name="name" id="name" onkeypress="alertLooseId('name')"/> <br>
                                        <div class="btn-group">
                                            <input type="button"  class="btn btn-primary" value="Login" onclick="submitlogonrequest()"/> 
                                            <input type="button" class="btn btn-primary"value="Register & Logon" onclick="()"/>
                                        </div>-->

                    </div>        
                </center>
                <div id="loginfailure" class="initialhide" style="color: red">Email OR Password is incorrect!</div>
                <div id="thanksmsg" class="initialhide" style="color: blue">Thanks for using Post Message!</div>
                <div id="alregi" class="initialhide" style="color: red">User already registered!</div>
            </div>
        </form>
    </body>
</html>