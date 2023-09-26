package egovframework.appn.model;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.validation.constraints.Max;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;


import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Ris0211DTO {
	private String flag;
	@NotBlank
	@Max(20)
	private String hsptId;
	@NotBlank
	@Max(20)
	private String imgnRoomCd;
	@NotBlank
	private String exmnDate;
	@NotBlank
	private String strtTime;
	private String endTime;
	private int appnOutpPssbCnt;
	private int appnInptPssbCnt;
	private int appnHlxmPssbCnt;
	@Max(20)
	private String rgstId;
	private String rgstDttm;
	@Max(20)
	private String mdfcId;
	private String mdfcDttm;
}