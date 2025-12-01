package com.gocle.yangju.forest.comm.idgnr;

import java.util.Calendar;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrStrategy;


public class GocleIdGnrStrategyImpl implements EgovIdGnrStrategy {

	private static final int DEFAULT_CIPERS = 5;

    // 정책으로 입력된 prefix
    private String prefix;

    // 자리수로 디폴트는 5자리
    private int cipers = DEFAULT_CIPERS;

    // 채울 charater로 기본은 '0'
    private char fillChar = '0';

    /**
     * 생성된 String 타입의 ID를 입력받아서 정책으로 입력된 PREFIX에 기본 채울
     * 문자를 지정 길이만큼 넣어서 아이디 생성.
     * 
     * @param originalId original id to be converted
     * @return assembled id
     */
    public String makeId(String originalId) {
    	String returnMakeId = "";
    	if( -1 < (this.prefix).indexOf( "YEAR#" ) ){
            int year = Calendar.getInstance().get(Calendar.YEAR);
            
            String prefiex2 = this.prefix.replaceAll("YEAR#", "");
            
            returnMakeId = year + prefiex2 + fillString(originalId, fillChar, cipers);
    	}else{
    		if(-1 < (this.prefix).indexOf( "L#YEAR" )){ // 아우누리 연계용 교직원번호 세팅(기업현장교사)
    			int year = Calendar.getInstance().get(Calendar.YEAR);
                returnMakeId = "L" + year + fillString(originalId, fillChar, cipers);
    		}else{
    			returnMakeId = prefix + fillString(originalId, fillChar, cipers);
    		}
    		
    		
    	}
    	return returnMakeId;
    }

    /**
     * 정책정보.
     * 
     * @param cipers cipers
     */
    public void setCipers(int cipers) {
        this.cipers = cipers;
    }

    /**
     * Prefix.
     * 
     * @param prefix prefix
     */
    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    /**
     * properties. 
     * 
     * @param fillChar fillChar
     */
    public void setFillChar(char fillChar) {
        this.fillChar = fillChar;
    }

    /**
     * 생성자.
     * 
     * @param prefix prefix
     * @param cipers cipers
     * @param fillChar fillChar
     */
    public GocleIdGnrStrategyImpl(String prefix, int cipers, char fillChar) {
        super();
        this.prefix = prefix;
        this.cipers = cipers;
        this.fillChar = fillChar;
    }

    /**
     * 생성자.
     */
    public GocleIdGnrStrategyImpl() {
        super();
    }

    /**
     * 대상 길이만큼 디폴트 Char로 채우기.
     */
    public static String fillString(String originalStr, char ch, int cipers) {
        int originalStrLength = originalStr.length();

        if (cipers < originalStrLength) {
            return null;
        }

        int difference = cipers - originalStrLength;

        StringBuffer strBuf = new StringBuffer();
        for (int i = 0; i < difference; i++) {
            strBuf.append(ch);
        }

        strBuf.append(originalStr);
        
        return strBuf.toString();
    }
}