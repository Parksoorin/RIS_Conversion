package egovframework.util;

import java.security.MessageDigest;

/* 
 * 입력된 문자열을 SHA-256 해시로 변환하여 
 * 보안적으로 안전한 형태로 저장하거나 전송할 때 사용될 수 있고,
 * 주로 비밀번호 저장 등에 활용될 수 있는 방식의 코드
 */

// Sha256 클래스를 정의
public class Sha256 {
	// encrypt 메서드를 정의
	// 주어진 평문 문자열을 SHA-256으로 암호화한 후 암호화된 값을 문자열 형태로 반환함.
    public static String encrypt(String planText) {
        try {
        	// MessageDigest 클래스를 사용하여 SHA-256 해시 알고리즘의 인스턴스를 생성함.
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            // 입력으로 받은 평문 문자열을 바이트 배열로 변환하여 해시 알고리즘에 업데이트 한다.
            md.update(planText.getBytes());
            // 해시 알고리즘을 통해 입력 데이터의 해시 값을 계산하고, 그 결과를 바이트 배열로 저장한다.
            byte byteData[] = md.digest();
            // 해시 값의 각 바이트를 16진수 문자열로 변환하여 연결한 후 'StringBuffer'에 저장한다.
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                String hex = Integer.toHexString(0xff & byteData[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            // 최종적으로 16진수 문자열 형태로 변환된 해시 값을 반환한다.
            return hexString.toString();
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

}
 



