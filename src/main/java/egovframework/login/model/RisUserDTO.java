package egovframework.login.model;

public class RisUserDTO {
	private String hsptId;
	private String loginId;
	private String loginNm;
	private String loginPwd;
	private String userGrade;
	private String errorCnt;
	
	public String getHsptId() {
		return hsptId;
	}
	public void setHsptId(String hsptId) {
		this.hsptId = hsptId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginNm() {
		return loginNm;
	}
	public void setLoginNm(String loginNm) {
		this.loginNm = loginNm;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public String getErrorCnt() {
		return errorCnt;
	}
	public void setErrorCnt(String errorCnt) {
		this.errorCnt = errorCnt;
	}
}
