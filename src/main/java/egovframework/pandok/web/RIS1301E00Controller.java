package egovframework.pandok.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.util.StreamUtils;

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris1101DTO;
import egovframework.pandok.model.Ris1201DTO;
import egovframework.pandok.model.Ris1301DTO;
import egovframework.pandok.service.PandokService;

@Controller
public class RIS1301E00Controller {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris1301List.do")
	public String ris1301ListPage(HttpSession session, Model model) throws Exception {
		String hsptId = session.getAttribute("hspt_id").toString();
		
		List<Ris0102DTO> ris0102Data = pandokService.getRis0102List(hsptId);
		
		model.addAttribute("ris0102Data", ris0102Data);
		
		return ".main/pandok/RIS1301E00";
	}
	
	@RequestMapping(value = "/pandok/ris1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis1301List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		Map<String, String> param = new HashMap<>();
		
		param.put("hsptId", map.get("hsptId").toString());
		param.put("viewYn", map.get("viewYn").toString());
		param.put("voicViewYn", map.get("voicViewYn").toString());
		param.put("startDate", map.get("startDate").toString());
		param.put("endDate", map.get("endDate").toString());
		param.put("ris1301Dvsn", "%".equals(map.get("ris1301Dvsn").toString()) ? "all" : map.get("ris1301Dvsn").toString());
		param.put("ptntId", map.get("ptntId").toString());
		
		List<Ris1301DTO> ris1301Data = pandokService.getRis1301List(param);
		
		json.put("ris1301Data", ris1301Data);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/PatientPopup.do")
	public String risPatientPopup(Model model) throws Exception {
		
		return ".popup/RIS1301E00_POP";
	}
	
	@RequestMapping(value = "/pandok/getRis1101List.do")
	@ResponseBody
	public JSONObject getRis1101List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		List<Ris1101DTO> ris1101Data = pandokService.getRis1101List();
		
		json.put("ris1101Data", ris1101Data);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/filePopup.do")
	public String filePopup(Model model) throws Exception {
		
		return ".popup/RIS1301E00_POP2";
	}
	
	
	@RequestMapping(value = "/pandok/fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject fileUpload(@RequestPart("localFile") MultipartFile localFile, @RequestParam("temp") String temp, @RequestParam("ptntId") String ptntId, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
	    
	    JSONObject json = new JSONObject();
	    
	    // 원본 파일명
	    String fileRealName = localFile.getOriginalFilename();
	    // 용량
	    long size = localFile.getSize();
	    // 확장자
	    String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
	    // 현재 날짜
	    Date currentDate = new Date();
	    // 형식 변경
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String dateString = dateFormat.format(currentDate);
	    
	    // 새로운 폴더 경로 생성
	    String folderPath = "static" + File.separator + "upload" + File.separator + dateString;
	    
	    System.out.println(folderPath);
	    
	    // 새로운 폴더 생성
	    File folder = new File(folderPath);
	    if (!folder.exists()) {
	        folder.mkdirs();
	        System.out.println("폴더 생성");
	    }
	    
	    System.out.println(folderPath + File.separator + ptntId + "_" + dateString + "-" + size + fileExtension);

	    // 파일 저장
	    File saveFile = new File(folderPath + File.separator + ptntId + "_" + dateString + "-" + size + fileExtension);

	    try (OutputStream os = new FileOutputStream(saveFile)) {
	        StreamUtils.copy(localFile.getInputStream(), os);
	        System.out.println("파일 저장 완료");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    json.put("voicViewFileNm", fileRealName);
	    json.put("voicViewDrtrNm", folderPath + File.separator);
	    json.put("voicFileNm", (ptntId + "_" + dateString + "-" + size + fileExtension).toString());
	    json.put("cnt", 1);
	    
	    return json;
	}
	
	
	@RequestMapping(value = "/pandok/saveTempRis1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveTempRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));

		Ris1201DTO subDto = new Ris1201DTO();
		
		subDto.setHsptId(dto.getHsptId());
		subDto.setPkris1201(pkRis1201);
		subDto.setOrdrFk(dto.getOrdrFk());
		subDto.setMdfcId(dto.getMdfcId());
		
		int ris1301Data = pandokService.saveTempRis1301List(dto);
		int ris1201Data = pandokService.saveTempRis1201List(subDto);
		
		if (ris1301Data * ris1201Data == 1) {
			cnt += 1;
		}
		
		json.put("msg", "success");
		json.put("cnt", cnt);
		
		return json;
	}
	
	
	@RequestMapping(value = "/pandok/voiceRis1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject voiceRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));

		Ris1201DTO subDto = new Ris1201DTO();
		
		subDto.setHsptId(dto.getHsptId());
		subDto.setPkris1201(pkRis1201);
		subDto.setOrdrFk(dto.getOrdrFk());
		subDto.setMdfcId(dto.getMdfcId());
		
		int ris1301Data = pandokService.saveTempRis1301List(dto);
		int ris1201Data = pandokService.voiceRis1201List(subDto);
		
		if (ris1301Data * ris1201Data == 1) {
			cnt += 1;
		}
		
		json.put("msg", "success");
		json.put("cnt", cnt);
		
		return json;
	}
	
	
	@RequestMapping(value = "/pandok/voiceDownload.do", method = RequestMethod.POST)
	public void voiceDownload(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletResponse response) {
        Map<String, String> map = pandokService.voiceDownload(dto);

        String filePath = map.get("VOIC_VIEW_DRTR_NM");
        String fileName = map.get("VOIC_FILE_NM");
        
        System.out.println(filePath + fileName);

        File file = new File(filePath);
        
        try {
            if (file.exists()) {
                response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
                response.setContentLength((int) file.length());
                
                // 파일을 읽어와서 클라이언트로 복사합니다.
                FileInputStream inputStream = new FileInputStream(file);
                OutputStream outputStream = response.getOutputStream();
                
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                inputStream.close();
                outputStream.close();
            } else {
                // 파일이 존재하지 않을 때 처리
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (IOException e) {
            // IOException 처리
            e.printStackTrace();
            // 또는 다른 오류 처리 로직을 추가할 수 있습니다.
        }
	}
	
	
	@RequestMapping(value = "/pandok/finishRis1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject finishRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));

		Ris1201DTO subDto = new Ris1201DTO();
		
		subDto.setHsptId(dto.getHsptId());
		subDto.setPkris1201(pkRis1201);
		subDto.setOrdrFk(dto.getOrdrFk());
		subDto.setMdfcId(dto.getMdfcId());
		
		System.out.println(dto);
		System.out.println(subDto);
		int ris1301Data = pandokService.finishRis1301List(dto);
		System.out.println(ris1301Data);
		int ris1201Data = pandokService.finishRis1201List(subDto);
		System.out.println(ris1201Data);
		
		if (ris1301Data * ris1201Data == 1) {
			cnt += 1;
		}
		
		json.put("msg", "success");
		json.put("cnt", cnt);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/deleteRis1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));
		
		Ris1201DTO subDto = new Ris1201DTO();
		
		subDto.setHsptId(dto.getHsptId());
		subDto.setPkris1201(pkRis1201);
		subDto.setOrdrFk(dto.getOrdrFk());
		subDto.setMdfcId(dto.getMdfcId());
		
		int ris1301Data = pandokService.deleteRis1301List(dto);
		int ris1201Data = pandokService.deleteRis1201List(subDto);
		
		if (ris1301Data * ris1201Data == 1) {
			cnt += 1;
		}
		
		json.put("msg", "success");
		json.put("cnt", cnt);
		
		return json;
	}
}