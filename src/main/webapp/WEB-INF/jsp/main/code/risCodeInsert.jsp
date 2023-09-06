<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/code/detail.css"/>
</head>
  <body>
    
    
    
    
    
    
    <!-- Main 화면 영역  Start -->
	
	<!-- 검색영역 설정 Start --> 
	<div class="inquiry__page-flex mt5">
      <section class="inquiry__search-section">
        <!-- 검색조건 영역 Start -->
       <div class="inquiry__search-flex" style="justify-content:space-between;"> <!-- 1 Row -->
			<div class="box__flex">
				<button class="process__btn ml-2" type="button" id="lrgc_reset" onclick="reset()">
					<img src="http://192.168.0.77:8081/images/jqgrid/btn_clear.png" class="mr-1" width="22px"/>
<!-- 					<span>새로고침</span> -->
					<span>새로고침</span>
				</button>
				
				<a href="javascript:fn_query()" class="ml-2">
					<button class="process__btn">
						<img src="http://192.168.0.77:8081/images/icons/white/calendar.png" class="mr-1" alt="수정" width="22px" />
<!-- 						<span>목록</span> -->
						<span>목록</span>
					</button>
				</a>
			</div>
			<div class="box__flex">
	            <a href="javascript:goSave('L');
					"  class="ml-2">
					<button class="process__btn">
						<img src='http://192.168.0.77:8081/images/jqgrid/btn_save.png' class="mr-1" alt='저장' width='22px' />
<!-- 						<span>저장</span> -->
						<span>저장</span>
					</button>
				</a>
        	</div>
        </div>
        <!-- 검색조건 영역 End -->
    	</section>  
		<!-- 검색영역 설정 End -->
		
		<!-- Data 영역설정 Start -->		   	
    	<section class="inquiry__result-section mt5">
		    
		    <form commandName="VO" id="lrgc_insertForm"	name="lrgc_insertForm" method="post" style="width:100%;">
				<input type="hidden" name="checkLMS" id="checkLMS" value="L" />
				<input type="hidden" name="q_user_id" id="q_user_id" value="" />
				<table class="table table-hover table-dark" style="width:100%;" >
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<tbody>
						
							<tr>
<!-- 								<th colspan="2" scope="row">*대분류코드</th> -->
								<th colspan="2" scope="row">*Division code</th>
								<td colspan="3">
									<input type="text" name="lrgc_cd" id="lrgc_cd" value=""
										 class="txt wx150" maxlength="20"/>
									
										<!-- <input type="button" value="중복체크" class="emphasis__btn" onclick="overlapCheck()" /> -->
<!-- 										<button type="button" class="emphasis__btn ml-2" onclick="overlapCheck('L')" style="display: inline-block;">중복확인</button> -->
										<button type="button" class="emphasis__btn ml-2" onclick="overlapCheck('L')" style="display: inline-block;">Duplicate check</button>
									
								</td >
<!-- 								<th  colspan="2">*대분류 한글 명</th> -->
								<th  colspan="2">*Divison Korean names</th>
								<td  colspan="3">
									<input type="text" name="lrgc_kr_nm" id="lrgc_kr_nm" value=""
										 class="txt wx150" maxlength="100"/>
								</td>
							</tr>
						
						
						
						
						
						
						<tr>
							
<!-- 								<th  colspan="2">대분류 영어 명</th> -->
								<th  colspan="2">Division, English names</th>
								<td  colspan="3">
									<input type="text" name="lrgc_engl_nm" id="lrgc_engl_nm" value="" class="txt wx150" maxlength="100"/>
								</td>
<!-- 								<th  colspan="2">대분류 약어 명</th> -->
								<th  colspan="2">Abbreviations for Division</th>
								<td  colspan="3">
									<input type="text" name="lrgc_abbr_nm" id="lrgc_abbr_nm" value="" class="txt wx150" maxlength="100"/>
								</td>
							
							
							
							
							
							
							
						</tr>
						
						<tr>
							
<!-- 								<th  colspan="2">*자릿수</th> -->
								<th colspan="2">*The number of digits</th>
								<td  colspan="3">
									<input type="text"
										name="lrgc_acph"
										id="lrgc_acph" 
										value=""
										onkeydown="javascript:fnOnlyNumber();" onblur="javascript:numcheck()" class="txt wx150" min="0" max="20" maxlength="2" />
								</td>
							
<!-- 							<th  colspan="2">*출력순</th> -->
							<th colspan="2">*Print order</th>
							<td  colspan="3">
								<input type="text" name="otpt_sqnc" id="otpt_sqnc" onkeydown="javascript:fnOnlyNumber();" 
								value="" class="txt wx150" min="0" maxlength="15"/>
							</td>
						</tr>
						
						<tr>
<!-- 							<th  colspan="2">*적용일자</th> -->
							<th colspan="2">*Effective date</th>
							<td  colspan="3">
								<input type="date" name="appl_date" id="appl_date" 
								value=""
								class="txt wx150" maxlength="10"/>
							</td>
