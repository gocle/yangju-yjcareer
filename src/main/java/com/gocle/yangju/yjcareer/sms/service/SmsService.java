package com.gocle.yangju.yjcareer.sms.service;

import com.gocle.yangju.yjcareer.sms.vo.MmsMsgVO;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;

public interface SmsService {

	/**
	 * sms발송 샘플
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int sendSms(SmsVO vo) throws Exception;

	/**
	 * MMS 발송 샘플
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int sendMms(MmsMsgVO vo) throws Exception;
}
