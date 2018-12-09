package com.oraclewdp.ddbookmarket.biz;

import java.util.List;

import com.oraclewdp.ddbookmarket.model.BigType;

/**
 * @author  149098880@qq.com
 */
public interface BigTypeBiz {

	boolean save(String name);

	List<BigType> findAllBigType();

}
