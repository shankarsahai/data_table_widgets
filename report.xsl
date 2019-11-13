<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="iso-8859-1" indent="yes"/>

<xsl:param name="hdrFileName" />
<xsl:param name="ftrFileName" />
<xsl:param name="repTitle"/>
<xsl:param name="repName"/>
<xsl:param name="repBy"/>
<xsl:param name="repDate"/>
<xsl:param name="argsStr"/>
<xsl:param name="wd"/>
<xsl:param name="xd"/>
<xsl:param name="hd"/>
<xsl:param name="cond"/>
<xsl:param name="hdrflag"/>
<xsl:param name="ftrflag"/>

<xsl:template name="break-ln">
<xsl:param name="text"/>
<xsl:if test="contains($text,'X@@@X')">
<xsl:value-of select="substring-before($text,'X@@@X')"/>
<br/> 
<xsl:call-template name="break-ln">
<xsl:with-param name="text" select="substring-after($text,'X@@@X')"/>
</xsl:call-template>
</xsl:if>
<xsl:if test="not(contains($text,'X@@@X'))">
<xsl:value-of select="$text"/>
</xsl:if>
</xsl:template>

<xsl:template match="/">
<HTML>
<HEAD><TITLE> <xsl:value-of select="$repName" /> </TITLE>

<link rel="stylesheet" href="./styles/common.css" type="text/css"/>

</HEAD>
<BODY class="repBody">
<xsl:if test="$cond='T'">
<table width="100%" >
<tr class="reportGreyRow">
<td class="reportPanel"> 
VELMESSGE[M_Download_ReportIn]: <!-- Download the report in --> 
<A href='{$wd}' >
<img src="../images/jpg/word.GIF" title="VELLABEL[L_Word_Format]" alt="VELLABEL[L_Word_Format]" align="absmiddle" border="0"></img>
</A> 
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<A href='{$xd}' >
<img src="../images/jpg/excel.GIF" title="VELLABEL[L_Excel_Format]" alt="VELLABEL[L_Excel_Format]" align="absmiddle" border="0"></img>
</A>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<xsl:text>&#xa0;</xsl:text>
<A href='{$hd}' >
<img src="./images/printer.gif" title="VELLABEL[L_Printer_FriendlyFormat]" alt="VELLABEL[L_Printer_FriendlyFormat]" align="absmiddle" border="0"></img>
</A> 
</td>
</tr>
</table>
</xsl:if>
<xsl:apply-templates select="ROWSET"/>
</BODY>
</HTML>
</xsl:template> 

<xsl:template match="ROWSET">
<TABLE WIDTH="100%" >
<xsl:if test="$hdrflag='1'">
<TR>
<TD WIDTH="100%" ALIGN="CENTER">
<img src="{$hdrFileName}"/>
</TD>
</TR>
</xsl:if>
<TR>
<TD class="reportName" WIDTH="100%" ALIGN="CENTER">
<xsl:value-of select="$repName" />
</TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD class="reportData"  WIDTH="100%" ALIGN="LEFT">
VELLABEL[L_Selected_Filter_S]<!-- Selected Filter(s) -->: <xsl:value-of select="$argsStr" />
</TD>
</TR>
<tr><td>&#xa0;</td></tr> 
<tr>
<td class="reportData"><b>VELLABEL[L_Total_MatchingRows]<!-- Total Matching Rows -->: <xsl:value-of select="count(//ROW)" /></b></td>
</tr>
</TABLE>
<hr width="200%" class="thickLine" />


<TABLE WIDTH="200%" BORDER="1">
<TR>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Study_Number]<!-- VELLABEL[Std_Study] Number --></TH>
<TH class="reportHeading" WIDTH="20%" ALIGN="CENTER">VELLABEL[L_Study_Title]<!-- VELLABEL[Std_Study] Title --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Principal_Investigator]<!-- Principal Investigator --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Study_Contact]<!-- VELLABEL[Std_Study] Contact --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Division]<!-- Division --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Therapeutic_Area]<!-- Therapeutic Area --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Disease_Site]<!-- Disease Site --></TH>
<TH class="reportHeading" WIDTH="10%" ALIGN="CENTER">VELLABEL[L_Local_SampleSize]<!-- Local Sample Size --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_National_SampleSize]<!-- National Sample Size --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Phase]<!-- Phase --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Research_Type]<!-- Research Type --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Study_Scope]<!-- VELLABEL[Std_Study] Scope --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Study_Type]<!-- VELLABEL[Std_Study] Type --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Blinding]<!-- Blinding --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Randomization]<!-- Randomization --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Sponsored_By]<!-- Sponsored By --></TH>
<TH class="reportHeading" WIDTH="25%" ALIGN="CENTER">VELLABEL[L_Study_Details]<!-- VELLABEL[Std_Study] Details --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELMESSGE[M_StdOpenFor_EnrlDt]<!-- VELLABEL[Std_Study] Open for Enrollment Date --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELMESSGE[M_StdClosedTo_AccrualDt]<!-- VELLABEL[Std_Study] Closed to Accrual Date --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Std_RetiredDt]<!-- VELLABEL[Std_Study] Retired Date --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELMESSGE[M_IrbStatApproved_FromDt]<!-- IRB Status Approved Valid From Date --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELMESSGE[M_IrbStatApproved_UntilDt]<!-- IRB Status Approved Valid Until Date --></TH>
<TH class="reportHeading" WIDTH="5%" ALIGN="CENTER">VELLABEL[L_Patient_Accrued]<!-- VELLABEL[Pat_Patients] Accrued --></TH>
</TR>



