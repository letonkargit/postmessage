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
            function takemetodashboard(){
                document.basicformforpagenav.action="<%=request.getContextPath()%>/dashboard";
                document.basicformforpagenav.submit();
            }
            
            function setmemberuser(user){
                document.getElementById("memberuser").value = user;
                document.basicformforpagenav.action="<%=request.getContextPath()%>/setmember";
                document.basicformforpagenav.submit();
            }
    
            function confirmwhologgedon(){
                if("<%=session.getAttribute("memberuser")%>" === ""){
                    showId('whichmemberdiv');
                } else {
                    document.getElementById("memberuserdiv").innerHTML = "Hello <br>"+"<%=session.getAttribute("memberuser")%>";
                    hideId('whichmemberdiv');
                    
                    //setting restriction for date select
                    if(document.getElementById("item_exp") !== null){
                        document.getElementById("item_exp").min = new Date().toISOString().split("T")[0];
                    }
                }
            }  
            
            function showprofile(){
                document.basicformforpagenav.action="<%=request.getContextPath()%>/showprofile";
                document.basicformforpagenav.submit();
            }
            
            function signout(){
                document.basicformforpagenav.action="<%=request.getContextPath()%>/signout";
                document.basicformforpagenav.submit();
            }
        </script>
    </head>
    <body onload="confirmwhologgedon()">
    <div class="container-fluid my-3 bg-secondary text-white" style="top: 0;position: sticky;float: top;z-index:100;">
        <div style="z-index: 200; float: top; position: fixed;height: 100%;width: 100%" id="whichmemberdiv" class="initialhide">
                <div style="z-index: 200; float: top;top: 10%;left: 20%;right: 20%; position: fixed; ;background: gray;color: black;height: 20%;border-radius: 10px">
                    <center>
                    Who from ${user} couple logged on?
                    <div class="input-group mb-3">
                        <button type="button" class="btn btn-primary" onclick="setmemberuser('Onkar');">
                                    Onkar
                        </button>
                        &nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" onclick="setmemberuser('Harshu');">
                                    Harshu
                        </button>
                        &nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" onclick="takemeuserhome();">
                                    Cancel login
                        </button>
                    </div>
                    </center>
                </div>
        </div>
        <div class="container p-3 my-3 bg-dark border" style="top: 0;position: sticky;float: top;">
            <div class="row">
                <div class="col-sm-1">
                    <i class='fa fa-home' style='font-size:36px;' onclick="takemetodashboard();"></i>
                </div>
                <div class="col-sm-1">
                    <i class='fa fa-user-circle' style='font-size:36px' onclick="takemeuserhome()"></i>
                </div>
                <div class="col-sm-1">
                    <div id="memberuserdiv" style="border: 1px solid white;font-size: 15px;border-radius: 20px;text-align: center;cursor: pointer" onclick="showprofile();"></div>
                </div>
                <div class="col-sm-7">
                    <input type="text" value="Search will go here!">
                </div>
                <div class="col-sm-1">
                    <i class='fa fa-sign-out' style='font-size:36px' onclick="signout()"></i>
                </div>
                <div class="col-sm-1">
                    <i class='fa fa-bars' style='font-size:36px' onclick="showoptions()"></i>
                </div>
            </div>
        </div>
    </div>
</body>
</html>