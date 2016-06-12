<%@ include file="../database/dbconnection.jsp"%>
<%@ page import="java.util.*" contentType="text/html; charset=EUC-KR"%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<form name="insert" action="insertcurinfo_confirm.jsp" method="post">
		<div class="form_settings">

			<p>
			<p>
				<span>���̺� ��ȣ</span> <select id="id" name="tid">
					<%
						pstmt = conn
								.prepareStatement(" SELECT tid FROM `table` WHERE `is_empty` = ?");
						pstmt.setBoolean(1, true);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							int tid = rs.getInt("tid");
					%>
					<option value=<%=tid%>><%=tid%></option>
					<%
						}
					%>
				</select>
			</p>

			<br>
			<p>
			<p>
				<span>��� �� �������</span> <select id="id" name="bname">
					<%
						pstmt = conn
								.prepareStatement(" SELECT bname FROM `boardgame` WHERE `is_use` = ?");
						pstmt.setBoolean(1, true);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							String boardgame = rs.getString("bname");
					%>
					<option value=<%=boardgame%>><%=boardgame%></option>
					<%
						}
					%>
				</select>
			</p>
			<br>
			<p>
				<span>������ ��ȭ��ȣ(���� : 01012345678, ������� 0 �Է�)</span> <input
					type="text" name="pnum" value="0">
			</p>
			<br> <br>

			<p>
			<p>
				<span>��� �ð�</span> <select id="id" name="time">
					<%
						pstmt = conn.prepareStatement("SELECT time FROM `fee_per_time`");
						rs = pstmt.executeQuery();
						while (rs.next()) {
							String time = rs.getString("time");
					%>
					<option value=<%=time%>><%=time%></option>
					<%
						}
					%>
				</select>
			</p>
			<br>

			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit" name="save"
					value="�߰��ϱ�">
			</p>
		</div>
	</form>

</body>
</html>