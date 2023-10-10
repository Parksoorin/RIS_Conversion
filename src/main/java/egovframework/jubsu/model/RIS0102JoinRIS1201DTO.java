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


public class RIS0102JoinRIS1201DTO {
	
	// ris1201
	private int pkris1201; 			// pk 값
	
	private String imgnCd; 			// 촬영 코드
	private String ordrNm; 			// 처방명
	
	private String imgnRoomCd; 		// 촬영실 코드
	private String ordrBdypCd; 		// 처방 부위 코드
	
	
	// ris0102
	private String lrgcCd; 			// 대분류 코드
	private String mddlCd;			// 중분류 코드
	
	private String mddlKrNm;		// 중분류 한글명
	private String mddlKrNmOne;		// 중분류 한글명1
	private String mddlKrNmTwo;		// 중분류 한글명2
	
	
	
}