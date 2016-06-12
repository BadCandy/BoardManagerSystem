<%@ page import="java.util.*" contentType="text/html; charset=EUC-KR"%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<form name="insert" action="insertboardgame_confirm.jsp" method="post">
		<div class="form_settings">
			<br>
			<p>
				<span>보드게임 이름</span> <input type="text" name="bname">
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