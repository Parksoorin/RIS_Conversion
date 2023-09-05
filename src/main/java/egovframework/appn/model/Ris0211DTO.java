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
	@NotBlank
	@Max(20)
	private String hsptId;
	@NotBlank
	@Max(20)
	private String imgnRoomCd;
	@NotBlank
	private LocalDate exmnDate;
	@NotBlank
	private LocalTime strtTime;
	private LocalTime endTime;
	private Integer appnOutpPssbCnt;
	private Integer appnInptPssbCnt;
	private Integer appnHlxmPssbCnt;
	@Max(20)
	private String rgstId;
	private LocalDateTime rgstDttm;
	@Max(20)
	private String mdfcId;
	private LocalDateTime mdfcDttm;
}