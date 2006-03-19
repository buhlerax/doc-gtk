<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0">

<xsl:output method="text"
            encoding="ISO-8859-1"
            indent="no" 
	    />

<xsl:template match="*" />

<xsl:template match="classentry">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="classname" >
    <xsl:value-of select="./classmeta/classtitle"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$classname='</xsl:text>
  <xsl:value-of select="$classname"/>
  <xsl:text disable-output-escaping="yes">'"&gt;&#xA;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&#xA;&lt;/xsl:when&gt;&#xA;</xsl:text>
</xsl:template>

<xsl:template match="prop">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="propname" >
    <xsl:value-of select="./propname"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="($propname='</xsl:text>
  <xsl:value-of select="$propname"/>
  <xsl:text disable-output-escaping="yes">' and $class='no') or ($propname='</xsl:text>
  <xsl:value-of select="$propname"/>
  <xsl:text disable-output-escaping="yes">' and $class='</xsl:text>
  <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
  <xsl:text disable-output-escaping="yes">')"&gt;&#xA;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&#xA;&lt;/xsl:when&gt;&#xA;</xsl:text>
</xsl:template>

<xsl:template match="method|constructor">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="funcname" >
    <xsl:value-of select="./funcsynopsis/funcprototype/funcdef/function"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="($funcname='</xsl:text>
  <xsl:value-of select="$funcname"/>
  <xsl:text disable-output-escaping="yes">' and $class='no') or ($funcname='</xsl:text>
  <xsl:value-of select="$funcname"/>
  <xsl:text disable-output-escaping="yes">' and $class='</xsl:text>
  <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
  <xsl:text disable-output-escaping="yes">')"&gt;&#xA;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&#xA;&lt;/xsl:when&gt;&#xA;</xsl:text>
</xsl:template>

<xsl:template match="attribute">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="attrname" >
    <xsl:value-of select="./attributename"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$attrname='</xsl:text>
  <xsl:value-of select="$attrname"/>
  <xsl:text disable-output-escaping="yes">'"&gt;&#xA;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&#xA;&lt;/xsl:when&gt;&#xA;</xsl:text>
</xsl:template>

<xsl:template match="signal">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="signame" >
    <xsl:value-of select="./signalname"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$signame='</xsl:text>
  <xsl:value-of select="$signame"/>
  <xsl:text disable-output-escaping="yes">'"&gt;&#xA;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&#xA;&lt;/xsl:when&gt;&#xA;</xsl:text>
</xsl:template>
 

<xsl:template match="/">
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0"&gt;&#xA;&#xA;

  &lt;xsl:template name="get_id_from_name"&gt;&#xA;
  &lt;xsl:param name="classname" /&gt;&#xA;
  &lt;xsl:choose&gt;&#xA;
 </xsl:text>
 <xsl:apply-templates select=".//classentry" />
 <xsl:text disable-output-escaping="yes">&#xA;
  &lt;xsl:otherwise&gt;&#xA;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;&#xA;
  &lt;/xsl:otherwise&gt;&#xA;
  &lt;/xsl:choose&gt;&#xA;
  &lt;/xsl:template&gt;&#xA;
 </xsl:text>

  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_func_id_from_name"&gt;&#xA;
  &lt;xsl:param name="funcname" /&gt;&#xA;
  &lt;xsl:param name="class" select="'no'" /&gt;&#xA;
  &lt;xsl:choose&gt;&#xA;
 </xsl:text>
 <xsl:apply-templates select=".//method|.//constructor" />
 <xsl:text disable-output-escaping="yes">&#xA;
  &lt;xsl:otherwise&gt;&#xA;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;&#xA;
  &lt;/xsl:otherwise&gt;&#xA;
  &lt;/xsl:choose&gt;&#xA;
  &lt;/xsl:template&gt;&#xA;
 </xsl:text>

  <xsl:if test="count(.//prop)>0">
  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_prop_id_from_name"&gt;&#xA;
  &lt;xsl:param name="propname" /&gt;&#xA;
  &lt;xsl:param name="class" select="no" /&gt;&#xA;
  &lt;xsl:choose&gt;&#xA;
 </xsl:text>
 <xsl:apply-templates select=".//prop" />
 <xsl:text disable-output-escaping="yes">&#xA;
  &lt;xsl:otherwise&gt;&#xA;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;&#xA;
  &lt;/xsl:otherwise&gt;&#xA;
  &lt;/xsl:choose&gt;&#xA;
  &lt;/xsl:template&gt;&#xA;
 </xsl:text>
 </xsl:if>
 
  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_sig_id_from_name"&gt;&#xA;
  &lt;xsl:param name="signame" /&gt;&#xA;
  </xsl:text>
   <xsl:text disable-output-escaping="yes">
    &lt;xsl:choose&gt;&#xA;
   </xsl:text>
  <xsl:apply-templates select=".//signal" />
  <xsl:text disable-output-escaping="yes">&#xA;
   &lt;xsl:otherwise&gt;&#xA;
  </xsl:text>
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:text&gt;no&lt;/xsl:text&gt;&#xA;
 </xsl:text>
  <xsl:text disable-output-escaping="yes">
  &lt;/xsl:otherwise&gt;&#xA;
  &lt;/xsl:choose&gt;&#xA; 
 </xsl:text>
 <xsl:text>
   &lt;/xsl:template&gt;&#xA;
   &lt;/xsl:stylesheet&gt;
 </xsl:text>
</xsl:template>

</xsl:stylesheet>
