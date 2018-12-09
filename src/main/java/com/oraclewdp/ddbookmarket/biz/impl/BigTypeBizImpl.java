package com.oraclewdp.ddbookmarket.biz.impl;

import java.util.List;

import com.oraclewdp.ddbookmarket.biz.BigTypeBiz;
import com.oraclewdp.ddbookmarket.dao.BigTypeDao;
import com.oraclewdp.ddbookmarket.dao.impl.BigTypeDaoJdbcImpl;
import com.oraclewdp.ddbookmarket.model.BigType;

public class BigTypeBizImpl implements BigTypeBiz {

	@Override
	public boolean save(String name) {
		BigTypeDao bigTypeDao=new BigTypeDaoJdbcImpl();
		return bigTypeDao.save(name);
	}

	@Override
	public List<BigType> findAllBigType() {
		BigTypeDao bigTypeDao=new BigTypeDaoJdbcImpl();
		return bigTypeDao.findAll();
	}

}
