<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>EAT FAST 早餐通</title>
<style>
  body {
    background-color: #fff3e0;
    font-family: 'Microsoft JhengHei', sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
  }

  table#table-1 {
    width: 700px;
    background-color: #fffefb;
    margin: 30px auto 10px auto;
    border: 3px solid #d7a86e;
    border-radius: 10px;
    padding: 0px;
    box-shadow: 2px 2px 10px #d7a86e;
    text-align: center;
    
  }

  table#table-1 h3 {
    color: #6b3e26;
    margin: 10px 0 5px 0;
  }

  table#table-1 h4 {
    color: #a8714e;
    margin: 5px 0;
  }

  h3 {
    color: #6b3e26;
    margin-top: 30px;
  }
  
  h4 {
    color: #6b3e26;
    margin-top: 30px;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  ul li {
    margin: 20px 0;
  }

  form {
    display: inline-block;
    margin-top: 10px;
  }

  select, input[type="text"] {
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
    padding: 8px 20px;
    margin-left: 10px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s;
  }

  input[type="submit"]:hover {
    background: linear-gradient(to bottom, #c6975c, #b97d48);
  }

  a {
    color: #8c4c3a;
    text-decoration: none;
    font-weight: bold;
  }

  a:hover {
    text-decoration: underline;
  }

  .error {
    color: red;
    font-weight: bold;
  }
</style>
</head>

<body>

<table id="table-1">
  <tr>
    <td>
      <h3>EAT FAST 早餐通</h3>
      <h4>門市據點查詢</h4>
      <h5><img src="images/EatfastLogo.png" width="150" height="150" border="0"></h5>
    </td>
  </tr>
</table>

<h3>資料查詢</h3>


<!-- 錯誤訊息顯示 -->
<c:if test="${not empty errorMsgs}">
  <div class="error">請修正以下錯誤:</div>
  <ul>
    <c:forEach var="message" items="${errorMsgs}">
      <li class="error">${message}</li>
    </c:forEach>
  </ul>
</c:if>

  <li><a href='listAllStore.jsp'>List</a> all Stores.  <br><br></li>

<ul style="display: flex; flex-direction: column; align-items: center; gap: 15px;">
  <jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />

  <li style="display: flex; align-items: center; gap: 10px;">
    <form method="post" action="store.do" style="display: flex; align-items: center;">
    
      <label style="width: 120px; text-align: right;"><b>輸入門市編號：</b></label>
      <input type="text" name="storeId" placeholder="例如：1" />
      <input type="hidden" name="action" value="getOne_For_Display" />
      <input type="submit" value="查詢" />
    </form>
  </li>

  <li style="display: flex; align-items: center; gap: 10px;">
    <form method="post" action="store.do" style="display: flex; align-items: center;">
    
      <label style="width: 120px; text-align: right;"><b>選擇門市編號：</b></label>
      <select name="storeId">
        <c:forEach var="storeVO" items="${storeSvc.all}">
          <option value="${storeVO.storeId}">${storeVO.storeId}</option>
        </c:forEach>
        
      </select>
      <input type="hidden" name="action" value="getOne_For_Display" />
      <input type="submit" value="查詢" />
    </form>
  </li>

  <li style="display: flex; align-items: center; gap: 10px;">
    <form method="post" action="store.do" style="display: flex; align-items: center;">
    
      <label style="width: 120px; text-align: right;"><b>選擇門市名稱：</b></label>
      <select name="storeId">
        <c:forEach var="storeVO" items="${storeSvc.all}">
          <option value="${storeVO.storeId}">${storeVO.storeName}</option>
        </c:forEach>
      
      </select>
      <input type="hidden" name="action" value="getOne_For_Display" />
      <input type="submit" value="查詢" />
    </form>
  </li>
</ul>

<h4>門市管理</h4>

<ul>
  <li><a href='addStore.jsp'>Add</a> 加入新門市 </li>
</ul>


</body>
</html>
