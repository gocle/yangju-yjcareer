package com.gocle.yangju.yjcareer.sms.dao;

import com.gocle.yangju.yjcareer.sms.vo.MmsMsgVO;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;

public interface SmsMapper {

	int sendSms(SmsVO vo) throws Exception;

	int sendMms(MmsMsgVO vo) throws Exception;
}