<!-- 							<th  colspan="2">*불용일자</th> -->
							<th colspan="2">*Disused date</th>
							<td  colspan="3">
								<input type="date" name="expr_date" id="expr_date" 
								 value="3000-01-01"
								 class="txt wx150" maxlength="10"/>
							</td>
						</tr>
						
						
						
						<tr>
<!-- 							<th colspan="2" style="vertical-align: middle;">문자값1</th> -->
							<th colspan="2" style="vertical-align: middle;">Text value1</th>
							<td colspan="3">
								<textarea rows="3" style="width:80%" name="chrc1" id="chrc1" maxlength="999" ></textarea>
							</td>
<!-- 							<th colspan="2" style="vertical-align: middle;">숫자값1</th> -->
							<th colspan="2" style="vertical-align: middle;">Numeric value1</th>
							<td colspan="3" style="vertical-align: middle;">
								<input type="text" name="nmbr1" id="nmbr1" value="" onkeydown="javascript:fnOnlyNumber();" class="txt wx150" maxlength="20"/>
							</td>
						</tr>
						<tr>
<!-- 							<th colspan="2" style="vertical-align: middle;">문자값2</th> -->
							<th colspan="2" style="vertical-align: middle;">Text value2</th>
							<td colspan="3">
								<textarea rows="3" style="width:80%" name="chrc2" id="chrc2" maxlength="999" ></textarea>
							</td>
<!-- 							<th colspan="2" style="vertical-align: middle;">숫자값2</th> -->
							<th colspan="2" style="vertical-align: middle;">Numeric value2</th>
							<td colspan="3" style="vertical-align: middle;">
								<input type="text" name="nmbr2" id="nmbr2" value="" onkeydown="javascript:fnOnlyNumber();" class="txt wx150" maxlength="20"/>
							</td>
						</tr>
						<tr>
<!-- 							<th colspan="2" style="vertical-align: middle;">문자값3</th> -->
							<th colspan="2" style="vertical-align: middle;">Text value3</th>
							<td colspan="3">
								<textarea rows="3" style="width:80%" name="chrc3" id="chrc3" maxlength="999" ></textarea>
							</td>
<!-- 							<th colspan="2" style="vertical-align: middle;">숫자값3</th> -->
							<th colspan="2" style="vertical-align: middle;">Numeric value3</th>
							<td colspan="3" style="vertical-align: middle;">
								<input type="text" name="nmbr3" id="nmbr3" value="" onkeydown="javascript:fnOnlyNumber();" class="txt wx150" maxlength="20"/>
							</td>
						</tr>
						<tr>
<!-- 							<th colspan="2" style="vertical-align: middle;">문자값4</th> -->
							<th colspan="2" style="vertical-align: middle;">Text value4</th>
							<td colspan="3">
								<textarea rows="3" style="width:80%" name="chrc4" id="chrc4" maxlength="999" ></textarea>
							</td>
<!-- 							<th colspan="2" style="vertical-align: middle;">숫자값4</th> -->
							<th colspan="2" style="vertical-align: middle;">Numeric value4</th>
							<td colspan="3" style="vertical-align: middle;">
								<input type="text" name="nmbr4" id="nmbr4" value="" onkeydown="javascript:fnOnlyNumber();" class="txt wx150" maxlength="20"/>
							</td>
						</tr>
						<tr>
<!-- 							<th colspan="2" style="vertical-align: middle;">문자값5</th> -->
							<th colspan="2" style="vertical-align: middle;">Text value5</th>
							<td colspan="3">
								<textarea rows="3" style="width:80%" name="chrc5" id="chrc5" maxlength="999" ></textarea>
							</td>
<!-- 							<th colspan="2" style="vertical-align: middle;">숫자값5</th> -->
							<th colspan="2" style="vertical-align: middle;">Numeric value5</th>
							<td colspan="3" style="vertical-align: middle;">
								<input type="text" name="nmbr5" id="nmbr5" value="" onkeydown="javascript:fnOnlyNumber();" class="txt wx150" maxlength="20"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		    
		</section>
        <!-- Data 영역설정 End --> 
        
	    <!-- 버튼 영역 Start(하단) --> 
		<!-- <section class="inquiry__btn-section mt5">
	        <div class="inquiry__btn-left">
	          <a href=""><button class="process__btn"><img src="/images/icons/white/download.png" alt="" width="18px" /><span>엑셀다운</span></button></a>
	        </div>
	        <div class="inquiry__btn-right">
	          <a href=""><button class="process__btn"><img src="/images/icons/white/inquiry.png" alt="" width="18px" /><span>&nbsp;조 회&nbsp;</span></button></a>
	          <a href=""><button class="process__btn"><img src="/images/icons/white/close.png" alt="" width="18px" /><span>&nbsp;닫 기&nbsp;</span></button></a>
	        </div>
	    </section>  -->
	    <!-- 버튼 영역 End -->
	</div>
    
    
    
    
    
    
    
    
  </body>
</html>