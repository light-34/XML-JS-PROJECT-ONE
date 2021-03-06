<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
            <title>Modified</title>
         </head>
         <body> 
         <h1> Question 8 Redo </h1>           
           <table border='1'>
                    <tr>
                        <td>
                            <h4>Order ID</h4>
                        </td>
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
                    <xsl:for-each select="//order">
                        <tr>
                            <td>
                                <xsl:value-of select="@ordId"/>
                            </td>
                            <td>
                                <xsl:value-of select="@customerid"/>
                            </td>
                            <td>
                                <xsl:value-of select="status"/>
                            </td>  
                            <td>
                                <table border='1'>
                                    <tr>
                                        <td>Item-Instock</td> 
                                        <td>Item-ID</td>
                                        <td> Name </td>
                                        <td> Price </td>
                                        <td> Quantity </td>
                                    </tr>
                                    <xsl:for-each select="item"> 
                                    <xsl:sort select="@itemid"/>                               
                                    <xsl:choose>
                                    <xsl:when test="@instock='N'">
                                        <tr>
                                            <td style='background-color: red'>
                                                <xsl:value-of select="@instock"/>
                                            </td>
                                            <td style='background-color: red'>
                                                <xsl:value-of select="@itemid"/>
                                            </td>
                                            <td style='background-color: red'>
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
                                    <xsl:otherwise>
                                        <tr>
                                            <td style='background-color: white'>
                                                <xsl:value-of select="@instock"/>
                                            </td>
                                            <td style='background-color: white'>
                                                <xsl:value-of select="@itemid"/>
                                            </td>
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
                                </table>
                            </td> 
                        </tr>
                    </xsl:for-each>
                </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>