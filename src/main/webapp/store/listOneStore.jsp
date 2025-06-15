<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.store.model.*"%>

<%
    StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>

<html>
<head>
<title>門市資料 - listOneStore.jsp</title>

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

  table.detail-table {
    width: 90%;
    max-width: 900px;
    background-color: #fffefb;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(215, 168, 110, 0.4);
  }

  table.detail-table th {
    background-color: #f4e2ce;
    color: #6b3e26;
    padding: 10px;
    border: 1px solid #e0c8a2;
  }

  table.detail-table td {
    padding: 10px;
    border: 1px solid #e0c8a2;
    color: #4e342e;
    background-color: #fffaf5;
  }

  a {
    color: #8c4c3a;
    text-decoration: none;
    font-weight: bold;
  }

  a:hover {
    text-decoration: underline;
  }
</style>
</head>

<body>

<!-- 頁首 -->
<table id="table-1">
  <tr>
    <td>
      <h3>門市資料 - listOneStore.jsp</h3>
      <h4><a href="select_page.jsp"><img src="images/EatfastLogo.png">回首頁</a></h4>
    </td>
  </tr>
</table>

<!-- 資料表 -->
<table class="detail-table">
  <tr>
    <th>門市編號</th>
    <th>門市名稱</th>
    <th>門市地點</th>
    <th>門市電話</th>
    <th>營業時間</th>
    <th>門市狀態</th>
    <th>建立時間</th>
  </tr>
  <tr>
    <td>${storeVO.storeId}</td>
    <td>${storeVO.storeName}</td>
    <td>${storeVO.storeLoc}</td>
    <td>${storeVO.storePhone}</td>
    <td>${storeVO.storeTime}</td>
    <td>${storeVO.storeStatus}</td>
    <td>${storeVO.createTime}</td>
  </tr>
</table>

</body>
</html>
