package egovframework.login.model;

import lombok.*;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO {
	private String pgrmId;
	private String menuName;
	private String menuLevel;
	private String menuId;
	private String menuNameSub;
	private String pgrmUrl;
	private String upperMenuId;
}
