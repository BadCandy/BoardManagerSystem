<%@ page import="java.util.*" contentType="text/html; charset=EUC-KR"%>

<html>
<%@ include file="../head/head.jsp"%>

<body>
	<form name="insert" action="insertcustomer_confirm.jsp" method="post">
		<div class="form_settings">
			<p>
				<span>ù ���� �߰��ϱ� ����   "����"�̶�� �̸��� ������ ��ȭ��ȣ 0������ ���� ���� ���� �߰��Ͻÿ�. </span>
				<br>
				<br>
			</p>
			<br>
			<br>
			<br>
			<p>
				<span>�̸�</span> <input type="text" name="cname">
			</p>
			<br>
			
			<p>
				<span>��ȭ ��ȣ(Form : 01099792598�� ����)</span> <input type="text"
					name="pnum">
			</p>
			<br>
			
			<p>
				<span>����Ʈ</span> <input type="text" name="point" value=<%=0%>>
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