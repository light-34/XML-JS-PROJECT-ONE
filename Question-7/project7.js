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
var customerId = $('customerid'); //get value of customer id
var itemN = $('item'); //get value instock and itemid attribute
var stats = $('status'); //get value of status
var itemName = $('name');
var price = $('price');
var qty = $('qty');

var txtF = document.getElementById('textfield').value;

function tableView() {
    var txtInTab = "<table border='1'>";
    txtInTab += "<tr> <td>CUSTOMER ID</td> <td>ORDER ID</td> <td> NAME </td> <td>STATUS</td> ";
    txtInTab += "<td>INSTOCK</td> <td>ITEM ID</td> <td>PRICE</td> <td>QUANTITY</td></tr>";

    for (let index = 0; index < order.length; index++) {

        if (txtF == itemName[index].innerHTML) {
            txtInTab += "<tr>";
            txtInTab += "<td>" + customerId[index].innerHTML + "</td>";
            txtInTab += "<td>" + order[index].getAttribute('ordId') + "</td>";
            txtInTab += "<td>" + itemName[index].innerHTML + "</td>";
            txtInTab += "<td>" + stats[index].innerHTML + "</td>";
            txtInTab += "<td>" + itemN[index].getAttribute('instock') + "</td>";
            txtInTab += "<td>" + itemN[index].getAttribute('itemid') + "</td>";
            txtInTab += "<td>" + price[index].innerHTML + "</td>";
            txtInTab += "<td>" + qty[index].innerHTML + "</td>";
            txtInTab += "</tr>";
        }
    }
    txtInTab += "</table>";

    return document.getElementById('tab').innerHTML = txtInTab;
}
