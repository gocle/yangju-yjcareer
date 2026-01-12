package com.gocle.yangju.yjcareer.sms.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.gocle.yangju.yjcareer.sms.dao.SmsDao;
import com.gocle.yangju.yjcareer.sms.service.SmsService;
import com.gocle.yangju.yjcareer.sms.vo.MmsMsgVO;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;

@Service
public class SmsServiceImpl extends EgovAbstractServiceImpl implements SmsService {

	@Resource
    private SmsDao smsDao;
	
	@Override
	public int sendSms(SmsVO vo) throws Exception {
		return smsDao.sendSms(vo);
	}

	@Override
	public int sendMms(MmsMsgVO vo) throws Exception {
		return smsDao.sendMms(vo);
	}

}
