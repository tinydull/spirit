package com.kk.spirit.service;

import java.util.List;

import com.kk.spirit.entity.Corpus;
/**
 * 
 * <功能详细描述>
 * 
 * @author  huangteng
 * @date  2016年5月11日
 */
public interface CorpusService {

	/**
	 * 文集列表功能
	 * <功能详细描述>
	 */
	public List<Corpus> queryCorpus();
	/**
	 * 新建（修改）文集插入数据库中
	 * <功能详细描述>
	 */
	public int save(Corpus corpus);
	/**
	 * 删除文集（移动到回收站）
	 * <功能详细描述>
	 */
	public int delete(Corpus corpus);

}
