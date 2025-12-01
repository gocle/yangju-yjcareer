package com.gocle.yangju.forest.comm.util;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import egovframework.com.cmm.service.EgovProperties;

public class AESUtil {
	
	private static final String KEY = EgovProperties.getProperty("Globals.EncryptKey");
	

    public static String encrypt(String plainText) {
    	if (plainText == null || plainText.isEmpty()) {
            return "";
        }
        try {
            SecretKeySpec keySpec = new SecretKeySpec(KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, keySpec);
            byte[] encrypted = cipher.doFinal(plainText.getBytes("UTF-8"));
            return Base64.getEncoder().encodeToString(encrypted);
        } catch (Exception e) {
            throw new RuntimeException("AES error", e);
        }
    }

    public static String decrypt(String cipherText) {
    	if (cipherText == null || cipherText.isEmpty()) {
            return "";
        }
        try {
            SecretKeySpec keySpec = new SecretKeySpec(KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, keySpec);
            byte[] decoded = Base64.getDecoder().decode(cipherText);
            return new String(cipher.doFinal(decoded), "UTF-8");
        } catch (Exception e) {
            throw new RuntimeException("AES error", e);
        }
    }
}
