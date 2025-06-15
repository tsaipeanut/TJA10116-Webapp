<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>

<%
    StoreService storeSvc = new StoreService();
    List<StoreVO> list = storeSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
  <title>所有門市資料 - listAllStore.jsp</title>
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

    .container {
      width: 90%;
      max-width: 1000px;
      margin: 0 auto;
      background-color: #fff8e7;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(180, 140, 100, 0.3);
    }

    .header {
      text-align: center;
      margin-bottom: 20px;
    }

    .header h3 {
      color: #7b4f3d;
      margin-bottom: 10px;
    }

    .header h4 a {
      text-decoration: none;
      color: #a36b4f;
    }

    .header h4 a:hover {
      text-decoration: underline;
    }
    
    header h5 a:hover {
      text-decoration: underline;
      
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    table, th, td {
      border: 1px solid #e2cbb1;
    }

    th {
      background-color: #f4e4ce;
      color: #5a3926;
      padding: 10px;
    }

    td {
      padding: 8px;
      text-align: center;
    }

    input[type="submit"] {
      background-color: #d4b48c;
      color: white;
      border: none;
      border-radius: 6px;
      padding: 5px 12px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #b79873;
    }

    .logo-link img {
      width: 120px;
      height: auto;
    }

  </style>
</head>

<body>

  <div class="container">
    <div class="header">
    
    <table id="table-1">
    <tr>
    <td>
      <h3>所有門市資料</h3>
      <h4>
        <a class="logo-link" >
          <img src="images/EatfastLogo.png" > 
        </a>
      </h4>
      <h5><a href="select_page.jsp">回首頁</a></h5>
      
      </td>
  	</tr>
      </table>
    </div>
   

    <table>
      <tr>
        <th>門市編號</th>
        <th>門市名稱</th>
        <th>門市地點</th>
        <th>門市電話</th>
        <th>營業時間</th>
        <th>門市狀態</th>
        <th>建立時間</th>
        <th>修改</th>
        <th>刪除</th>
      </tr>

      <%@ include file="page1.file" %>

      <c:forEach var="storeVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
        <tr>
          <td>${storeVO.storeId}</td>
          <td>${storeVO.storeName}</td>
          <td>${storeVO.storeLoc}</td>
          <td>${storeVO.storePhone}</td>
          <td>${storeVO.storeTime}</td>
          <td>${storeVO.storeStatus}</td>
          <td>${storeVO.createTime}</td>
          <td>
            <form method="post" action="${pageContext.request.contextPath}/store/store.do" style="margin: 0;">
              <input type="hidden" name="storeId" value="${storeVO.storeId}">
              <input type="hidden" name="action" value="getOne_For_Update">
              <input type="submit" value="修改">
            </form>
          </td>
          <td>
            <form method="post" action="${pageContext.request.contextPath}/store/store.do" style="margin: 0;">
              <input type="hidden" name="storeId" value="${storeVO.storeId}">
              <input type="hidden" name="action" value="delete">
              <input type="submit" value="刪除">
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>

    <%@ include file="page2.file" %>
  </div>
</body>
</html>
