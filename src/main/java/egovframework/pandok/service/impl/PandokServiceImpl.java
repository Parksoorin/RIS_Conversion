package egovframework.pandok.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pandok.mapper.PandokMapper;
import egovframework.pandok.service.PandokService;
import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.model.Ris1101DTO;
import egovframework.pandok.model.Ris1301DTO;
import egovframework.pandok.model.RisUserDTO;

@Service("PandokService")
public class PandokServiceImpl implements PandokService {
	@Resource(name="PandokMapper")
	private PandokMapper pandokMapper;
	
	@Override
	public List<Ris0601DTO> getRis0601List(Map<String, String> param) {
		return pandokMapper.getRis0601List(param);
	}

	@Override
	public List<Ris0102DTO> getRis0102List() {
		return pandokMapper.getRis0102List();
	}

	@Override
	public List<RisUserDTO> getRisUserList() {
		return pandokMapper.getRisUserList();
	}

	@Override
	public List<Ris1301DTO> getRis1301List(Map<String, String> param) {
		return pandokMapper.getRis1301List(param);
	}

	@Override
	public List<Ris1101DTO> getRis1101List() {
		return pandokMapper.getRis1101List();
	}

	@Override
	public int duplicateCheck(Ris0601DTO dto) {
		return pandokMapper.duplicateCheck(dto);
	}

	@Override
	public int saveRis0601List(Ris0601DTO dto) {
		return pandokMapper.saveRis0601List(dto);
	}

	@Override
	public int saveTempRis1301List(Ris1301DTO dto) {
		return pandokMapper.saveTempRis1301List(dto);
	}
}