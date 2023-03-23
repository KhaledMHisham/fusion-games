function orderAction() {

    $("#displayOrdersCard").load("/order.html");

}

function userINFoAction() {


    $("#displayUserINFoCard").load("/user-profile.html");

}



var XMLHttpRequest;
function startRequest() {
    //var name = document.
    var url = "order.jsp?val=";
    if (window.XMLHttpRequest)
        XMLHttpRequest = new XMLHttpRequest();
    else if (window.ActiveXObject)
        XMLHttpRequest = new ActiveXObject(Microsoft.XMLHTTP);
}

XMLHttpRequest.onreadystatechange = handleXMLHttpRequest;
XMLHttpRequest.open("GET", url, true)
XMLHttpRequest.send(null);

function handleXMLHttpRequest() {
    if (handleXMLHttpRequest.readyState == 4 && handleXMLHttpRequest.status == 200) {
        var responseVal = XMLHttpRequest.responseText;
        document.getElementsByClassName("results").innerHTML=responseVal;
    }
    
}
