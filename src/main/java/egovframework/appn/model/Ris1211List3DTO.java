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
public class Ris1211List3DTO {
	private String hsptId;
	private String ptntId;
	private String ptntKrNm;
	private String appnDate;
	private String appnTime;
	private String gubun;
	private String imgnRoomCd;
}
