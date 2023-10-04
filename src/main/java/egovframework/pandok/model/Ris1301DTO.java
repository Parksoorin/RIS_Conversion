package egovframework.pandok.model;

public class Ris1301DTO {
	private String ordrFk;			// 처방FK
	private String ptntId;			// 환자ID
	private String ptntNm;			// 환자명
	private String ordrDate;		// 처방일
	private String prscDate;		// 촬영일자
	private String ordrNm;			// 촬영명
	private String imgnDvsnCd;		// 촬영구분코드
	private String vistDvsn;		// 내원구분코드
	private String vistDvsnNm;		// 내원구분
	private String trtmDprtCd;		// 진료과코드
	private String trtmDprtNm;		// 진료과명
	private String ordrDocId;		// 처방의사ID
	private String ordrDocNm;		// 처방의사
	private String viewYn;			// 판독완료(판독일자가 있으면 Y)
	private String viewDate;		// 판독일자(판독일시에서 일자만)
	private String viewTime;		// 판독시간(판독일시에서 시간만)
	private String viewDocId;		// 판독의사ID
	private String viewDocNm;		// 판독의사 이름
	private String voicViewYn;		// 음성판독여부
	private String rdlgId;			// 방사선사ID
	private String rdlgNm;			// 방사선사 이름
	private String ordrPrgrDvsn;	// 처방진행구분 숫자
	private String ordrPrgrKr;		// 처방진행구분
	private String viewText;		// 판독내용
	private String viewNoteText;	// 판독이력
	
	public String getOrdrFk() {
		return ordrFk;
	}
	public void setOrdrFk(String ordrFk) {
		this.ordrFk = ordrFk;
	}
	public String getPtntId() {
		return ptntId;
	}
	public void setPtntId(String ptntId) {
		this.ptntId = ptntId;
	}
	public String getPtntNm() {
		return ptntNm;
	}
	public void setPtntNm(String ptntNm) {
		this.ptntNm = ptntNm;
	}
	public String getOrdrDate() {
		return ordrDate;
	}
	public void setOrdrDate(String ordrDate) {
		this.ordrDate = ordrDate;
	}
	public String getPrscDate() {
		return prscDate;
	}
	public void setPrscDate(String prscDate) {
		this.prscDate = prscDate;
	}
	public String getOrdrNm() {
		return ordrNm;
	}
	public void setOrdrNm(String ordrNm) {
		this.ordrNm = ordrNm;
	}
	public String getImgnDvsnCd() {
		return imgnDvsnCd;
	}
	public void setImgnDvsnCd(String imgnDvsnCd) {
		this.imgnDvsnCd = imgnDvsnCd;
	}
	public String getVistDvsn() {
		return vistDvsn;
	}
	public void setVistDvsn(String vistDvsn) {
		this.vistDvsn = vistDvsn;
	}
	public String getVistDvsnNm() {
		return vistDvsnNm;
	}
	public void setVistDvsnNm(String vistDvsnNm) {
		this.vistDvsnNm = vistDvsnNm;
	}
	public String getTrtmDprtCd() {
		return trtmDprtCd;
	}
	public void setTrtmDprtCd(String trtmDprtCd) {
		this.trtmDprtCd = trtmDprtCd;
	}
	public String getTrtmDprtNm() {
		return trtmDprtNm;
	}
	public void setTrtmDprtNm(String trtmDprtNm) {
		this.trtmDprtNm = trtmDprtNm;
	}
	public String getOrdrDocId() {
		return ordrDocId;
	}
	public void setOrdrDocId(String ordrDocId) {
		this.ordrDocId = ordrDocId;
	}
	public String getOrdrDocNm() {
		return ordrDocNm;
	}
	public void setOrdrDocNm(String ordrDocNm) {
		this.ordrDocNm = ordrDocNm;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}
	public String getViewDate() {
		return viewDate;
	}
	public void setViewDate(String viewDate) {
		this.viewDate = viewDate;
	}
	public String getViewTime() {
		return viewTime;
	}
	public void setViewTime(String viewTime) {
		this.viewTime = viewTime;
	}
	public String getViewDocId() {
		return viewDocId;
	}
	public void setViewDocId(String viewDocId) {
		this.viewDocId = viewDocId;
	}
	public String getViewDocNm() {
		return viewDocNm;
	}
	public void setViewDocNm(String viewDocNm) {
		this.viewDocNm = viewDocNm;
	}
	public String getVoicViewYn() {
		return voicViewYn;
	}
	public void setVoicViewYn(String voicViewYn) {
		this.voicViewYn = voicViewYn;
	}
	public String getRdlgId() {
		return rdlgId;
	}
	public void setRdlgId(String rdlgId) {
		this.rdlgId = rdlgId;
	}
	public String getRdlgNm() {
		return rdlgNm;
	}
	public void setRdlgNm(String rdlgNm) {
		this.rdlgNm = rdlgNm;
	}
	public String getOrdrPrgrDvsn() {
		return ordrPrgrDvsn;
	}
	public void setOrdrPrgrDvsn(String ordrPrgrDvsn) {
		this.ordrPrgrDvsn = ordrPrgrDvsn;
	}
	public String getOrdrPrgrKr() {
		return ordrPrgrKr;
	}
	public void setOrdrPrgrKr(String ordrPrgrKr) {
		this.ordrPrgrKr = ordrPrgrKr;
	}
	public String getViewText() {
		return viewText;
	}
	public void setViewText(String viewText) {
		this.viewText = viewText;
	}
	public String getViewNoteText() {
		return viewNoteText;
	}
	public void setViewNoteText(String viewNoteText) {
		this.viewNoteText = viewNoteText;
	}
}
