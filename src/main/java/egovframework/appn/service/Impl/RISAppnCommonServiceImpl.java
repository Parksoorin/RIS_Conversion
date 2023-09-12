package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RISAppnCommonMapper;
import egovframework.appn.model.ImagingDTO;
import egovframework.appn.model.ImagingDivisionPatientDTO;
import egovframework.appn.model.PatientDTO;
import egovframework.appn.service.RISAppnCommonService;
import lombok.extern.slf4j.Slf4j;

// 예약 기준관리
@Service("RISAppnCommonService")
@Slf4j
public class RISAppnCommonServiceImpl implements RISAppnCommonService{

	@Resource(name="RISAppnCommonMapper")
	private RISAppnCommonMapper mapper;

	@Override
	public List<ImagingDivisionPatientDTO> imagingDivisionPatientSelect() {
		return mapper.imagingDivisionPatientSelect();
	}

	@Override
	public List<ImagingDTO> imagingSelect() {
		return mapper.imagingSelect();
	}

	@Override
	public List<PatientDTO> patientSelect() {
		return mapper.patientSelect();
	}
}
