package com.kk.test.spring;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses(value={TestSpringArticle.class, TestSpringUser.class})
public class TestAll {

	
}
