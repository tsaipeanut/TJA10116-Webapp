package com.store.model;

import java.util.*;


public interface StoreDAO_interface {
          public void insert(StoreVO storeVO);
          public void update(StoreVO storeVO);
          public void delete(Integer StoreId);
          public StoreVO findByPrimaryKey(Integer StoreId);
          public List<StoreVO> getAll();
          
}



