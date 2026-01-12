package com.gocle.yangju.yjcareer.sms.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gocle.yangju.yjcareer.sms.vo.MmsMsgVO;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;

@Repository
public class SmsDao {

    @Resource(name = "smsSqlSession")
    private SqlSessionTemplate smsSqlSession;

    public int sendSms(SmsVO vo) throws Exception {
        SmsMapper mapper = smsSqlSession.getMapper(SmsMapper.class);
        return mapper.sendSms(vo);
    }

	public int sendMms(MmsMsgVO vo) throws Exception {
		SmsMapper mapper = smsSqlSession.getMapper(SmsMapper.class);
		 return mapper.sendMms(vo);
	}
}