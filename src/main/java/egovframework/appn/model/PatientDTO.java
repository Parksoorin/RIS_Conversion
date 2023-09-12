package egovframework.appn.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 환자
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class PatientDTO {
	private String hsptId; // 병원 아이디
	private String ptntId; // 환자 아이디
	private String ptntKrNm; // 이름
	private String brth; // 생년
	private String gndrDvsn; // 성별
	private String mobl; // 핸드폰 번호
}
