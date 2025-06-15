package com.store.controller;

import java.io.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store.model.StoreService;
import com.store.model.StoreVO;



public class StoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("storeId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入門市編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer storeId = null;
				try {
					storeId = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("門市編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				StoreService storeSvc = new StoreService();
				StoreVO storeVO = storeSvc.getOneStore(storeId);
				if (storeVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("storeVO", storeVO); // 資料庫取出的storeVO物件,存入req
				String url = "/store/listOneStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneStore.jsp
				successView.forward(req, res);
		}
		
		//新增
		if ("getOne_For_Update".equals(action)) { // 來自listAllStore.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer storeId = Integer.valueOf(req.getParameter("storeId"));
				
				/***************************2.開始查詢資料****************************************/
				StoreService storeSvc = new StoreService();
				StoreVO storeVO = storeSvc.getOneStore(storeId);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("storeVO", storeVO);         // 資料庫取出的storeVO物件,存入req
				String url = "/store/update_store.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_store.jsp
				successView.forward(req, res);
		}
		
		
		if ("update".equals(action)) { // 來自update_store.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer storeId = Integer.valueOf(req.getParameter("storeId").trim());
				
				String storeName = req.getParameter("storeName");
				String storeNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (storeName == null || storeName.trim().length() == 0) {
					errorMsgs.add("門市名稱: 請勿空白");
				} else if(!storeName.trim().matches(storeNameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("門市名稱: 只能是中文 , 且長度必需在2到10之間");
	            }
				
				String storeLoc = req.getParameter("storeLoc").trim();
				if (storeLoc == null || storeLoc.trim().length() == 0) {
					errorMsgs.add("門市地點請勿空白");
				}	
				
				String storePhone = req.getParameter("storePhone").trim();
				if (storePhone == null || storePhone.trim().length() == 0) {
					errorMsgs.add("門市電話請勿空白");
				}	
				
				String storeTime = req.getParameter("storeTime").trim();
				if (storeTime == null || storeTime.trim().length() == 0) {
					errorMsgs.add("營業時間請勿空白");
				}	
				
				String storeStatus = req.getParameter("storeStatus").trim();
				if (storeStatus == null || storeStatus.trim().length() == 0) {
					errorMsgs.add("營業狀態請勿空白");
				}	
				
				java.sql.Timestamp createTime = null;
				try {
					createTime = java.sql.Timestamp.valueOf(req.getParameter("createTime").trim());
				} catch (IllegalArgumentException e) {
					createTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}


				StoreVO storeVO = new StoreVO();
				storeVO.setStoreId(storeId);
				storeVO.setStoreName(storeName);
				storeVO.setStoreLoc(storeLoc);
				storeVO.setStorePhone(storePhone);
				storeVO.setStoreTime(storeTime);
				storeVO.setStoreStatus(storeStatus);
				storeVO.setCreateTime(createTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("storeVO", storeVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/update_store.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				StoreService storeSvc = new StoreService();
				storeVO = storeSvc.updateStore(storeId, storeName, storeLoc, storePhone, storeTime, storeStatus, createTime);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("storeVO", storeVO); // 資料庫update成功後,正確的的storeVO物件,存入req
				String url = "/store/listOneStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自 addStore.jsp 的請求

		    List<String> errorMsgs = new LinkedList<String>();
		    req.setAttribute("errorMsgs", errorMsgs);

		    /********** 1.接收請求參數 - 輸入格式的錯誤處理 **********/

		    String storeName = req.getParameter("storeName");
		    String storeNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
		    
		    if (storeName == null || storeName.trim().isEmpty()) {
		        errorMsgs.add("門市名稱: 請勿空白");
		    } else if (!storeName.trim().matches(storeNameReg)) {
		        errorMsgs.add("門市名稱: 只能是中文 , 且長度必需在2到10之間");
		    } else {
		        storeName = storeName.trim();
		    }

		    String storeLoc = req.getParameter("storeLoc");
		    if (storeLoc == null || storeLoc.trim().isEmpty()) {
		        errorMsgs.add("門市地點請勿空白");
		    } else {
		        storeLoc = storeLoc.trim();
		    }

		    String storePhone = req.getParameter("storePhone");
		    if (storePhone == null || storePhone.trim().isEmpty()) {
		        errorMsgs.add("門市電話請勿空白");
		    } else {
		        storePhone = storePhone.trim();
		    }

		    String storeTime = req.getParameter("storeTime");
		    if (storeTime == null || storeTime.trim().isEmpty()) {
		        errorMsgs.add("營業時間請勿空白");
		    } else {
		        storeTime = storeTime.trim();
		    }

		    String storeStatus = req.getParameter("storeStatus");
		    if (storeStatus == null || storeStatus.trim().isEmpty()) {
		        errorMsgs.add("營業狀態請勿空白");
		    } else {
		        storeStatus = storeStatus.trim();
		    }
				
		    /********** 封裝 VO **********/
		    StoreVO storeVO = new StoreVO();
		    storeVO.setStoreName(storeName);
		    storeVO.setStoreLoc(storeLoc);
		    storeVO.setStorePhone(storePhone);
		    storeVO.setStoreTime(storeTime);
		    storeVO.setStoreStatus(storeStatus);

		    if (!errorMsgs.isEmpty()) {
		        req.setAttribute("storeVO", storeVO);
		        RequestDispatcher failureView = req.getRequestDispatcher("/store/addStore.jsp");
		        failureView.forward(req, res);
		        return;
		    }

		    /********** 2.開始新增資料 **********/
		    StoreService storeSvc = new StoreService();
		    storeVO = storeSvc.addStore(storeName, storeLoc, storePhone, storeTime, storeStatus);

		    /********** 3.新增完成，轉交頁面 **********/
		    String url = "/store/listAllStore.jsp";
		    RequestDispatcher successView = req.getRequestDispatcher(url);
		    successView.forward(req, res);
		}
		
		if ("delete".equals(action)) { // 來自listAllStore.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.接收請求參數***************************************/
				Integer storeId = Integer.valueOf(req.getParameter("storeId"));

				/***************************2.開始刪除資料***************************************/
				StoreService storeSvc = new StoreService();
				storeSvc.deleteStore(storeId);
				
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/store/listAllStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
		}
	}
}
