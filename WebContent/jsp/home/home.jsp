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
							<a href="../home/home.jsp">��ö���� ������ӹ�<br> <span
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
						<li><a class="active" href="../home/home.jsp">����������</a></li>
						<li><a href="../customer/customer.jsp">�� ����</a></li>
						<li><a href="../manage/manage.jsp">��ǰ ����</a></li>
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
					<h2>���� ������� ���̺�� �������</h2>
					<table style="width: 100%; border-spacing: 0;">
						<tr>
							<th>���̺� ��ȣ</th>
							<th>������� �������</th>
							<th>���� �ð�</th>
							<th>���� �ð�</th>
							<th>ȸ��</th>
							<th>���</th>
							<th>��Ÿ</th>
						</tr>

						<%
							String sql1 = "SELECT * FROM `sit` S LEFT JOIN `play` P USING(tid) ORDER BY `tid` ASC";
							try {
								pstmt = conn.prepareStatement(sql1);
								rs = pstmt.executeQuery();

								while (rs.next()) {
									String tid = rs.getString("tid");
									String sTime = rs.getString("s_time");
									String eTime = rs.getString("e_time");
									String cId = rs.getString("cid");
									String time = rs.getString("time");
									String bId = rs.getString("bid");
									String bName = null;
									String fee = null;
									String cName = null;

									String sql2 = " SELECT * FROM `customer` WHERE `cid` = ?";
									pstmt = conn.prepareStatement(sql2);
									pstmt.setString(1, cId);
									rs2 = pstmt.executeQuery();
									if (rs2.next()) {
										cName = rs2.getString("cname");
									}

									String sql3 = " SELECT * FROM `fee_per_time` WHERE `time` = ?";
									pstmt = conn.prepareStatement(sql3);
									pstmt.setString(1, time);
									rs2 = pstmt.executeQuery();
									if (rs2.next()) {
										fee = rs2.getString("fee");
									}

									String sql4 = " SELECT * FROM `boardgame` WHERE `bid` = ?";
									pstmt = conn.prepareStatement(sql4);
									pstmt.setString(1, bId);
									rs2 = pstmt.executeQuery();
									if (rs2.next()) {
										bName = rs2.getString("bname");
									}
						%>
						<tr>
							<td><%=tid%></td>
							<td><%=bName%></td>
							<td><%=sTime%></td>
							<td><%=eTime%></td>
							<td><%=cName%></td>
							<td><%=fee%></td>
							<td><a href="calculate_confirm.jsp?tid=<%=tid%>" span
								style="color: blue">����</a> &nbsp;<a
								href="cancelcurinfo_confirm.jsp?tid=<%=tid%>" span
								style="color: red">���</a>
						</tr>

						<%
							}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						%>
					</table>

					<form name="insert" action="insertcurinfo.jsp" method="post">
						<div class="form_settings">
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="addcurinfo" value="���̺� �Ҵ�" />
							</p>
						</div>
					</form>

				</div>
			</div>
		</div>
</body>
</html>
