package com.gocle.yangju.forest.usr.support.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.banner.service.AdminBannerService;
import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.usr.intro.service.UserIntroService;
import com.gocle.yangju.forest.usr.intro.vo.UserIntroVO;
import com.gocle.yangju.forest.usr.reservation.service.impl.UserReservationMapper;
import com.gocle.yangju.forest.usr.support.service.UserSupportService;


@Service
public class UserSupportServiceImpl extends EgovAbstractServiceImpl implements UserSupportService {

	@Autowired
	UserSupportMapper userSupportMapper;
}
