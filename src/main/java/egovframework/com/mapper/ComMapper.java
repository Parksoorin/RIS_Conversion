package egovframework.com.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.com.model.RisBtnDTO;
import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUrmnDTO;
import egovframework.com.model.RisUserDTO;


@Mapper("ComMapper")
public interface ComMapper {
	// 사용자 관리
	List<RisUserDTO> RisUserList();
	int addList1Data(RisGrupDTO dto);
	int updateData(RisUserDTO dto);
	int addUserData(RisUserDTO dto);
	int pwReset(RisUserDTO dtos);
	String selectMddlcd(String mddlKrNm);
	
	// 프로그램정보 관리
	List<RisPgrmDTO> RisPgrmList(String hsptId);
	int updatePgrmData(RisPgrmDTO dto);
	int addPgrmData(RisPgrmDTO dto);
	String selectSystemid(String selectSystemid);
	int deletePgrmData(RisPgrmDTO dto);
	
	// 메뉴정보 관리
	List<RisGrupDTO> RisGrupList();
	List<RisGrupDTO> RisGrupList(String hsptId);
	int updateMenuData(RisGrupDTO dto);
	int addMenuData(RisGrupDTO dto);
	List<RisGrmuDTO> RisGrmuList(String type);
	List<RisGrmuDTO> popupGrmuList(String hsptId);
	
	// 사용자별 메뉴관리
	List<RisUserDTO> RisUserMenuList();
	List<RisUrmnDTO> RisUserMenuList2(Map<String, String> params);
	List<RisUrmnDTO> popupUrmnList();
	
	// 프로그램 기능 권한 관리
	List<RisBtnDTO> RisBtnList();
}