<xsl:for-each select="ROW">


<xsl:choose>
<xsl:when test="number(position() mod 2)=0" >
<TR class="reportEvenRow">
<TD class="reportData"><xsl:value-of select="STUDY_NUMBER" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_TITLE" /></TD>
<TD class="reportData"><xsl:value-of select="PI" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_CONTACT" /></TD>
<TD class="reportData"><xsl:value-of select="DIVISION" /></TD>
<TD class="reportData"><xsl:value-of select="TAREA" /></TD>
<TD class="reportData"><xsl:value-of select="DISEASE_SITE" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_SAMPLSIZE" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_NSAMPLSIZE" /></TD>
<TD class="reportData"><xsl:value-of select="PHASE" /></TD>
<TD class="reportData"><xsl:value-of select="RESTYPE" /></TD>
<TD class="reportData"><xsl:value-of select="SCOPE" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_TYPE" /></TD>
<TD class="reportData"><xsl:value-of select="BLIND" /></TD>
<TD class="reportData"><xsl:value-of select="RANDOM" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_SPONSOR" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_DETAILS" /></TD>
<TD class="reportData"><xsl:value-of select="OPEN_FOR_ENROLL_DT" /></TD>
<TD class="reportData"><xsl:value-of select="CLOSED_TO_ACCR_DT" /></TD>
<TD class="reportData"><xsl:value-of select="RETIRED_DT" /></TD>
<TD class="reportData"><xsl:value-of select="CHRSTAT_VALIDFRM_DT" /></TD>
<TD class="reportData"><xsl:value-of select="CHRSTAT_VALIDUNTIL_DT" /></TD>
<TD class="reportData"><xsl:value-of select="PATIENTS_ACCRUED" /></TD>
</TR>
</xsl:when> 
<xsl:otherwise>
<TR class="reportOddRow">
<TD class="reportData"><xsl:value-of select="STUDY_NUMBER" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_TITLE" /></TD>
<TD class="reportData"><xsl:value-of select="PI" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_CONTACT" /></TD>
<TD class="reportData"><xsl:value-of select="DIVISION" /></TD>
<TD class="reportData"><xsl:value-of select="TAREA" /></TD>
<TD class="reportData"><xsl:value-of select="DISEASE_SITE" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_SAMPLSIZE" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_NSAMPLSIZE" /></TD>
<TD class="reportData"><xsl:value-of select="PHASE" /></TD>
<TD class="reportData"><xsl:value-of select="RESTYPE" /></TD>
<TD class="reportData"><xsl:value-of select="SCOPE" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_TYPE" /></TD>
<TD class="reportData"><xsl:value-of select="BLIND" /></TD>
<TD class="reportData"><xsl:value-of select="RANDOM" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_SPONSOR" /></TD>
<TD class="reportData"><xsl:value-of select="STUDY_DETAILS" /></TD>
<TD class="reportData"><xsl:value-of select="OPEN_FOR_ENROLL_DT" /></TD>
<TD class="reportData"><xsl:value-of select="CLOSED_TO_ACCR_DT" /></TD>
<TD class="reportData"><xsl:value-of select="RETIRED_DT" /></TD>
<TD class="reportData"><xsl:value-of select="CHRSTAT_VALIDFRM_DT" /></TD>
<TD class="reportData"><xsl:value-of select="CHRSTAT_VALIDUNTIL_DT" /></TD>
<TD class="reportData"><xsl:value-of select="PATIENTS_ACCRUED" /></TD>
</TR>
</xsl:otherwise>
</xsl:choose> 



</xsl:for-each>


</TABLE>

<hr width="200%" class="thickLine" />
<TABLE WIDTH="100%" >
<TR>
<TD class="reportFooter" WIDTH="50%" ALIGN="LEFT">
VELLABEL[L_Report_By]<!-- Report By -->:<xsl:value-of select="$repBy" />
</TD>
<TD class="reportFooter" WIDTH="50%" ALIGN="RIGHT">
VELLABEL[L_Date]<!-- Date -->:<xsl:value-of select="$repDate" />
</TD>
</TR>
</TABLE>
<xsl:if test="$ftrflag='1'">
<TABLE>
<TR>
<TD WIDTH="100%" ALIGN="CENTER">
<img src="{$ftrFileName}"/>
</TD>
</TR>
</TABLE>
</xsl:if>
</xsl:template> 
</xsl:stylesheet>
