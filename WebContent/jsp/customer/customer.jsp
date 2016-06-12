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
							<a href="home.jsp">��ö���� ������ӹ�<br> <span class="header_colour">�����ý���</span></a>
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
						<li><a class="active" href="../customer/customer.jsp">��
								����</a></li>
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
			<div class="row">
				<section class="8u">
				<div class="main_content">
					<h2>�� ����</h2>
					<table style="width: 90%; border-spacing: 0;">
						<tr>
							<th>�� ��ȣ</th>
							<th>�� �̸�</th>
							<th>��ȭ ��ȣ</th>
							<th>����Ʈ</th>
							<th>����/����</th>
						</tr>

						<%
							String sql1 = " SELECT * FROM `customer` WHERE `cid` >= 1 ORDER BY `cid` ASC";
							try {
								pstmt = conn.prepareStatement(sql1);
								rs = pstmt.executeQuery();
								while (rs.next()) {
									String cId = rs.getString("cid");
									String cName = rs.getString("cname");
									String pNum = rs.getString("p_num");
									String point = rs.getString("point");
						%>
						<tr>
							<td><%=cId%></td>
							<td><%=cName%></td>
							<td><%=pNum%></td>
							<td><%=point%></td>
							<td><a href="modifycustomer.jsp?cid=<%=cId%>" span
								style="color: blue">����</a> &nbsp;<a
								href="deletecustomer_confirm.jsp?cid=<%=cId%>" span
								style="color: red">����</a>
						</tr>

						<%
							}
							} catch (SQLException e) {
								e.printStackTrace();
							}
						%>
					</table>

					<form name="insert" action="insertcustomer.jsp" method="post">
						<div class="form_settings">
							<p style="padding-top: 15px">
								<span>&nbsp;</span><input class="submit" type="submit"
									name="addcustomer" value="�� �߰�" />
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