<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${sessionScope._letaoyp_u_.member}" />

<html>
<head>
<title>个人信息</title>
</head>
<body>
	<div class="block box">
        <div id="ur_here">
            <div class="Navigation">当前位置: <a href="${ctx}/">首页</a> <code>&gt;</code> 用户中心</div>
        </div>
    </div>
    <div class="blank"></div>
    <div class="block clearfix userpage">
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="AreaR">
            <div class="box">
                <div class="box_1">
                    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
                        <h5><span>个人资料</span></h5>
                        <div class="blank"></div>
                        <form name="formEdit" action="${ctx}/user/profile" method="post">
                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                                <tbody>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">出生日期： </td>
                                        <td width="72%" align="left" bgcolor="#FFFFFF">
                                            <select name="birthdayYear">
                                                <option value="1956">1956</option>
                                                <option value="1957">1957</option>
                                                <option value="1958">1958</option>
                                                <option value="1959">1959</option>
                                                <option value="1960">1960</option>
                                                <option value="1961">1961</option>
                                                <option value="1962">1962</option>
                                                <option value="1963">1963</option>
                                                <option value="1964">1964</option>
                                                <option value="1965">1965</option>
                                                <option value="1966">1966</option>
                                                <option value="1967">1967</option>
                                                <option value="1968">1968</option>
                                                <option value="1969">1969</option>
                                                <option value="1970">1970</option>
                                                <option value="1971">1971</option>
                                                <option value="1972">1972</option>
                                                <option value="1973">1973</option>
                                                <option value="1974">1974</option>
                                                <option value="1975">1975</option>
                                                <option value="1976">1976</option>
                                                <option value="1977">1977</option>
                                                <option value="1978">1978</option>
                                                <option value="1979">1979</option>
                                                <option value="1980">1980</option>
                                                <option value="1981">1981</option>
                                                <option value="1982">1982</option>
                                                <option value="1983">1983</option>
                                                <option value="1984">1984</option>
                                                <option value="1985">1985</option>
                                                <option value="1986">1986</option>
                                                <option value="1987">1987</option>
                                                <option value="1988">1988</option>
                                                <option value="1989">1989</option>
                                                <option value="1990">1990</option>
                                                <option value="1991">1991</option>
                                                <option value="1992">1992</option>
                                                <option value="1993">1993</option>
                                                <option value="1994">1994</option>
                                                <option value="1995">1995</option>
                                                <option value="1996">1996</option>
                                                <option value="1997">1997</option>
                                                <option value="1998">1998</option>
                                                <option value="1999">1999</option>
                                                <option value="2000">2000</option>
                                                <option value="2001">2001</option>
                                                <option value="2002">2002</option>
                                                <option value="2003">2003</option>
                                                <option value="2004">2004</option>
                                                <option value="2005">2005</option>
                                                <option value="2006">2006</option>
                                                <option value="2007">2007</option>
                                                <option value="2008">2008</option>
                                                <option value="2009">2009</option>
                                                <option value="2010">2010</option>
                                                <option value="2011">2011</option>
                                                <option value="2012">2012</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                            </select>&nbsp;
                                            <select name="birthdayMonth">
                                                <option value="1">01</option>
                                                <option value="2">02</option>
                                                <option value="3">03</option>
                                                <option value="4">04</option>
                                                <option value="5">05</option>
                                                <option value="6">06</option>
                                                <option value="7">07</option>
                                                <option value="8">08</option>
                                                <option value="9">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>&nbsp;
                                            <select name="birthdayDay">
                                                <option value="1">01</option>
                                                <option value="2">02</option>
                                                <option value="3">03</option>
                                                <option value="4">04</option>
                                                <option value="5">05</option>
                                                <option value="6">06</option>
                                                <option value="7">07</option>
                                                <option value="8">08</option>
                                                <option value="9">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>
                                                <option value="24">24</option>
                                                <option value="25">25</option>
                                                <option value="26">26</option>
                                                <option value="27">27</option>
                                                <option value="28">28</option>
                                                <option value="29">29</option>
                                                <option value="30">30</option>
                                                <option value="31">31</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">性　别： </td>
                                        <td width="72%" align="left" bgcolor="#FFFFFF">
                                            <input type="radio" name="sex" value="1" checked="checked"> 男&nbsp;&nbsp;
                                            <input type="radio" name="sex" value="2"> 女&nbsp;&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">电子邮件地址： </td>
                                        <td width="72%" align="left" bgcolor="#FFFFFF">
                                            <input name="email" type="text" value="${member.email}" size="25" class="inputBg"><span style="color:#FF0000"> *</span></td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field2i">QQ：</td>
                                        <td width="72%" align="left" bgcolor="#FFFFFF">
                                            <input name="extend_field2" type="text" class="inputBg" value="1176875123"><span style="color:#FF0000"> *</span> </td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">办公电话：</td>
                                        <td width="72%" align="left" bgcolor="#FFFFFF">
                                            <input name="extend_field3" type="text" class="inputBg" value="${member.phone}"> </td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field5i">手机：</td>
                                        <td width="72%" align="left" bgcolor="#FFFFFF">
                                            <input name="extend_field5" type="text" class="inputBg" value="${member.mobile}"><span style="color:#FF0000"> *</span> </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" bgcolor="#FFFFFF">
                                            <input name="act" type="hidden" value="act_edit_profile">
                                            <input name="submit" type="submit" value="确认修改" class="bnt_blue_1" style="border:none;">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <form name="formPassword" action="${ctx}/user/password" method="post">
                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                                <tbody>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">原密码：</td>
                                        <td width="76%" align="left" bgcolor="#FFFFFF">
                                            <input name="old_password" type="password" size="25" class="inputBg">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">新密码：</td>
                                        <td align="left" bgcolor="#FFFFFF">
                                            <input name="new_password" type="password" size="25" class="inputBg">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="28%" align="right" bgcolor="#FFFFFF">确认密码：</td>
                                        <td align="left" bgcolor="#FFFFFF">
                                            <input name="comfirm_password" type="password" size="25" class="inputBg">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" bgcolor="#FFFFFF">
                                            <input name="act" type="hidden" value="act_edit_password">
                                            <input name="submit" type="submit" class="bnt_blue_1" style="border:none;" value="确认修改">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>