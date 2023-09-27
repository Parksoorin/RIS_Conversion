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

public class RIS1201E0302DTO {
	
	private int pkris1201;			// pk 값
	
	// 처방 목록
	private String hsptId;  		// 병원 ID, pk 값
	
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