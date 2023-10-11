package egovframework.appn.model;

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
public class Ris1211RequestDTO {
	private String hsptId;
	private String imgnRoomCd;
	private String ordrBdypCd;
	private String ordrStartDate;
	private String ordrEndDate;
	private String ptntKrNm;
	private String ptntId;
	private String ordrPrgrDvsn;
	
	private String appnNoteText;
	private String appnDate;
	private String appnTime;
	private String pkris1211;
	
	
}
