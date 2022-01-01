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
//                alert(user);
                if (user === null || user === "null" || user === "") {

                }

                if ("${msgstat}" === "posted") {
                    hideSuccessMessage();
                }
            }

            function hideSuccessMessage() {
                document.getElementById('postsuccessmsg').style.display = 'block';
                setTimeout(function () {
                    document.getElementById('postsuccessmsg').style.display = 'none';
                }, 5000);
            }

            function getallnext() {
                document.itemsform.action = "POST";
                document.itemsform.action = "<%=request.getContextPath()%>/getnextall";
                document.itemsform.submit();
            }

            function getallprev() {
                document.itemsform.action = "POST";
                document.itemsform.action = "<%=request.getContextPath()%>/getprevall";
                document.itemsform.submit();
            }

            function getnext() {
                document.itemsform.action = "POST";
                document.itemsform.action = "<%=request.getContextPath()%>/getnextmy";
                document.itemsform.submit();
            }

            function getprev() {
                document.itemsform.action = "POST";
                document.itemsform.action = "<%=request.getContextPath()%>/getprevmy";
                document.itemsform.submit();
            }

            function searchuserfunc() {
                if (validateId('searchuser')) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            if (this.responseText === null || this.responseText === "") {
                                document.getElementById("followusernotfound").innerHTML = "Email not found";
                                document.getElementById("followusernotfound").style.display = 'block';
                                document.getElementById("followuser").style.display = 'none';
                                document.getElementById("searcheduser").value = "";
                            } else {
                                document.getElementById("followuser").innerHTML = "Follow : " + this.responseText;
                                document.getElementById("followuser").style.display = 'block';
                                document.getElementById("followusernotfound").style.display = 'none';
                                document.getElementById("searcheduser").value = this.responseText;
                            }
                        }
                    };
                    var suser = document.getElementById("searchuser").value;
                    xhttp.open("GET", "<%=request.getContextPath()%>/searchusertofollow?suser=" + suser, true);
                    xhttp.send();
                }
            }

            function follow() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("followuser").style.display = 'none';
                        document.getElementById("followusernotfound").style.display = 'none';
                        document.getElementById("followingnow").style.display = 'block';
                        if (this.responseText === "success") {
                            document.getElementById("followingnow").innerHTML = "Following " + document.getElementById("searcheduser").value + " now!";
                        } else {
                            document.getElementById("followingnow").innerHTML = "Couldn't follow";
                        }
                    }
                };
                var suser = document.getElementById("searcheduser").value;
                xhttp.open("POST", "<%=request.getContextPath()%>/savefollower?suser=" + suser, true);
                xhttp.send();
            }

            function submitmessage() {
                if (validateId('messagepost')) {
                    document.messageform.action = "POST";
                    document.messageform.action = "<%=request.getContextPath()%>/postmsg";
                    document.messageform.submit();
                }
            }

            function clearmessage() {
                document.getElementById('messagepost').value = "";
                document.getElementById('messagepost').focus();
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

    <center>
        <div style="top: 2%; border-bottom: solid 1px">
            ${userinfo.name} | Email : ${userinfo.email} | <a href="<%=request.getContextPath()%>/logout">Logout</a>
        </div>
    </center>
    <div class="container p-3 my-3 border" style="float:top;position: relative">
        <div class="row" style="align-content: center">            
            <div class="col">
                <div class="form-group">
                    <form name="messageform" method="POST">
                        <label for="comment">Message to post:</label>
                        <textarea class="form-control" rows="5" id="messagepost" name="messagepost"></textarea>
                    </form>
                </div>
                <div class="input-group mb-3">
                    &nbsp;
                    <button type="button" class="btn btn-primary" onclick="submitmessage();">
                        Post Message
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-primary" onclick="clearmessage();">
                        Clear
                    </button>
                </div>

            </div>
            <div class="col">
                <div class="form-group">
                    <label for="comment">Search user</label>
                    <input type="text" class="form-control" id="searchuser" name="searchuser"/>
                </div>
                <div class="input-group mb-3">
                    &nbsp;
                    <button type="button" class="btn btn-primary" onclick="searchuserfunc();">
                        Search user
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-primary initialhide" id="followuser"  onclick="follow();"></button>
                    <div id="followusernotfound" class="initialhide">User not found!</div>
                    <div id="followingnow" class="initialhide"></div>
                    <input type="hidden" value="" id="searcheduser" name="searcheduser"/>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col">
                <div style="top: 2%;float: left; padding: 20px">
                    Your recent messages :
                    <c:forEach items="${mymessages}" var="msgs">
                        <div style="float: top;background-color: bisque;width: 400px;border-radius: 2px">
                            ${msgs.message} <br>
                            ${msgs.date}
                        </div>
                        <div style="height: 2px">

                        </div>
                    </c:forEach>
                    <div class="input-group mb-3">
                        &nbsp;
                        <c:if test="${mymsgpage > 1}">
                            <button type="button" class="btn btn-primary" onclick="getprev();">
                                Prev
                            </button>
                        </c:if>
                        <c:if test="${endofmymsgs == 'mid'}">
                            &nbsp;
                            <button type="button" class="btn btn-primary" onclick="getnext();">
                                Next
                            </button>
                        </c:if>
                    </div>

                    <form name="itemsform" action="POST">
                        <input type="hidden" value="${mymsgpage}" id="mymsgpage" name="mymsgpage"/>
                        <input type="hidden" value="${allmsgpage}" id="allmsgpage" name="allmsgpage"/>
                    </form>
                </div>
            </div>
            <div class="col">
                <div style="top: 2%;float: left; padding: 20px">
                    All recent messages :
                    <c:forEach items="${allmessages}" var="msgs">
                        <div style="float: top;background-color: bisque;width: 400px;border-radius: 2px">
                            ${msgs.message} <br>
                            ${msgs.date}
                        </div>
                        <div style="height: 2px">

                        </div>
                    </c:forEach>
                    <div class="input-group mb-3">
                        &nbsp;
                        <c:if test="${allmsgpage > 1}">
                            <button type="button" class="btn btn-primary" onclick="getallprev();">
                                Prev
                            </button>
                        </c:if>
                        <c:if test="${endofallmsgs == 'mid'}">
                            &nbsp;
                            <button type="button" class="btn btn-primary" onclick="getallnext();">
                                Next
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="z-index: 400; float: bottom;bottom:12%;left:5px;position: fixed; ;background: gray;color: black;border-radius: 10px;padding:5px;border: 1px solid brown" class="initialhide" id="postsuccessmsg">
        Message posted successfully!
    </div>
</div>
</body>
</html>