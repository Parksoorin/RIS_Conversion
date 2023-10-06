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
	List<RisUserDTO> RisUserList();
	List<RisPgrmDTO> RisPrgmList(String hsptId);
	List<RisBtnDTO> RisBtnList();
	List<RisGrupDTO> RisGrupList();
	List<RisGrmuDTO> RisGrmuList(String type);
	List<RisUserDTO> RisUserMenuList();
	List<RisUrmnDTO> RisUserMenuList2(Map<String, String> params);
	List<RisUrmnDTO> popupUrmnList();
	int addList1Data(RisGrupDTO dto);
	int updateData(RisUserDTO dto);
	int addUserData(RisUserDTO dto);
	String selectMddlcd(String mddlKrNm);
	int pwReset(RisUserDTO dtos);
}