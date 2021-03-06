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

//variables will be used to assign data
var order = $('order');
var itemName = $('name');
var itemN = $('item');

//This function is used to retrive data from xml file
function tableView() {
    var txtF = document.getElementById('textfield').value; //This variable retrieve text from text field of html
    var txtInTab = "<table border='1'>"; // This variable hold data of table
    txtInTab += "<tr>  <td>ORDER ID</td><td>ITEM ID</td><td>NAME</td></tr>";

    for (let index = 0; index < order.length; index++) { // this loop is used to check order tag
        var orderId = order[index].getAttribute('ordId'); //assigns orderid
        var nodeElem = order[index];
        var first = nodeElem.firstChild;

        for (let i = 0; i < nodeElem.childNodes.length; i++) { // this loop is used to retrieve repeated item data

            if (first.nodeName == 'item') { // checks the item tags
                var itemId = first.getAttribute('itemid'); // assigns itemid

                var second = first.firstChild;

                for (j = 0; j < first.childNodes.length; j++) { // loops amont item's child nodes
                    if (second.nodeName == 'name' && second.innerHTML.includes(txtF)) { // finds name child nodes and checks text content
                        txtInTab += "<tr>";
                        txtInTab += "<td>" + orderId + "</td>";
                        txtInTab += "<td>" + itemId + "</td>";
                        txtInTab += "<td>" + second.innerHTML + "</td>";
                        txtInTab += "</tr>";
                    }
                    second = second.nextSibling; // assigns next sibling
                }
                

            }

            first = first.nextSibling; // assigns next sibling
        }

    }

    txtInTab += "</table>";
    return document.getElementById('tab').innerHTML = txtInTab; // Function returns all the data in the html file

}