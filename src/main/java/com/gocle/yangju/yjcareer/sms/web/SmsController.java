package com.gocle.yangju.yjcareer.sms.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    @RequestMapping("/sms/smsSend.do")
    @ResponseBody
    public String sendSms(@ModelAttribute("mmsVo") MmsMsgVO mmsVo) throws Exception {
    	
    	String msg = mmsVo.getMsg();
    	String callback = mmsVo.getCallback().trim();
    	
    	String retMsg = "";
    	int userCnt = 0;
    	int eduErrCnt = 0;
    	
    	try {
	    	if(msg.length() > 45) {
	    		MmsMsgVO vo = new MmsMsgVO();
	            vo.setCallback(callback);
	            vo.setMsg(msg);
	            vo.setType("1");
	            vo.setId("test");
	    		
	            for(String phone : mmsVo.getPhones()) {
	            	phone = phone.trim();
	            	if(!phone.isEmpty() && !msg.isEmpty() && !callback.isEmpty()) {
	            		vo.setPhone(phone);
		            	try {
		            		smsService.sendMms(vo);
		            		userCnt++;
		            	} catch(Exception e) {
		            		e.printStackTrace();
		            		eduErrCnt++;
		            	}
	            	}else {
	            		eduErrCnt++;
	            	}
	            }
	    	} else {
	    		SmsVO vo = new SmsVO();
	            vo.setTrMsg(msg);
	            vo.setTrCallback(callback);
	            vo.setTrId("test");
	            
	            for(String phone : mmsVo.getPhones()) {
	            	phone = phone.trim();
	            	if(!phone.isEmpty() && !msg.isEmpty() && !callback.isEmpty()) {
	            		vo.setTrPhone(phone);
		            	try {
		            		smsService.sendSms(vo);
		            		userCnt++;
		            	} catch(Exception e) {
		            		e.printStackTrace();
		            		eduErrCnt++;
		            	}
	            	}else {
	            		eduErrCnt++;
	            	}
	            }
	    	}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	if(userCnt > 0) {
    		if(eduErrCnt > 0) {
    			retMsg = "발송성공 (" + userCnt + "명) / 발송실패 (" + eduErrCnt + "명)";
    		} else {
    			retMsg = "발송성공 (" + userCnt + "명)";
    		}
    	} else {
    		if(eduErrCnt > 0) {
    			retMsg = "발송실패 (" + eduErrCnt + "명)";
    		} else {
    			retMsg = "발송에 실패 하였습니다."; 
    		}
    	}
    	
    	return retMsg;
    }
}
