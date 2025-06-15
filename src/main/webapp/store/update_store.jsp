<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>

<%
    StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>

<html>
<head>
<title>門市資料修改 - update_store.jsp</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<style>
  body {
    background-color: #fff3e0;
    font-family: 'Microsoft JhengHei', sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
  }

  #table-1 {
    width: 600px;
    background-color: #fffefb;
    margin: 30px auto 10px auto;
    border: 3px solid #d7a86e;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 2px 2px 10px #d7a86e;
    text-align: center;
  }

  #table-1 h3 {
    color: #6b3e26;
    margin: 10px 0 5px 0;
  }

  #table-1 h4 a {
    color: #a8714e;
    text-decoration: none;
    font-size: 16px;
  }

  #table-1 img {
    width: 150px;
    height: 150px;
    border: 0;
  }

  table.form-table {
    width: 600px;
    background-color: #fffaf5;
    margin: 20px auto;
    border-collapse: separate;
    border-spacing: 10px;
  }

  table.form-table td {
    padding: 8px;
    color: #4e342e;
    text-align: left;
  }

  input[type="text"], select {
    padding: 6px;
    width: 90%;
    border: 1px solid #d7a86e;
    border-radius: 5px;
    font-size: 14px;
  }

  input[type="submit"] {
    background: linear-gradient(to bottom, #d7a86e, #c6975c);
    color: white;
    border: none;
    border-radius: 20px;
    padding: 10px 25px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s;
    margin-top: 20px;
  }

  input[type="submit"]:hover {
    background: linear-gradient(to bottom, #c6975c, #b97d48);
  }

  .error {
    color: red;
    font-weight: bold;
  }
</style>

</head>
<body>

<!-- 頁首 -->
<table id="table-1">
  <tr>
    <td>
      <h3>門市資料修改</h3>
      <h4><a href="select_page.jsp"><img src="images/EatfastLogo.png">回首頁</a></h4>
    </td>
  </tr>
</table>

<!-- 錯誤訊息 -->
<c:if test="${not empty errorMsgs}">
  <div class="error">請修正以下錯誤:</div>
  <ul style="color:red;">
    <c:forEach var="message" items="${errorMsgs}">
      <li>${message}</li>
    </c:forEach>
  </ul>
</c:if>

<!-- 修改表單 -->
<form method="post" action="store.do" name="form1">
  <table class="form-table">
    <tr>
      <td>門市編號:<font color="red"><b>*</b></font></td>
      <td><%=storeVO.getStoreId()%></td>
    </tr>
    <tr>
      <td>門市名稱:</td>
      <td><input type="text" name="storeName" value="<%=storeVO.getStoreName()%>" /></td>
    </tr>
    <tr>
      <td>門市地點:</td>
      <td><input type="text" name="storeLoc" value="<%=storeVO.getStoreLoc()%>" /></td>
    </tr>
    <tr>
      <td>門市電話:</td>
      <td><input type="text" name="storePhone" value="<%=storeVO.getStorePhone()%>" /></td>
    </tr>
    <tr>
      <td>營業時間:</td>
      <td><input type="text" name="storeTime" value="<%=storeVO.getStoreTime()%>" /></td>
    </tr>
    <tr>
      <td>門市狀態:</td>
      <td><input type="text" name="storeStatus" value="<%=storeVO.getStoreStatus()%>" /></td>
    </tr>
    <tr>
      <td>建立日期:</td>
      <td><input name="createTime" id="f_date1" type="text" /></td>
    </tr>
  </table>

  <input type="hidden" name="action" value="update" />
  <input type="hidden" name="storeId" value="<%=storeVO.getStoreId()%>" />
  <input type="submit" value="送出修改" />
</form>

<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />

<!-- 日期選擇器 -->
<%
  java.sql.Timestamp CreateTime = null;
  try {
    CreateTime = storeVO.getCreateTime();
  } catch (Exception e) {
    CreateTime = new java.sql.Timestamp(System.currentTimeMillis());
  }
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
  $.datetimepicker.setLocale('zh');
  $('#f_date1').datetimepicker({
    theme: '',
    timepicker: false,
    step: 1,
    format: 'Y-m-d H:i:s',
    value: '<%=CreateTime%>'
  });
</script>

</body>
</html>
