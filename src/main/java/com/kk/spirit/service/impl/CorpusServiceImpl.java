package com.kk.spirit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kk.spirit.dao.CorpusDao;
import com.kk.spirit.entity.Corpus;
import com.kk.spirit.service.CorpusService;

@Service
public class CorpusServiceImpl implements CorpusService {

	@Autowired
	private CorpusDao corpusDao;

	@Override
	public List<Corpus> queryCorpus() {

		return corpusDao.queryCorpus();
	}

	@Override
	public int delete(Corpus corpus) {
		// TODO Auto-generated method stub
		return corpusDao.delete(corpus);
	}

	@Override
	public int save(Corpus corpus) {
		if (null == corpus.getId()) {
			// 新增
			return corpusDao.insert(corpus);
		} else {
			// 修改
			return corpusDao.update(corpus);
		}
		
	}

}
