<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<head>
<title>보드게임방 관리시스템</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!--[if lte IE 8]><script src="html5shiv.js" type="text/javascript"></script><![endif]-->
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="../../js/jquery.dropotron.min.js"></script>
<script src="../../js/skel.min.js">
		{
			prefix: '../../css/style',
			preloadStyleSheets: true,
			resetCSS: true,
			boxModel: 'border',
			grid: { gutters: 30 },
			breakpoints: {
				wide: { range: '1400-', containers: 1140, grid: { gutters: 50 } },
				narrow: { range: '481-1500', containers: 1500 },
				mobile: { range: '-480', containers: 'fluid', lockViewport: true, grid: { collapse: true } }
			}
		} 
		</script>
<script>
			$(function() {
				// Note: make sure you call dropotron on the top level <ul>
				$('#main-nav > ul').dropotron({ 
					offsetY: -10 // Nudge up submenus by 10px to account for padding
				});
			});
		</script>
<script>
			// DOM ready
			$(function() {
    
			// Create the dropdown base
			$("<select />").appendTo("nav");
   
			// Create default option "Go to..."
			$("<option />", {
				"selected": "selected",
				"value"   : "",
				"text"    : "Menu"
			}).appendTo("nav select");
   
			// Populate dropdown with menu items
			$("nav a").each(function() {
			var el = $(this);
			$("<option />", {
				"value"   : el.attr("href"),
				"text"    : el.text()
			}).appendTo("nav select");
			});
   
			// To make dropdown actually work
			// To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
			$("nav select").change(function() {
				window.location = $(this).find("option:selected").val();
			});
  
			});
		</script>
</head>