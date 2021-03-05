// XHR object to get information from xml
var xhttpLink = new XMLHttpRequest();

//Open method is for opening the file
xhttpLink.open('GET', 'order_modified.xml', false);

//This line sends request to server
xhttpLink.send();

//This line is used to read data from xml file
xmlInfo = xhttpLink.responseXML;

//this function is used to get gats by their name
var $ = function (tagName) {
    return xmlInfo.getElementsByTagName(tagName);
}

//Define variables to assign values
var order = $('order');
var itemId = $('item');
var stats = $('status');

function tableView() {//This function is used to retrive data from xml file
    var txtInTab = "<table border='1'>"; // This variable hold data of table
    txtInTab += "<tr> <td>CUSTOMER ID</td>  <td>ORDER ID</td>  <td>ITEM ID</td> </tr>";
    for (let index = 0; index < order.length; index++) {

        if (stats[index].innerHTML == "pending") { //This conditional checks the pending orders
            txtInTab += "<tr>";
            txtInTab += "<td>" + order[index].getAttribute('customerid') + "</td>";
            txtInTab += "<td>" + order[index].getAttribute('ordId') + "</td>";

            var nodeElem = order[index];
            var first = nodeElem.firstChild;
            var valItem = "";
            for (let i = 0; i < nodeElem.childNodes.length; i++) { // this loop is used to retrieve repeated item data
                if (first.nodeName == 'item') {
                    valItem += first.getAttribute('itemid') + "  ";
                }

                first = first.nextSibling;
            }
            txtInTab += "<td> " + valItem + "</td>";
            txtInTab += "</tr>";
        }
    }
    txtInTab += "</table>";

    return document.getElementById('tab').innerHTML = txtInTab; // All data is located in the html
}
