<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/myPage/myPageCommon.jsp"%>
<link rel="stylesheet" href="${path }/resources/css/myPage_petEnrollStyle.css" />
<div class="myPageMain_top">
	<div class="myPageMain_topBox">
		<div class="myPageMain_loc">
			<ul>
				<li onclick="location.href='${path}/main/myPageMain'"><img
					src="${path}/resources/images/back.png" width="18px"></li>
				<li>Member</li>
				<li>마이 페이지에 오신 걸 환영합니다.</li>
			</ul>
		</div>
	</div>
</div>
<br />

<div class="myPageMain_right">
	<div id="petEnroll-container">
		<form name="memberEnrollFrm"
			action="${pageContext.request.contextPath}/pet/petUpdateEnd.do"
			method="post" onsubmit="return validate();"
			enctype="multipart/form-data">
			<div class="petEnroll-containerBox">
			<div class="petEnroll-containerRow">

					<div class="memberImageBox">
						<div class="memberImage">
							<div class="inputBackground" id="image_section">
								<div class="memberImage">
									<img class="fileUploadIcon" width="100px" height="100px" src="${pageContext.request.contextPath}/resources/upload/petProfile/${pet.petRenamedImage}"/>
									<input type="file" class="profileImgBox" name="petRenamedImage" id="petRenamedImage" />
								</div>
							</div>
							<img alt="camaraIcon" class="image_section" src="${path}/resources/images/camaraIcon30.png"/>
						</div>
					</div>
					
				</div>
	
			<div class="petEnroll-containerRow">
					<div class="petEnroll-containerCol1">
						반려동물명
					</div>
					<div class="petEnroll-containerCol2">
						<input type="text" class="form-control" placeholder="반려동물 이름" value="${pet.petName}" name="petName" id="petName" required>
					</div>
					
				</div>
			
			<div class="petEnroll-containerRow">
					<div class="petEnroll-containerCol1">
						품종
					</div>
					<div class="petEnroll-containerCol2">
						
							<select name="petType" id="petType" onchange="petTypeChange()" required>
								<option value="">선택해주세요.</option>
								<option value="Dog" ${pet.petType eq "Dog"?"selected":""}>강아지</option>
								<option value="Cat" ${pet.petType eq "Cat"?"selected":""}>고양이</option>
								<option value="GuineaPig" ${pet.petType eq "GuineaPig"?"selected":""}>기니피그</option>
								<option value="Rabbit" ${pet.petType eq "Rabbit"?"selected":""}>토끼</option>
								<option value="Hedgehog" ${pet.petType eq "Hedgehog"?"selected":""}>고슴도치</option>
								<option value="Turtle" ${pet.petType eq "Turtle"?"selected":""}>거북이</option>
								<option value="Bird" ${pet.petType eq "Bird"?"selected":""}>조류</option>
								<option value="etc" ${pet.petType eq "etc"?"selected":""}>기타</option>
							</select>
						
					</div>
				</div>
			
			<div class="petEnroll-containerRow">
					<div class="petEnroll-containerCol1">
					종류
					</div>
					<div class="petEnroll-containerCol2">
						<input type="hidden" name="oriFile" value="${pet.petRenamedImage}" /> 
						<input type="text" class="form-control" placeholder="상세품종을 적어주세요" name="petType2" id="petType2" value="${pet.petType2 }" required>
					</div>
				</div>
			<div class="petEnroll-containerRow">
					<div class="petEnroll-containerCol1">
						탄생일
					</div>
					<div class="petEnroll-containerCol2">
						<input type="date" class="form-control" name="petBirth" value="${petBirthStr }"/>
					</div>
				</div>
			
			
			<div class="petEnroll-containerRow">
			<input type="hidden" name="memberSeq" value="${loggedMember.getMemberSeq() }" /> 
			<input type="hidden" name="petSeq" value="${pet.petSeq }" /> 
			<input type="submit" class="logPageBtn" class="btn btn-outline-success" value="수정">&nbsp; 
			<input type="button" class="logPageBtn" class="btn btn-outline-success" onclick="fn_del();" value="삭제">
			</div>

</div>
		</form>
	</div>
</div>
</section>
<script>
	//회원 사진 보여주기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.fileUploadIcon').attr('src', e.target.result).width(100)
						.height(100);
			}
			reader.readAsDataURL(input.files[0]);
		}
		;
	};
	$('#petRenamedImage').change(function() {
		readURL(this);
	});
	//수정
	function fn_update() {
		$("[name=petUpdateFrm]").attr("action", "${path}/pet/petUpdateEnd.do");
		var updateFlag = confirm("반려동물 정보를 수정하시겠습니까?");
		if (updateFlag) {
			return true;
		} else {
			return false;
		}
	}
	//삭제
	function fn_del() {
		var updateFlag = confirm("반려동물 삭제하시겠습니까?");

		if (updateFlag) {
			var form = $("[name=petUpdateFrm]");
			$(form).attr("action", "${path}/pet/petDel.do");
			$(form).attr("onsubmit", null);
			$(form).submit();
			return true;
		}else{
			return false;
		}
	}

	/* function validate(){
	 var petName=$("#petName").val().trim();
	 } */
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
