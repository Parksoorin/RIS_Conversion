package egovframework.jubsu.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode

public class RIS1201DTO {

	private int pkris1201; 			// pk 값
	private String hsptId;  		// 병원 ID, pk 값
	
	private String vistDvsn; 		// 내원 구분
	private String ordrFk;  		// 처방 FK
	private String ptntId;  		// 환자 ID
	private String ptntNm;  		// 환자명
	private String ordrDate;  		// 처방일
	private String trtmDprtCd;  	// 진료부서 코드
	private String ordrDocId;  		// 처방의사 ID
	private String wardCd;			// 병동 코드
	private String unitCd;			// 병실 코드
	private	String ordrCd; 			// 처방 코드
	private String ordrNm; 			// 처방명
	private String ordrBdypCd; 		// 처방 부위 코드
	private String ordrDrctCd; 		// 처방 방향 코드
	private String ordrSrvcDvsn; 	// 처방 발생 코드
	private String ordrQntt; 		// 처방 수량
	private String orgnOrdrFk; 		// 원처방 FK
	private String imgnCd; 			// 촬영 코드
	private String imgnRoomCd; 		// 촬영실 코드
	private String emrgYn; 			// 응급여부
	private String prtbImgnYn; 		// 이동 촬영 여부
	private String elctTrtmYn; 		// 선택 진료 여부
	private String agrmYn; 			// 동의여부
	private String retkYn; 			// 재촬영 여부
	private String dcYn; 			// DC 여부
	private String pmntYn; 			// 수납여부
	private String dsrdDate; 		// 희망일
	private String dsrdTime; 		// 희망시간
	private String appnDate; 		// 예약일
	private String appnTime; 		// 예약시간
	private String rcptDate; 		// 접수일
	private String rcptDttm; 		// 접수일시
	private String rcptPrsnId; 		// 접수자 ID
	private String prscDate; 		// 실시일
	private String prscDttm; 		// 실시일시
	private String prscRdlgId; 		// 실시 방사선사 ID
	private String viewDocId; 		// 판독 의사 ID
	private String viewDate; 		// 판독일
	private String viewDttm; 		// 판독일시
	private String ordrPrgrDvsn; 	// 처방 진행구분
	private String ordrNoteText; 	// 처방 참고내용
	private String exmnNoteText; 	// 검사 참고내용

	private String rgstId; 			
	private String rgstDttm; 		
	private String mdfcId; 			
	private String mdfcDttm; 		

}