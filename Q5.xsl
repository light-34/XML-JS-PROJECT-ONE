<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
            <title>Modified</title>
         </head>
         <body>            
           <table border='1'>
                    <tr>
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
                                <xsl:value-of select="customerid" />
                            </td>
                            <td>
                                <xsl:value-of select="status" />
                            </td>
                            <xsl:if test="//item[@instock='N']">
                            <td>
                                <table border='1'>
                                    <tr>
                                        <td> Name </td>
                                        <td> Price </td>
                                        <td> Quantity </td>
                                    </tr>
                                    <xsl:for-each select="item">
                                        <tr>
                                            <td bgColor="red">
                                                <xsl:value-of select="name" />
                                            </td>
                                            <td bgColor="red">
                                                <xsl:value-of select="price" />
                                            </td>
                                            <td bgColor="red">
                                                <xsl:value-of select="qty" />
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                            </xsl:if>
                            <xsl:else>
                                <td>
                                <table border='1'>
                                    <tr>
                                        <td> Name </td>
                                        <td> Price </td>
                                        <td> Quantity </td>
                                    </tr>
                                    <xsl:for-each select="item">
                                        <tr>
                                            <td bgColor="white">
                                                <xsl:value-of select="name" />
                                            </td>
                                            <td bgColor="white">
                                                <xsl:value-of select="price" />
                                            </td>
                                            <td bgColor="white">
                                                <xsl:value-of select="qty" />
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                                </td>
                            </xsl:else>
                        </tr>
                    </xsl:for-each>
                </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>