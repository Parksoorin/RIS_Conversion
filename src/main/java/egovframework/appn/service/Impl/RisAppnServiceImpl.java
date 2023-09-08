package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RisAppnMapper;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RisAppnService;

@Service("risAppnService")
public class RisAppnServiceImpl implements RisAppnService{

	@Resource(name="risAppnMapper")
	private RisAppnMapper risAppnMapper;


	@Override
	public List<Ris0213DTO> ris0213FindAll() {
		// TODO Auto-generated method stub
		return risAppnMapper.ris0213FindAll();
	}
	
}
