<%@ include file="../database/dbconnection.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../head/head.jsp"%>

<body>

	<div id="header_container">
		<div class="container">
			<!-- Header -->
			<div id="header" class="row">
				<div class="4u">
					<div class="transparent">
						<h1>
							<a href="../home.jsp">��ö���� ������ӹ�<br> <span
								class="header_colour">�����ý���</span></a>
						</h1>
						<h2>
							�ȳ��ϼ���?<br>�����ڴ�. �� ���̹�����^��^
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="menubar" class="12u">
					<nav id="main-nav" class="12u">
					<ul>
						<li><a href="../home/home.jsp">����������</a></li>
						<li><a href="../customer/customer.jsp">�� ����</a></li>
						<li><a class="active" href="../manage/manage.jsp">��ǰ ����</a></li>
						<li><a href="../totalcal/totalcal.jsp">���� ����ǥ</a></li>
					</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<div id="site_content">
		<div class="container">

			<!-- Features -->
			<div class="row">
				<section class="8u">
				<div class="main_content">
					<h2>���̺� ����</h2>
					<table style="width: 80%; border-spacing: 0;">
						<tr>
							<th>���̺� ��ȣ</th>
							<th>���� �ο�</th>
							<th>���</th>
						</tr>

						<%
							String sql1 = " SELECT * FROM `table` ORDER BY `tid` ASC";

							try {
								pstmt = conn.prepareStatement(sql1);
								rs = pstmt.executeQuery();

								while (rs.next()) {
									String tId = rs.getString("tid");
									String tNum = rs.getString("total_num");
						%>
						<tr>
							<td><%=tId%></td>
							<td><%=tNum%></td>
							<td><a href="deletetable_confirm.jsp?tid=<%=tId%>" span
								style="color: red">���</a></td>
						</tr>

						<%
							}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						%>
					</table>

					<form name="insert" action="inserttable.jsp" method="post">
						<div class="form_settings">
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="addtable" value="���̺� �߰�" />
							</p>
						</div>
					</form>


					<h2>������� ����</h2>
					<table style="width: 80%; border-spacing: 0;">
						<tr>
							<th>������� ��ȣ</th>
							<th>������� �̸�</th>
							<th>���</th>
						</tr>

						<%
							String sql2 = " SELECT * FROM `boardgame` ORDER BY `bid` ASC";

							try {
								pstmt = conn.prepareStatement(sql2);
								rs = pstmt.executeQuery();

								while (rs.next()) {
									String bId = rs.getString("bid");
									String bName = rs.getString("bname");
						%>
						<tr>
							<td><%=bId%></td>
							<td><%=bName%></td>
							<td><a href="deleteboardgame_confirm.jsp?bid=<%=bId%>" span
								style="color: red">���</a></td>
						</tr>

						<%
							}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						%>
					</table>

					<form name="insert" action="insertboardgame.jsp" method="post">
						<div class="form_settings">
							<p style="padding-top: 15px;">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="addboardgame" value="���� �߰�" />
							</p>
						</div>
					</form>


					<h2>��� ����</h2>
					<table style="width: 80%; border-spacing: 0;">
						<tr>
							<th>�ð�</th>
							<th>���</th>
							<th>���� ����Ʈ</th>
							<th>��� ����/����</th>
						</tr>

						<%
							String sql3 = " SELECT * FROM `fee_per_time` ORDER BY `time` ASC";

							try {
								pstmt = conn.prepareStatement(sql3);
								rs = pstmt.executeQuery();

								while (rs.next()) {
									int n = 0;
									String time = rs.getString("time");
									String fee = rs.getString("fee");
									String point = rs.getString("point");
									if (Integer.parseInt(time) == 1) {
						%>
						<tr>
							<td><%=time%></td>
							<td><%=fee%></td>
							<td><%=point%></td>
							<td><a href="modifyfee.jsp?time=<%=time%>" span
								style="color: blue">����</a></td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td><%=time%></td>
							<td><%=fee%></td>
							<td><%=point%></td>
							<td><a href="deletefee_confirm.jsp?time=<%=time%>" span
								style="color: red">����</a></td>
						</tr>
						<%
							}
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						%>
					</table>

					<form name="insert" action="insertfee.jsp" method="post">
						<div class="form_settings">
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="addfee" value="��� �߰�" />
							</p>
						</div>
					</form>

				</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
<%
	pstmt.close();
	conn.close();
%>