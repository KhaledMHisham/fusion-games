function userINFoAction() {
    $("#displayUserINFoCard").load("/user-profile.html");

}



var XMLHttpRequest;
function orderAction() {

    $("#displayOrdersCard").load("/order.html");
    var v=document.order;
    var url = "order.jsp?val="+v;
    if (window.XMLHttpRequest)
        XMLHttpRequest = new XMLHttpRequest();
    else if (window.ActiveXObject)
        XMLHttpRequest = new ActiveXObject(Microsoft.XMLHTTP);

XMLHttpRequest.onreadystatechange = handleXMLHttpRequest;
XMLHttpRequest.open("GET", url, true)
XMLHttpRequest.send(null);
}

function handleXMLHttpRequest() {
    if (handleXMLHttpRequest.readyState == 4 && handleXMLHttpRequest.status == 200) {
        var responseVal = XMLHttpRequest.responseText;
        document.getElementsByClassName("name1").innerHTML=responseVal;
    }
    
}
