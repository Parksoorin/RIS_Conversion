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

public class RIS1201E0301DTO {
	
	private int pkris1201; 			// pk 값
	
	// 처방 목록8
	private String hsptId;  		// 병원 ID, pk 값
	
	private String vistDvsn; 		// 내원 구분
	private String ptntId;  		// 환자 ID
	private String ptntNm;  		// 환자명
	private String gndrDvsn;  		// 성별 구분
	private String brth;  			// 생일(생년월일)
	private String ordrDate;  		// 처방일
	private String trtmDprtCd;  	// 진료과(진료부서 코드)
	private String mddlKrNm;  		// 의사정보(중분류 한글명)
	private String wardCd;  		// 병동 코드
	private String unitCd;  		// 병실 코드
	
	// 환자 기본정보
	private String dsrdDate;  		// 희망일
	
	// 처방 정보 상세
	private String elctTrtmYn;  	// V
	private String imgnCd;  		// 촬영코드
	private String ordrNm;  		// 촬영명
	private String exmnNoteText;  	// FIND
	private String ordrNoteText;  	// 참고내용(처방참고내용)
	private String pmntYn;  		// 수납(수납여부)
	private String prtbImgnYn;  	// 이동촬영(이동촬영여부)
	private String emrgYn;  		// 응급(응급여부)
	private String dcYn;  			// DC(DC여부)
	private String retkYn;  		// 재촬영(재촬영 여부)	
	
}