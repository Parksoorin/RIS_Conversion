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
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Ris0213DTO {
	@NotBlank
	@Max(20)
	private String hsptId;
	@NotBlank
	@Max(20)
	private String imgnRoomCd;
	@NotBlank
	private LocalDate strtDate;
	@NotBlank
	private LocalTime strtTime;
	private LocalTime endTime;
	@Max(1000)
	private String appnImpsText;
	@Max(20)
	private String rgstId;
	private LocalDateTime rgstDttm;
	@Max(20)
	private String mdfcId;
	private LocalDateTime mdfcDttm;
}
