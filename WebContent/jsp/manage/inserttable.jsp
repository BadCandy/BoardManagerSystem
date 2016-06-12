<%@ page import="java.util.*" contentType="text/html; charset=EUC-KR"%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<form name="insert" action="inserttable_confirm.jsp" method="post">
		<div class="form_settings">

			<p>
				<span>테이블 번호</span> <input type="text" name="tid">
			</p>
			<br>
			<p>
				<span>수용 인원</span> <input type="text" name="tnum">
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