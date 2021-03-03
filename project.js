// XHR object to get information from xml
var xhttpLink = new XMLHttpRequest();

//Open method is for opening the file
xhttpLink.open('GET', 'order_JS.xml', false);

//This line sends request to server
xhttpLink.send();

//This line is used to read data from xml file
xmlInfo = xhttpLink.responseXML;

//this function is used to get gats by their name
var $ = function (tagName) {
    return xmlInfo.getElementsByTagName(tagName);
}

var order = $('order');
var customerId = $('customerid');
var itemId = $('item');
var stats = $('status');

function tableView() {
    var txtInTab = "<table border='1'>";
    txtInTab += "<tr> <td>CUSTOMER ID</td>  <td>ORDER ID</td>  <td>ITEM ID</td> </tr>";
    for (let index = 0; index < order.length; index++) {

        if (stats[index].innerHTML == "pending") {
            txtInTab += "<tr>";
            txtInTab += "<td>" + customerId[index].innerHTML + "</td>";
            txtInTab += "<td>" + order[index].getAttribute('ordId') + "</td>";
            
            var nodeElem = order[index];
            var first = nodeElem.firstChild;
            var valItem = "";
            for (let i = 0; i < nodeElem.childNodes.length; i++) {
                if (first.nodeName == 'item') {
                    valItem += first.getAttribute('itemid') + "    ";
                }

                first = first.nextSibling;
            }
            txtInTab += "<td> " + valItem + "</td>";
            txtInTab += "</tr>";
        }
    }
    txtInTab += "</table>";

    return document.getElementById('tab').innerHTML = txtInTab;
}
