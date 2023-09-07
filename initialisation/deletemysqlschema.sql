DROP PROCEDURE IF EXISTS delete_all_tables_and_indexes;
DELIMITER //

CREATE PROCEDURE delete_all_tables_and_indexes ()
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE command_text VARCHAR(255);
	DECLARE table_index_cursor CURSOR FOR
	SELECT CONCAT('DROP TABLE IF EXISTS `', table_name, '`;') AS  command_content 
	FROM information_schema.tables
	WHERE table_schema NOT IN ('sys', 'mysql', 'information_schema', 'performance_schema');
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	SET FOREIGN_KEY_CHECKS = 0;
	OPEN table_index_cursor;
		drop_loop: LOOP
			FETCH table_index_cursor INTO command_text;
			IF done THEN
				LEAVE drop_loop;
			END IF;
			
			SET @drop_query = command_text;
			PREPARE stmt FROM @drop_query;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
		END LOOP;
	CLOSE table_index_cursor;
	SET FOREIGN_KEY_CHECKS = 1;
END //

DELIMITER ;
CALL  delete_all_tables_and_indexes();