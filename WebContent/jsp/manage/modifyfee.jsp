<%@ include file="../database/dbconnection.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	int time = Integer.parseInt(request.getParameter("time"));
	pstmt = conn
			.prepareStatement(" SELECT * FROM `fee_per_time` WHERE `time` = ?");
	pstmt.setInt(1, time);
	rs = pstmt.executeQuery();

	if (rs != null) {
		rs.next();
		int fee = rs.getInt("fee");
		int point = rs.getInt("point");
%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<h2>������ ����</h2>
	<form name="update" action="modifyfee_confirm.jsp" method="post">
		<input type="hidden" name="time" value="<%=time%>">
		<div class="form_settings">
			<p>
				<span>�ð��� ���</span> <input type="text" name="fee" value=<%=fee%>>
			</p>
			<br>
			<p>
				<span>���� ����Ʈ</span> <input type="text" name="point" value=<%=point%>>
			</p>
			<br>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit" name="save"
					value="�����Ϸ�">
			</p>
		</div>
	</form>
</body>
</html>

<%
	}
	pstmt.close();
	conn.close();
%>