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
                        <td>
                            <h4>Item-Name</h4>
                        </td>
                        <td>
                            <h4>Item-Price</h4>
                        </td> 
                        <td>
                            <h4>Item-Qty</h4>
                        </td>                    
                    </tr>
                    <xsl:for-each select="//order">
                    <xsl:choose>
                        <xsl:when test="item[@instock='N']">
                            <tr style='background-color: red'>
                                <td>
                                    <xsl:value-of select="customerid"/>
                                </td>
                                <td>
                                    <xsl:value-of select="status"/>
                                </td>  
                                <td>
                                    <xsl:value-of select="item"/>
                                </td> 
                                <xsl:for-each select="//item">                               
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>  
                                <td>
                                    <xsl:value-of select="price"/>
                                </td>
                                <td>
                                    <xsl:value-of select="qty"/>
                                </td>
                                </xsl:for-each>                                                                                                                                      
                            </tr>
                            </xsl:when>
                            <xsl:otherwise>
                            <tr>
                                <td>
                                    <xsl:value-of select="customerid"/>
                                </td>
                                <td>
                                    <xsl:value-of select="status"/>
                                </td> 
                                <td>
                                    <xsl:value-of select="item"/>
                                </td>                                
                                <xsl:for-each select="//item">                               
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>  
                                <td>
                                    <xsl:value-of select="price"/>
                                </td>
                                <td>
                                    <xsl:value-of select="qty"/>
                                </td>
                                </xsl:for-each>                                                                                                                                    
                            </tr>
                            </xsl:otherwise>
                            </xsl:choose>
                    </xsl:for-each>
                </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>