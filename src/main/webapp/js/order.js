
var XMLHttpRequest;
function orderAction() {
    var url ="/order.jsp";
    if (window.XMLHttpRequest)
        XMLHttpRequest = new XMLHttpRequest();
    else if (window.ActiveXObject)
        XMLHttpRequest = new ActiveXObject(Microsoft.XMLHTTP);

XMLHttpRequest.onreadystatechange = handleXMLHttpRequest;
XMLHttpRequest.open("GET", url, true)
XMLHttpRequest.send(null);
XMLHttpRequest.onload = function() {
    if (this.status == 200) {
      document.getElementById('order').innerHTML = this.responseText;
    }
    }
    
}

function userInfoAction(){

    var url ="/user-profile.jsp";
    if (window.XMLHttpRequest)
        XMLHttpRequest = new XMLHttpRequest();
    else if (window.ActiveXObject)
        XMLHttpRequest = new ActiveXObject(Microsoft.XMLHTTP);

XMLHttpRequest.onreadystatechange = handleXMLHttpRequest;
XMLHttpRequest.open("GET", url, true)
XMLHttpRequest.send(null);
XMLHttpRequest.onload = function() {
    if (this.status == 200) {
      document.getElementById('user-profile').innerHTML = this.responseText;
    }
    }

}