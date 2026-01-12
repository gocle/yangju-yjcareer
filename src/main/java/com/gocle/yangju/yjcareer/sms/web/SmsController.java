package com.gocle.yangju.yjcareer.sms.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gocle.yangju.yjcareer.sms.service.SmsService;
import com.gocle.yangju.yjcareer.sms.vo.MmsMsgVO;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;

@Controller
public class SmsController {
	
	@Autowired
	private SmsService smsService;
	

	/**
	 * SMS 발송 샘플
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/sms/test.do")
    @ResponseBody
    public String sendSmsTest() throws Exception {
    	String msg = "입력받은 메시지 변수값";
    	//입력값 분기
    	if(msg.length() > 45) {
    		MmsMsgVO vo = new MmsMsgVO();
            vo.setSubject("테스트 MMS");
            vo.setPhone("01012345678");
            vo.setCallback("0311234567");
            vo.setMsg(msg);
            vo.setType("1");
            vo.setId("TEST_ID");
    		
            smsService.sendMms(vo);
    	} else {
    		SmsVO vo = new SmsVO();
            vo.setTrPhone("01012345678");
            vo.setTrMsg(msg);
            vo.setTrCallback("0310000000");
            vo.setTrId("TEST_ID");
            
            smsService.sendSms(vo);
    	}

        return "OK";
    }
    
}
