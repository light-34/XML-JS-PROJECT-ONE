<?xml version="1.0" ?>
<xsl:stylesheet version = "1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <table border='1'>
                    <xsl:for-each select="//order">
                        <tr>
                        <td> Order Id : <xsl:value-of select="@ordId" /></td>
                        </tr>
                        <tr>
                        <td>
                                <table border='1'>
                                    <tr>
                                        <td> Name </td>
                                        <td> Customer Id </td>
                                        <td> Status  </td>
                                        <td> Item Id </td>
                                        <td> Instock </td>
                                        <td> Price </td>
                                        <td> Quantity </td>
                                    </tr>
                                    <xsl:for-each select="item">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="name" />
                                            </td>
                                            <td> <xsl:value-of select="../customerid" /></td>
                                            <td> <xsl:value-of select="../status" /> </td>
                                            <td> <xsl:value-of select="@itemid" /> </td>
                                            <td> <xsl:value-of select="@instock" /> </td>
                                            <td>
                                                <xsl:value-of select="price" />
                                            </td>
                                            <td>
                                                <xsl:value-of select="qty" />
                                            </td>
                                        </tr>
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