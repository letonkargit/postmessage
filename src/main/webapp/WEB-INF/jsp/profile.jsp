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
        .img-profile {
            border: 1px solid black;
            float: left;
            position: relative;
            margin-right: 10px;
        }
    </style>
    <script>        
        function submitreq(action){
            document.basicformforpagenav.action="<%=request.getContextPath()%>/"+action;
            document.basicformforpagenav.submit();
        }
        
        function uploadImage(id, image){
            if(document.getElementById(image).value !== ""){
                var member_id = document.createElement("input");
                member_id.setAttribute("name","member_id");
                member_id.setAttribute("type","hidden");
                member_id.setAttribute("value", id);
                
                var imagetype = document.createElement("input");
                imagetype.setAttribute("name","imagetype");
                imagetype.setAttribute("type","hidden");
                imagetype.setAttribute("value", "profilepic");

                document.uploadprofform.appendChild(member_id);
                document.uploadprofform.appendChild(imagetype);

                document.uploadprofform.action="<%=request.getContextPath()%>/saveitem";
                document.uploadprofform.submit();
            } else {
                //set error message
            }
        }
    </script>
</head>
<body>
<form name="uploadprofform" method="POST" action=""></form>
    <jsp:include page="common/header.jsp"/>
    <!-- common required properties-->
    <!--<input type="hidden" id="success" name="success" value="${success}">-->
    <!-- common required properties-->
    <div class="container p-3 my-3 border" style="float:top;position: relative">
        <div class="row">            
            <div class="col">
                <c:forEach items="${profiles}" var="users">
                    <div class="card img-profile" style="width:250px;">
                        <div style="position: relative">
                            <img class="card-img-top" style="width:250px;height:220px" src="<%=request.getContextPath()%>/image?imagepath=${users.profilepic}" alt="Please upload image to see it here!">
                            
                            <c:if test="${not users.imageUnavailable}">
                                <div style="position: absolute;bottom: 0px;left: 0px;width: 250px">
                                    <div class="input-group">
                                        <div class="custom-file">
                                            <input type="file" id="profimage${users.member_id}" name="profimage${users.member_id}">
                                        </div>
                                        <div class="input-group-btn">
                                            <input type="button" class="btn btn-primary" onclick="uploadImage('${users.member_id}','profimage${users.member_id}')" value="Upload">
                                        </div>
                                    </div>
                                    <input type="hidden" id="member_id${users.member_id}" name="member_id${users.member_id}" value="${users.member_id}"/>
                                </div>
                            </c:if>
                        </div>
                        <div class="card-body">
                          <h4 class="card-title">${users.fname} ${users.mname} ${users.lname}</h4>
                          <p class="card-text">${users.member_nickname}</p>
                        </div>
                        
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
</body>
</html>