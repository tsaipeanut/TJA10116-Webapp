package com.store.model;

import java.sql.Timestamp;
import java.util.List;


public class StoreService {

	private StoreDAO_interface dao;
	
	public StoreService() {
		dao = new StoreJDBCDAO();
	}

	public StoreVO addStore(String storeName,String storeLoc, String storePhone, String storeTime,
			String storeStatus) 
	{

		StoreVO storeVO = new StoreVO();

		storeVO.setStoreName(storeName);
		storeVO.setStoreLoc(storeLoc);
		storeVO.setStorePhone(storePhone);
		storeVO.setStoreTime(storeTime);
		storeVO.setStoreStatus(storeStatus);
		dao.insert(storeVO);

		return storeVO;
	}

	
	
	public StoreVO updateStore(Integer storeId, String storeName,String storeLoc, String storePhone, String storeTime,
			String storeStatus, java.sql.Timestamp createTime) 
	{

		StoreVO storeVO = new StoreVO();

		storeVO.setStoreId(storeId);
		storeVO.setStoreName(storeName);
		storeVO.setStoreLoc(storeLoc);
		storeVO.setStorePhone(storePhone);
		storeVO.setStoreTime(storeTime);
		storeVO.setStoreStatus(storeStatus);
		storeVO.setCreateTime(createTime);
		dao.update(storeVO);

		return storeVO;
	}

	
	
	public void deleteStore(Integer storeId) {
		dao.delete(storeId);
	}

	public StoreVO getOneStore(Integer storeId) {
		return dao.findByPrimaryKey(storeId);
	}

	public List<StoreVO> getAll() {
		return dao.getAll();
	}
}
