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
public class RIS0211DateRequestDTO {
	private String hsptId;
    private String imgnRoomCd;
    private String strtDate;
	private String endDate;		

}
