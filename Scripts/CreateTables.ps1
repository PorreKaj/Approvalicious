#Requires -Modules invoke-SQLCMD2

$Server = "CIMa\CIMa"
$Database = "CIMa_Approvals"

$CreateMainTableQuery = "

CREATE TABLE ApprovalRequests (
    ApprovalID int IDENTITY(1,1) PRIMARY KEY,
    ApprovalGUID UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID(),
    
    RequestStatus varchar(255),
    RequestDate datetime,
    RequestProduct varchar(255),
    RequestResult varchar(255),
    RequestResultDate datetime,
    RequestRestultExpirationDate datetime,

    Source varchar(255),
    SourceID varchar(255),
    
    RequesteeUsername varchar(255),
    RequesteeObjectGUID varchar(255),
    RequesteeComment varchar(max),

    ApproverUsername varchar(255),
    ApproverObjectGUID varchar(255),
    ApproverComment varchar(max)
    
);


"

Invoke-Sqlcmd2 -ServerInstance $Server -Database $Database -Query $CreateMainTableQuery