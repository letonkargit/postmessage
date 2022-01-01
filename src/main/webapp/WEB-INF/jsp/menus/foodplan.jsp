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
    <script>
        function saveValue(currentid,nextid){
            if(document.getElementById(currentid).value !== null && document.getElementById(currentid).value !== ""){
                showId(currentid+"_value_id");
                showId(nextid);
                document.getElementById(currentid+"_value").innerHTML = document.getElementById(currentid).value;
                document.getElementById(currentid+"_hidden").value = document.getElementById(currentid).value;
                hideId(currentid+"_div");
            }
        }
        
        function saveItem(){
            document.itemsform.action="<%=request.getContextPath()%>/saveitem";
            document.itemsform.submit();
        }
        
        //Edit item
        var canedit = true;
        function editthisitem(id){
            if(canedit){
                //For item type
                hideId("itemtype"+id);
                hideId("showsaveitems"+id);
                showId("itemtypeedit"+id)
                showId("saveediteditemid"+id);
                
                canedit = false;
            } else {
                alert("Please save edited item first! This should be a toast!");
            }
        }
        
        function saveEditedItem(id){
            var typeVal = document.getElementById("itemtypeval"+id).value;
            alert("Saving - "+typeVal);
        }
    </script>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <!-- common required properties-->
    <!--<input type="hidden" id="success" name="success" value="${success}">-->
    <!-- common required properties-->
    <div class="container p-3 my-3 border" style="float:top;position: relative">
        <div class="row">
            <div class="col">
                <div class="input-group mb-3">
                    Food plan page
                </div>
            </div>     
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>