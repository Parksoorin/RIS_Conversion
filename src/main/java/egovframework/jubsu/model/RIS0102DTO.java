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

public class RIS0102DTO {
	
	private String hsptId;		// 병원 ID
	private String lrgcCd;		// 대분류코드
	private String mddlCd;		// 중분류코드
	private String mddlKrNm;	// 중분류 한글명
	private String mddlEnglNm;	// 중분류 영문명
	private String mddlAbbrNm;	// 중분류 약어명
	private String mddlAcph;	// 자릿수(하위 소분류)
	private String otptSqnc;	// 출력순서
	private String applDate;	// 적용일자
	private String exprDate;	// 불용일자
	
	private String chrc1;	// 문자값1
	private String chrc2;	// 문자값2
	private String chrc3;	// 문자값3
	private String chrc4;	// 문자값4
	private String chrc5;	// 문자값5
	
	private String nmbr1;	// 숫자값1
	private String nmbr2;	// 숫자값2
	private String nmbr3;	// 숫자값3
	private String nmbr4;	// 숫자값4
	private String nmbr5;	// 숫자값5
	
	private String rgstId;	
	private String rgstDttm;	
	private String mdfcId;	
	private String mdfcDttm;	
	
}