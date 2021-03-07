<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Declaring XSL doc -->
   <xsl:template match="/">
      <html>
         <head>
            <title>Modified</title>
         </head>
         <body> 
         <h1> Question 5</h1>               
           <table border='1'> <!-- creating table with border -->
                    <tr style='background-color: gold'> <!-- Creating heder row  -->
                        <td>
                            <h4>Customer ID</h4>
                        </td>
                        <td>
                            <h4>Status</h4>
                        </td>
                        <td>
                            <h4>Item</h4>
                        </td>
                    </tr>
                    <!-- accessing order element and using a for loop to go through its elements for each -->
                    <xsl:for-each select="//order">
                        <tr>
                            <td>
                                <xsl:value-of select="customerid" /> <!-- accessesing element data -->
                            </td>
                            <td>
                                <xsl:value-of select="status" />
                            </td>                            
                            <td>
                                <table border='1'> <!-- creating table inside a table  -->
                                    <tr style='background-color: lightblue'>
                                        <td> Name </td>
                                        <td> Price </td>
                                        <td> Quantity </td>
                                    </tr>
                                    <xsl:for-each select="item"> <!-- second for loop for each item -->
                                    <xsl:choose> <!-- beginning of choose stament - using when otherwise -->
                                    <xsl:when test="@instock='N'"> <!-- When checker -->
                                        <tr>
                                            <td style='background-color: red'> <!-- Apply some style -->
                                                <xsl:value-of select="name" />
                                            </td>
                                            <td style='background-color: red'>
                                                <xsl:value-of select="price" />
                                            </td>
                                            <td style='background-color: red'>
                                                <xsl:value-of select="qty" />
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise> <!-- otherwise do this if when not satisfied -->
                                        <tr>
                                            <td style='background-color: white'>
                                                <xsl:value-of select="name" />
                                            </td>
                                            <td style='background-color: white'>
                                                <xsl:value-of select="price" />
                                            </td>
                                            <td style='background-color: white'>
                                                <xsl:value-of select="qty" />
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:for-each>
                                    <!-- end of otherwise, choose and for loop-->
                                </table>
                            </td>  
                        </tr>
                    </xsl:for-each>
                </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>