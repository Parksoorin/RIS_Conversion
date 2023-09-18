package egovframework.stts.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.stts.mapper.SttsMapper;
import egovframework.stts.service.SttsService;
import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.model.Ris1201DTO;
import egovframework.stts.model.RisViewDocDTO;

@Service("SttsService")
public class SttsServiceImpl implements SttsService {
	@Resource(name="SttsMapper")
	private SttsMapper sttsMapper;
	
	@Override
	public List<Ris1201DTO> getDvsnSttsList(Map<String, String> param) {
		return sttsMapper.getDvsnSttsList(param);
	}
	
	@Override
	public List<Ris1201DTO> getEqpmSttsList(Map<String, String> param) {
		return sttsMapper.getEqpmSttsList(param);
	}
	
	@Override
	public List<Ris1201DTO> getViewDocSttsList(Map<String, String> param) {
		return sttsMapper.getViewDocSttsList(param);
	}
	
	@Override
	public List<Ris0102DTO> getRisDvsnList() {
		return sttsMapper.getRisDvsnList();
	}
	
	@Override
	public List<Ris0102DTO> getRisRoomList() {
		return sttsMapper.getRisRoomList();
	}

	@Override
	public List<Ris0102DTO> getRisEqpmList() {
		return sttsMapper.getRisEqpmList();
	}
	
	@Override
	public List<RisViewDocDTO> getRisViewDocList() {
		return sttsMapper.getRisViewDocList();
	}
}
