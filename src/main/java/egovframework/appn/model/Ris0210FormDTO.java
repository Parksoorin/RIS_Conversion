package egovframework.appn.model;

import java.time.LocalTime;
import java.util.List;

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
public class Ris0210FormDTO {
	private String gubun; // new-create, addition-create
	private String startTime;
	private String endTime;
	private Integer interval;
	private String restStartTime;
	private String restEndTime;
	private Integer outPatient;
	private Integer inPatient;
	private Integer healthExamination;
	private String dayOfWeek; // 요일
	private String imgnRoomCd; // 촬영실
	private String hsptId;
	private boolean weekBatch; // true = 월~금, false = 해당 요일
	private List<String> weekList;
}

