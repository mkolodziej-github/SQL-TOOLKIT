-- list of users who have sysadmins rights withs status (disabled or not)

SELECT 'Name' = sp.NAME, 
   sp.is_disabled AS [Is_disabled]
FROM sys.server_role_members rm, 
   sys.server_principals sp
WHERE rm.role_principal_id = SUSER_ID('Sysadmin')
   AND rm.member_principal_id = sp.principal_id
