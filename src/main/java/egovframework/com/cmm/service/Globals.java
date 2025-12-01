package egovframework.com.cmm.service;

import org.apache.commons.lang3.StringUtils;

/**
 *  Class Name : Globals.java
 *  Description : 시스템 구동 시 프로퍼티를 통해 사용될 전역변수를 정의한다.
 *  Modification Information
 *
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.01.19    박지욱          최초 생성
 *
 *  @author 공통 서비스 개발팀 박지욱
 *  @since 2009. 01. 19
 *  @version 1.0
 *  @see
 *
 */

public class Globals {
	//OS 유형
    public static final String OS_TYPE = EgovProperties.getProperty("Globals.OsType");
    //DB 유형
    public static final String DB_TYPE = EgovProperties.getProperty("Globals.DbType");
    //메인 페이지
    public static final String MAIN_PAGE = EgovProperties.getProperty("Globals.MainPage");
    //ShellFile 경로
    public static final String SHELL_FILE_PATH = EgovProperties.getPathProperty("Globals.ShellFilePath");
    //퍼로퍼티 파일 위치
    public static final String CONF_PATH = EgovProperties.getPathProperty("Globals.ConfPath");
    //Server정보 프로퍼티 위치
    public static final String SERVER_CONF_PATH = EgovProperties.getPathProperty("Globals.ServerConfPath");
    //Client정보 프로퍼티 위치
    public static final String CLIENT_CONF_PATH = EgovProperties.getPathProperty("Globals.ClientConfPath");
    //파일포맷 정보 프로퍼티 위치
    public static final String FILE_FORMAT_PATH = EgovProperties.getPathProperty("Globals.FileFormatPath");

    //파일 업로드 원 파일명
	public static final String ORIGIN_FILE_NM = "originalFileName";
	//파일 확장자
	public static final String FILE_EXT = "fileExtension";
	//파일크기
	public static final String FILE_SIZE = "fileSize";
	//업로드된 파일명
	public static final String UPLOAD_FILE_NM = "uploadFileName";
	//파일경로
	public static final String FILE_PATH = "filePath";

	//메일발송요청 XML파일경로
	public static final String MAIL_REQUEST_PATH = EgovProperties.getPathProperty("Globals.MailRequestPath");
	//메일발송응답 XML파일경로
	public static final String MAIL_RESPONSE_PATH = EgovProperties.getPathProperty("Globals.MailRResponsePath");

	// G4C 연결용 IP (localhost)
	public static final String LOCAL_IP = EgovProperties.getProperty("Globals.LocalIp");




    public static final String LOGIN_PAGE = EgovProperties.getProperty("Globals.LoginPage");

    /** 관리자 아이디  */
    public static final String SESSION_ADMIN_ID = "SESSION_ADMIN_ID";
    
	/** 쿠키 아이디 이름( 암호화된 쿠키세션정보가 저장될 Key 이름 ) */
	public static final String SESSION_SYNC_ID = "SYNC_ID";
	/** 로그인 사용자 PK */
	public static final String SESSION_USER_SEQ = "SESSION_USER_SEQ";
    /** 로그인시 사용한 사용자 아이디 */
    public static final String CONNECTION_USER_ID = "CONNECTION_USER_ID";
	/** 로그인 사용자 아이디 */
	public static final String SESSION_USER_ID = "SESSION_USER_ID";
	/** 로그인 사용자 이름 */
	public static final String SESSION_MEM_NAME = "SESSION_MEM_NAME";
	/** 로그인 사용자 객체 */
	public static final String SESSION_USER_VO = "SESSION_USER_VO";
	/** 최종 로그인 일시 명칭 */
	public static final String SESSION_LAST_LOGIN_DT = "SESSION_LAST_LOGIN_DT";
	/** 메뉴 리스트 정보 */
	public static final String SESSION_MENU_LIST = "SESSION_MENU_LIST";
	/** 모바일 메뉴 리스트 정보 */
	public static final String SESSION_MM_MENU_LIST = "SESSION_MM_MENU_LIST";	
	public static final String LOCALE = "LOCALE";

    public static final String SESSION_SNYC_COOKIE_DOMAIN = EgovProperties.getProperty("Globals.sessionSnycCookieDomain");
	/** Session 유지 시간 지정 명칭 */
	public static final String SESSION_MAX_INACTIVE_INTERVAL = "SESSION_MAX_INACTIVE_INTERVAL";
	/** Session 유지 시간(초 , 1시간==3600초 ) */
	public static final String SESSION_MAX_INACTIVE_INTERVAL_TIME = StringUtils.defaultIfBlank((String) EgovProperties.getProperty("Globals.sessionMaxInactiveIntervalTime"),"3600");

    
    public static final String M_IDX = "M_IDX";			
    public static final String M_ID = "M_ID";			
    public static final String M_NAME = "M_NAME";			
    public static final String M_PWD = "M_PWD";	
    public static final String M_HP = "M_HP";			
    public static final String M_EMAIL = "M_EMAIL";
    
    
    public static final String MEM_SEQ          = "SESSION_MEM_SEQ";        // 회원 고유번호
    public static final String MEM_TYPE          = "SESSION_MEM_TYPE";        // 회원 구분
    public static final String MEM_ID           = "SESSION_MEM_ID";         // 사용자 아이디
    public static final String MEM_NAME         = "SESSION_MEM_NAME";       // 사용자 성명
    public static final String DEPT_NO		 	= "SESSION_DEPT_NO";			//학과번호
    public static final String EMAIL            = "SESSION_EMAIL";          // E-MAIL ADDRESS
    public static final String SITE_ID            = "SESSION_SITE_ID";          // 사이트ID
    public static final String IP            = "SESSION_IP";          // IP
    public static final String DI_KEY            = "SESSION_DI_KEY";          // DI_KEY
    public static final String PHONE            = "SESSION_PHONE";          // PHONE
    public static final String GENDER            = "SESSION_GENDER";          // GENDER
    
    
}
