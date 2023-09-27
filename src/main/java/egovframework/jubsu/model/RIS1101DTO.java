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
public class RIS1101DTO {
	
	private String hsptId;  		// pk 값
	private String ptntId;  		// 환자 ID, pk값
	
	private String ptntKrNm;  		// 환자 한글명
	private String ptntEnglNmF;  	// 환자 영문명 F
	private String ptntEnglNmM;  	// 환자 영문명 F
	private String ptntEnglNmL;  	// 환자 영문명 F
	private String brth;  			// 생일(생년월일)
	private String gndrDvsn;  		// 성별 구분
	private String mobl;			// 휴대 전화번호
	private String ntilCd;			// 국가 코드
	private String ptntNoteText;	// 환자 참고내용
	
}