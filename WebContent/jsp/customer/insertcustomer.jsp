<%@ page import="java.util.*" contentType="text/html; charset=EUC-KR"%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<form name="insert" action="insertcustomer_confirm.jsp" method="post">
		<div class="form_settings">
			<p>
				<span>첫 고객을 추가하기 전에   "없음"이라는 이름을 가지고 전화번호 0을가진 고객을 제일 먼저 추가하시오. </span>
				<br>
				<br>
			</p>
			<br>
			<br>
			<br>
			<p>
				<span>이름</span> <input type="text" name="cname">
			</p>
			<br>
			
			<p>
				<span>전화 번호(Form : 01099792598의 형태)</span> <input type="text"
					name="pnum">
			</p>
			<br>
			
			<p>
				<span>포인트</span> <input type="text" name="point" value=<%=0%>>
			</p>
			<br>
			
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit" name="save"
					value="추가하기">
			</p>
		</div>
	</form>

</body>
</html>