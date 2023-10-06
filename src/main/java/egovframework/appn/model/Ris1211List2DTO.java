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
public class Ris1211List2DTO {
	private String hsptId;
	private String imgnRoomCd;
	private String exmnDate;
	private String strtTime;
	private String appnOutpPssbCnt;
	private String appnInptPssbCnt;
	private String appnHlxmPssbCnt;
	private String appnSum;
	private String outpCnt;
	private String inptCnt;
	private String hlxmCnt;
}
