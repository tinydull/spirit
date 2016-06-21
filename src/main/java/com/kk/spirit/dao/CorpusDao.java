package com.kk.spirit.dao;

import java.util.List;

import com.kk.spirit.entity.Corpus;

public interface CorpusDao {

	/**
	 * 文集列表功能 <功能详细描述>
	 */
	public List<Corpus> queryCorpus();

	/**
	 * 新建文集插入数据库中 <功能详细描述>
	 */
	public int insert(Corpus corpus);

	/**
	 * 修改文集的名称 <功能详细描述>
	 */
	public int update(Corpus corpus);

	/**
	 * 删除文集（移动到回收站） <功能详细描述>
	 */
	public int delete(Corpus corpus);

}
