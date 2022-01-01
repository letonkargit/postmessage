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
        .hover-menu {
            border: 1px solid black;
            border-radius: 50px;
            background: buttonface;
            float: left;height: 100%;
            width: 100px;position: relative;
            margin-right: 10px;
            font-family: sans-serif;
            text-align: center;
            cursor: pointer;
        }
        .hover-menu:hover {
            height: 105%;
            width: 105px;
        }
        
        .hover-menu-bigger {
            border: 1px solid black;
            border-radius: 50px;
            background: buttonface;
            float: left;height: 100%;
            width: 120px;position: relative;
            margin-right: 10px;
            font-family: sans-serif;
            text-align: center;
            cursor: pointer;
        }
        .hover-menu-bigger:hover {
            height: 105%;
            width: 127px;
        }
    </style>
    <script>        
        function submitreq(action, query){
            var itemtype = document.createElement("input");
            itemtype.setAttribute("name","query");
            itemtype.setAttribute("type","hidden");
            itemtype.setAttribute("value", query);
                    
            document.basicformforpagenav.appendChild(itemtype);
            document.basicformforpagenav.action="<%=request.getContextPath()%>/"+action;
            document.basicformforpagenav.submit();
        }
        
        function saveValue(currentid,nextid){
            if(document.getElementById(currentid).value !== null && document.getElementById(currentid).value !== ""){
                showId(nextid);
                document.getElementById(currentid+"_value").innerHTML = document.getElementById(currentid).value;
                document.getElementById(currentid+"_hidden").value = document.getElementById(currentid).value;
                hideId(currentid+"_div");
            }
        }
        
        function saveTypeValue(currentid,nextid){
            var itemtyperad = document.getElementsByName(currentid);
            for(var i=0;i<itemtyperad.length;i++){
                if(itemtyperad[i].checked){
                    var itemtypeval = itemtyperad[i].value;
                    if(itemtypeval === ""){
                        itemtypeval = document.getElementById(currentid+"_text").value;
                    }
                    document.getElementById(currentid+"_value").innerHTML = itemtypeval;
                    document.getElementById(currentid+"_hidden").value = itemtypeval;
                    break;
                }
            }
            showId(nextid);
            hideId(currentid+"_div");
        }
        
        function enableTxtFld(id){
            document.getElementById(id).disabled=false;
            if(document.getElementById(id).value === "Enter my own"){
                document.getElementById(id).value="";
            }
            document.getElementById(id).focus();
        }
        
        function disablesTxtFld(id){
            if(document.getElementById(id).value === ""){
                document.getElementById(id).value="Enter my own";
            }
            document.getElementById(id).disabled=true;
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
        
        function showmoreopt(){
            showId("moreoptionstoview");
        }
        
        function showallitems(){
            document.basicformforpagenav.action="<%=request.getContextPath()%>/geteatableitems";
            document.basicformforpagenav.submit();
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
                <div style="height: 80px; padding: 10px;">
                    <div class="hover-menu" onclick="showId('itemsid');showId('itemsdemo');showId('item_type_div');hideId('showitemsdiv');">
                        Add Item
                    </div>
                    <c:if test="${not empty items}">
                        <div class="hover-menu-bigger" onclick="showallitems();">
                            Show all items!
                        </div>
                        <div class="hover-menu-bigger" onclick="showmoreopt();">
                            See more options to view items!
                        </div>
                    </c:if>
                </div>
            </div>     
        </div>
    </div>
    <div class="container p-3 my-3" style="float:top;position: relative">
        <div class="row">
            <div id="itemsid" class="initialhide">
                <div class="col">
                    <div>
                        <div id="item_type_div" class="initialhide">
                            Select item type :
                            <label><input type="radio" name="item_type" value="Snacks" onclick="disablesTxtFld('item_type_text');" checked="true"/>Snacks</label>
                            <label><input type="radio" name="item_type" value="Food" onclick="disablesTxtFld('item_type_text');"/>Food</label>
                            <label><input type="radio" name="item_type" value="Drink" onclick="disablesTxtFld('item_type_text');"/>Drink</label>
                            <label>
                                <input type="radio" name="item_type" onclick="enableTxtFld('item_type_text')" value=""/>
                                <input type="text" id="item_type_text" disabled="true" value="Enter my own" />
                            </label>
                            <br>
                            <button type="button" class="btn btn-primary" onclick="saveTypeValue('item_type','item_name_div');setFocus('item_name');">
                                Next : Enter name
                            </button>
                        </div>
                        <div id="item_name_div" class="initialhide">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Enter item name:</span>
                                </div>
                                <input type="text" name="item_name" id="item_name" />
                            </div>
                            <button type="button" class="btn btn-primary" onclick="saveValue('item_name','item_desc_div');setFocus('item_desc');">
                                Next : Enter Description
                            </button>
                        </div>
                        <div id="item_desc_div" class="initialhide">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Enter item description</span>
                                </div>
                                <input type="text" name="item_desc" id="item_desc" />
                            </div>
                            <button type="button" class="btn btn-primary" onclick="saveValue('item_desc','item_eattime_div');setFocus('item_eattime_btn');">
                                Next : Good time to eat
                            </button>
                        </div>
                        <div id="item_eattime_div" class="initialhide">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Good time to eat?</span>
                                </div>
                                <label><input type="radio" name="item_eattime" value="Breakfast" onclick="disablesTxtFld('item_eattime_text');" checked="true"/>Breakfast</label>
                                <label><input type="radio" name="item_eattime" value="Lunch" onclick="disablesTxtFld('item_eattime_text');"/>Lunch</label>
                                <label><input type="radio" name="item_eattime" value="Dinner" onclick="disablesTxtFld('item_eattime_text');"/>Dinner</label>
                                <br>
                                <label><input type="radio" name="item_eattime" value="Any meal" onclick="disablesTxtFld('item_eattime_text');"/>Any meal</label>
                                <label><input type="radio" name="item_eattime" value="Party" onclick="disablesTxtFld('item_eattime_text');"/>Party</label>
                                <label><input type="radio" name="item_eattime" value="With tea" onclick="disablesTxtFld('item_eattime_text');"/>With tea</label>
                                <br>
                                <label>
                                    <input type="radio" name="item_eattime" onclick="enableTxtFld('item_eattime_text')" value=""/>
                                    <input type="text" id="item_eattime_text" disabled="true" value="Enter my own" />
                                </label>
                            </div>
                            <button type="button" class="btn btn-primary" id="item_eattime_btn" onclick="saveTypeValue('item_eattime','item_exp_div');setFocus('item_exp');">
                                Next : Expiration date
                            </button>
                        </div>
                        <div id="item_exp_div" class="initialhide">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">When is it expiring?</span>
                                </div>
                                <input type="date" name="item_exp" id="item_exp"/>
                            </div>
                            <button type="button" class="btn btn-primary" onclick="saveValue('item_exp','item_location_div');setFocus('item_location_btn');">
                                Next : Where have you kept it?
                            </button>
                        </div>
                        <div id="item_location_div" class="initialhide">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Where have you kept it?</span>
                                </div>
                                <label><input type="radio" name="item_location" value="Upper shelf" onclick="disablesTxtFld('item_location_text');" checked="true"/>Upper shelf</label>
                                <label><input type="radio" name="item_location" value="Lower shelf" onclick="disablesTxtFld('item_location_text');"/>Lower shelf</label>
                                <label><input type="radio" name="item_location" value="Refrigerator" onclick="disablesTxtFld('item_location_text');"/>Refrigerator</label>
                                <br>
                                <label>
                                    <input type="radio" name="item_type" onclick="enableTxtFld('item_location_text')" value=""/>
                                    <input type="text" id="item_location_text" disabled="true" value="Enter my own" />
                                </label>
                            </div>
                            <button type="button" class="btn btn-primary" id="item_location_btn" onclick="saveTypeValue('item_location','item_opened_div');setFocus('item_opened_btn');">
                                Next : Is it opened yet?
                            </button>
                        </div>
                        <div id="item_opened_div" class="initialhide">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Is it opened yet?</span>
                                </div>
                                <label><input type="radio" name="item_opened" value="Opened"/>Opened</label>
                                <label><input type="radio" name="item_opened" value="Packed" checked="true" />Packed</label>
                            </div>
                            <button type="button" class="btn btn-primary" id="item_opened_btn" onclick="saveTypeValue('item_opened','item_save_button');hideId('itemsid');">
                                Next : Review items
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div id="showitemsdiv">
                    <c:choose>
                        <c:when test="${empty items}">
                            You have no items, start by adding items!
                        </c:when>
                        <c:otherwise>
                            <div id="moreoptionstoview" class="initialhide">
                                <c:forEach items="${groupeditems}" var="groupitems">
                                    <b><div>${groupitems.itemgroupname}</div></b>
                                    <div id="${groupitems.itemgroupname}" style="height: 80px; padding: 10px;">
                                        <c:forEach items="${groupitems.itemmenus}" var="itemmenu">
                                            <div class="hover-menu" onclick="submitreq('${groupitems.groupactionname}','${itemmenu}');">
                                                ${itemmenu}
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="width: 150px">Item type</th>
                                        <th>Item name</th>
                                        <th>Item description</th>
                                        <th>Good time to eat</th>
                                        <th>Item expiration</th>
                                        <th>Kept here</th>
                                        <th>Item opened ever</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${items}" var="item">
                                        <tr>
                                            <td style="width: 150px">
                                                <div id="itemtype${item.item_id}">${item.item_type}</div>
                                                <div id="itemtypeedit${item.item_id}" class="initialhide">
                                                    <input type="text" name="itemtypeval${item.item_id}" id="itemtypeval${item.item_id}" value="${item.item_type}" />
                                                </div>
                                            </td>
                                            <td>${item.item_name}</td>
                                            <td>${item.item_desc}</td>
                                            <td>${item.item_eat_time}</td>
                                            <td>${item.item_exp_date}</td>
                                            <td>${item.item_location}</td>
                                            <td>${item.is_opened}</td>
                                            <td>
                                                <div id="showsaveitems${item.item_id}">
                                                    <i class='fa fa-edit' style='font-size:24px' onclick="editthisitem(${item.item_id});" ></i>
                                                </div>
                                                <div id="saveediteditemid${item.item_id}" class="initialhide">
                                                    <button type="button" class="btn btn-primary" onclick="saveEditedItem(${item.item_id})"> Save </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="row" style="align-content: center">
            <div id="itemsdemo" class="initialhide" style="width: 210px;border: 1px solid black;background: yellowgreen;float: right;top:5px;right: 5px;position: absolute;border-radius: 10px">
                <div style="height: 20px;width: 208px;border-bottom: 1px outset red;float: top;border-radius: 10px 10px 0px 0px;position: relative;margin-bottom: 1px">
                    <i>Type : </i> <label id="item_type_value" name="item_type_value"/>
                </div>
                <div style="height: 20px;width: 208px;border-bottom: 1px outset red;float: top;position: relative;margin-bottom: 1px">
                    <i>Name : </i> <label id="item_name_value"/>
                </div>
                <div style="height: 40px;width: 208px;border-bottom: 1px outset red;float: top;position: relative;margin-bottom: 1px">
                    <i>Description : </i> <label id="item_desc_value"/>
                </div>
                <div style="height: 40px;width: 208px;border-bottom: 1px outset red;float: top;position: relative;margin-bottom: 1px">
                    <i>Good time to eat : </i> <label id="item_eattime_value"/>
                </div>
                <div style="height: 40px;width: 208px;border-bottom: 1px outset red;float: top;position: relative;margin-bottom: 1px">
                    <i>Expiring on : </i> <label id="item_exp_value"/>
                </div>
                <div style="height: 40px;width: 208px;border-bottom: 1px outset red;float: top;position: relative;margin-bottom: 1px">
                    <i>Kept in: </i><label id="item_location_value"/>
                </div>
                <div style="height: 20px;width: 208px;border-bottom: 1px outset red;float: top;position: relative;margin-bottom: 1px">
                    <i>Item is  </i> <label id="item_opened_value"/>
                </div>
                <center>
                    <div style="width: 208px;border-bottom: float: top;position: relative;margin-bottom: 1px" id="item_save_button">
                        <button type="button" class="btn btn-primary" onclick="saveItem();">
                            Save item
                        </button>
                    </div>
                </center>
            </div>
        </div>
    </div>            
    <form name="itemsform" method="POST">
                <input type="hidden" id="item_type_hidden" name="item_type_hidden">
                <input type="hidden" id="item_name_hidden" name="item_name_hidden">
                <input type="hidden" id="item_desc_hidden" name="item_desc_hidden">
                <input type="hidden" id="item_eattime_hidden" name="item_eattime_hidden">
                <input type="hidden" id="item_exp_hidden" name="item_exp_hidden">
                <input type="hidden" id="item_location_hidden" name="item_location_hidden">
                <input type="hidden" id="item_opened_hidden" name="item_opened_hidden">
    </form>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>