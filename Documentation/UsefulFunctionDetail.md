NEWID() in SQL Server generates a unique identifier (GUID - Globally Unique Identifier).
        SELECT NEWID();
        6F9619FF-8B86-D011-B42D-00C04FC964FF
		#To customize GUID we need explicit customized solution
		SELECT
			'EMP' +
			FORMAT(GETDATE(), 'yyyyMMdd') +
			'-' +
			LEFT(CAST(NEWID() AS VARCHAR(36)), 8) AS EmployeeCode;