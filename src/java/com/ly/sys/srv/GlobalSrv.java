package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;

import com.ly.comm.BaseSrv;
import com.ly.sys.vo.Global;

@IocBean(name="globalSrv",fields = { "dao" })
public class GlobalSrv extends BaseSrv<Global>
{
	
}

