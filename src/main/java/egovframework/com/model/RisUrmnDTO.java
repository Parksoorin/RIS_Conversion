package egovframework.com.model;
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
public class RisUrmnDTO {
	// 최초 입력 일시
	private String sysDate;
	// 작업자
	@Max(10)
	private String userId;
	// 최종변경일시
	private String updDate;
	// 병원(회원) 아이디
	@Max(10)
	private String hsptId;
	// 사용자 ID
	@Max(20)
	private String loginId;
	// 시스템ID
	@Max(10)
	private String systemId;
	// 시스템ID
	@Max(10)
	private String menuGroupId;
	// 메뉴ID
	@Max(10)
	private String menuId;
	// 메뉴그룹명
	@Max(100)
	private String menuName;
	// 메뉴권한
	@Max(1)
	private String menuGrade;
	// 정렬순서
	@Max(11)
	private String otptSqnc;
	// 사용여부
	@Max(1)
	private String useYn;
}