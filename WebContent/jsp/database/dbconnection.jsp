<%@ page import="java.sql.*" contentType="text/html; charset=EUC-KR"%>
<%
	String id = "root";
	String pwd = "jsg115881";
	String url = "jdbc:mysql://localhost/boardgameroom";
	try {
		// MySQL과 연결하기 위해 드라이버를 로딩
		Class.forName("com.mysql.jdbc.Driver");
	} catch (Exception ex) {
	}

	Connection conn = null;
	try {
		conn = // 접근하기 위한 주소(와 아이디, 패스워드를 받아 MySQL과 접속시켜준다.
		DriverManager.getConnection(url, id, pwd);
	} catch (SQLException ex) {}

	PreparedStatement pstmt = null;
/*	pstmt = conn.prepareStatement("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;" +
	"SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;" +
	"SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';" +
	"CREATE SCHEMA IF NOT EXISTS `BoardGameRoom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"+
			"USE `BoardGameRoom` ;"+
	"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`Customer` ("+
			"`cid` INT NOT NULL AUTO_INCREMENT," +
	"`cname` VARCHAR(45) NOT NULL,"+
			"`p_num` VARCHAR(11) NOT NULL,"+
	"`point` INT NULL,"+
			"PRIMARY KEY (`cid`))"+
	"ENGINE = InnoDB;"+
			"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`Table` ("+
	"`tid` INT NOT NULL AUTO_INCREMENT,"+
			"`total_num` INT NOT NULL,"+
	"`is_empty` TINYINT(1) NOT NULL,"+
			"PRIMARY KEY (`tid`))"+
	"ENGINE = InnoDB;"+
			"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`Boardgame` ("+
	"`bid` INT NOT NULL AUTO_INCREMENT,"+
			"`bname` VARCHAR(45) NOT NULL,"+
	"`is_use` TINYINT(1) NOT NULL,"+
			" PRIMARY KEY (`bid`))"+
	"ENGINE = InnoDB;"+
			"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`Fee_per_time` ("+
	"`time` INT NOT NULL,"+
			" `fee` INT NOT NULL,"+
	"`point` INT NOT NULL,"+
			"PRIMARY KEY (`time`))"+
	"ENGINE = InnoDB;"+
			"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`Sit` ("+
	" `stid` INT NOT NULL AUTO_INCREMENT,"+
			"`s_time` DATETIME NOT NULL,"+
	"`e_time` DATETIME NOT NULL,"+
			"`cid` INT NULL,"+
	"`tid` INT NOT NULL,"+
			"PRIMARY KEY (`stid`, `cid`, `tid`),"+
	"INDEX `fk_Customer_has_Table_Table1_idx` (`tid` ASC),"+
			"INDEX `fk_Customer_has_Table_Customer_idx` (`cid` ASC),"+
	"CONSTRAINT `fk_Customer_has_Table_Customer`"+
					"FOREIGN KEY (`cid`)"+
	"REFERENCES `BoardGameRoom`.`Customer` (`cid`)"+
					"ON DELETE NO ACTION"+
	"ON UPDATE NO ACTION,"+
					"CONSTRAINT `fk_Customer_has_Table_Table1`"+
			"FOREIGN KEY (`tid`)"+
					"REFERENCES `BoardGameRoom`.`Table` (`tid`)"+
			"ON DELETE NO ACTION"+
					"ON UPDATE NO ACTION)"+
			"ENGINE = InnoDB;"+
				"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`Play` ("+
			"`pid` INT NOT NULL AUTO_INCREMENT,"+
				"`time` INT NOT NULL,"+
			"`tid` INT NOT NULL,"+
				"`bid` INT NOT NULL,"+
			"PRIMARY KEY (`pid`, `tid`, `bid`),"+
				"INDEX `fk_Table_has_Boardgame_Boardgame1_idx` (`bid` ASC),"+
			"INDEX `fk_Table_has_Boardgame_Table1_idx` (`tid` ASC),"+
				"INDEX `fk_Play_game_Fee_per_time1_idx` (`time` ASC),"+
			"CONSTRAINT `fk_Table_has_Boardgame_Table1`"+
						"FOREIGN KEY (`tid`)"+
			"REFERENCES `BoardGameRoom`.`Table` (`tid`)"+
						"ON DELETE NO ACTION"+
			"ON UPDATE NO ACTION,"+
			"CONSTRAINT `fk_Table_has_Boardgame_Boardgame1`"+
					"FOREIGN KEY (`bid`)"+
		"REFERENCES `BoardGameRoom`.`Boardgame` (`bid`)"+
					"ON DELETE NO ACTION"+
		"ON UPDATE NO ACTION,"+
					"CONSTRAINT `fk_Play_game_Fee_per_time1`"+
				"FOREIGN KEY (`time`)"+
					"REFERENCES `BoardGameRoom`.`Fee_per_time` (`time`)"+
				"ON DELETE NO ACTION"+
					"ON UPDATE NO ACTION)"+
				"ENGINE = InnoDB;"+
					"CREATE TABLE IF NOT EXISTS `BoardGameRoom`.`total_cal` ("+
				"`date` INT NOT NULL,"+
					"`total_money` INT NULL DEFAULT 0,"+
				"PRIMARY KEY (`date`))"+
					"ENGINE = InnoDB;"+
				"SET SQL_MODE=@OLD_SQL_MODE;"+
					"SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;"+
				"SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;");
	
	pstmt.executeQuery();*/
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
%>