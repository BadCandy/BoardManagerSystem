<%@ include file="../database/dbconnection.jsp"%>
<%@ page import="java.util.*" contentType="text/html; charset=EUC-KR"%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<form name="insert" action="insertcurinfo_confirm.jsp" method="post">
		<div class="form_settings">

			<p>
			<p>
				<span>테이블 번호</span> <select id="id" name="tid">
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
				<span>사용 할 보드게임</span> <select id="id" name="bname">
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
				<span>고객님의 전화번호(형식 : 01012345678, 없을경우 0 입력)</span> <input
					type="text" name="pnum" value="0">
			</p>
			<br> <br>

			<p>
			<p>
				<span>사용 시간</span> <select id="id" name="time">
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
					value="추가하기">
			</p>
		</div>
	</form>

</body>
</html>