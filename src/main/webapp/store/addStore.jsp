<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>

<%
    StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
    java.sql.Timestamp CreateTime = null;
    try {
        CreateTime = storeVO.getCreateTime();
    } catch (Exception e) {
        CreateTime = new java.sql.Timestamp(System.currentTimeMillis());
    }
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>門市資料新增 - addStore.jsp</title>


<style>
  body {
    background-color: #fff3e0;
    font-family: 'Microsoft JhengHei', sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
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

  h3 {
    color: #6b3e26;
    margin-top: 30px;
  }

  .error {
    color: red;
    font-weight: bold;
    margin-bottom: 10px;
  }

  form {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  table.form-table {
    background-color: #fffefb;
    border-collapse: collapse;
    width: 500px;
    margin: 0 auto;
  }

  .form-table td {
    padding: 10px;
    text-align: left;
  }

  .form-table input[type="text"] {
    width: 100%;
    padding: 6px;
    border: 1px solid #d7a86e;
    border-radius: 5px;
    font-size: 14px;
  }

  input[type="submit"] {
    background: linear-gradient(to bottom, #d7a86e, #c6975c);
    color: white;
    border: none;
    border-radius: 20px;
    padding: 10px 30px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 20px;
    transition: background 0.3s;
  }

  input[type="submit"]:hover {
    background: linear-gradient(to bottom, #c6975c, #b97d48);
  }
</style>

<!-- 日期時間選擇器樣式 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
    $.datetimepicker.setLocale('zh');
    $(function() {
        $('#f_date1').datetimepicker({
            theme: '',
            timepicker: false,
            step: 1,
            format: 'Y-m-d H:i:s',
            value: '<%=CreateTime%>'
        });
    });
</script>
</head>

<body>

<!-- 標題區塊 -->
<table id="table-1">
  <tr>
    <td>
      <h3>門市資料新增 - addStore.jsp</h3>
      <h4><a href="select_page.jsp"><img src="images/EatfastLogo.png">回首頁</a></h4>
    </td>
  </tr>
</table>

<h3>資料新增</h3>

<!-- 錯誤訊息區塊 -->
<c:if test="${not empty errorMsgs}">
  <div class="error">請修正以下錯誤:</div>
  <ul style="color:red;">
    <c:forEach var="message" items="${errorMsgs}">
      <li>${message}</li>
    </c:forEach>
  </ul>
</c:if>

<!-- 表單區塊 -->
<form method="post" action="store.do" name="form1">
  <table class="form-table">
    <tr>
      <td>門市名稱：</td>
      <td><input type="text" name="storeName" value="<%= (storeVO==null)? "一號店" : storeVO.getStoreName()%>"/></td>
    </tr>
    <tr>
      <td>門市地點：</td>
      <td><input type="text" name="storeLoc" value="<%= (storeVO==null)? "台北市中山區南京東路三段219號4F" : storeVO.getStoreLoc()%>"/></td>
    </tr>
    <tr>
      <td>門市電話：</td>
      <td><input type="text" name="storePhone" value="<%= (storeVO==null)? "0227120589" : storeVO.getStorePhone()%>"/></td>
    </tr>
    <tr>
      <td>營業時間：</td>
      <td><input type="text" name="storeTime" value="<%= (storeVO==null)? "平日05:30~14:00 / 假日07:00~16:00 周三公休" : storeVO.getStoreTime()%>"/></td>
    </tr>
    <tr>
      <td>門市狀態：</td>
      <td><input type="text" name="storeStatus" value="<%= (storeVO==null)? "營業中" : storeVO.getStoreStatus()%>"/></td>
    </tr>

  </table>

  <input type="hidden" name="action" value="insert"/>
  <input type="submit" value="送出新增"/>
</form>

</body>
</html>
