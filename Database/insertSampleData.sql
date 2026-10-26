/******************* Insert Department data ********************/
insert into Department (departmentName)
values
('Human Resources'),
('Information Technology'),
('Finance'),
('Marketing'),
('Operations'),
('Sales'),
('Customer Support'),
('Research and Development');


/****************** Insert Employee Data **********************/
insert into Employee
(
employeeFirstName,
employeeLastName,
emailAddress,
phoneNumber,
gender,
hireDate,
departmentId,
position,
basicSalary
)
values
('John','Smith','john.smith@employeehub.com','9876543201','Male','2023-01-15',101,'Software Engineer',65000),
('Emma','Johnson','emma.johnson@employeehub.com','9876543202','Female','2022-08-10',100,'HR Executive',45000),
('Michael','Brown','michael.brown@employeehub.com','9876543203','Male','2021-05-12',102,'Financial Analyst',60000),
('Sophia','Davis','sophia.davis@employeehub.com','9876543204','Female','2024-02-01',103,'Marketing Specialist',50000),
('William','Miller','william.miller@employeehub.com','9876543205','Male','2020-09-20',104,'Operations Manager',80000),
('Olivia','Wilson','olivia.wilson@employeehub.com','9876543206','Female','2023-06-14',101,'Database Developer',70000),
('James','Moore','james.moore@employeehub.com','9876543207','Male','2021-03-18',101,'System Administrator',68000),
('Ava','Taylor','ava.taylor@employeehub.com','9876543208','Female','2022-11-22',100,'Recruiter',42000),
('Benjamin','Anderson','ben.anderson@employeehub.com','9876543209','Male','2019-07-05',102,'Accountant',55000),
('Isabella','Thomas','isabella.thomas@employeehub.com','9876543210','Female','2023-10-09',103,'Content Strategist',47000),
('Lucas','Jackson','lucas.jackson@employeehub.com','9876543211','Male','2021-01-11',104,'Operations Executive',52000),
('Mia','White','mia.white@employeehub.com','9876543212','Female','2022-04-14',105,'Sales Executive',50000),
('Ethan','Harris','ethan.harris@employeehub.com','9876543213','Male','2020-12-07',105,'Sales Manager',75000),
('Charlotte','Martin','charlotte.martin@employeehub.com','9876543214','Female','2024-01-03',106,'Customer Support Associate',38000),
('Alexander','Thompson','alex.thompson@employeehub.com','9876543215','Male','2023-07-19',106,'Customer Support Lead',55000),
('Amelia','Garcia','amelia.garcia@employeehub.com','9876543216','Female','2022-02-17',107,'Research Analyst',62000),
('Daniel','Martinez','daniel.martinez@employeehub.com','9876543217','Male','2020-06-23',107,'R&D Engineer',78000),
('Harper','Robinson','harper.robinson@employeehub.com','9876543218','Female','2023-05-04',101,'QA Engineer',60000),
('Matthew','Clark','matthew.clark@employeehub.com','9876543219','Male','2021-09-29',102,'Senior Accountant',72000),
('Evelyn','Rodriguez','evelyn.rodriguez@employeehub.com','9876543220','Female','2024-03-12',103,'Digital Marketing Executive',48000),
('Arjun','Mehta','arjun.mehta@employeehub.com','9876543301','Male','2023-04-15',101,'Software Developer',68000),
('Priya','Nair','priya.nair@employeehub.com','9876543302','Female','2022-09-12',100,'HR Manager',75000),
('Rahul','Verma','rahul.verma@employeehub.com','9876543303','Male','2021-07-18',103,'Finance Executive',55000),
('Sneha','Kulkarni','sneha.kulkarni@employeehub.com','9876543304','Female','2024-01-08',103,'Marketing Analyst',52000),
('Kiran','Reddy','kiran.reddy@employeehub.com','9876543305','Male','2020-11-25',104,'Operations Supervisor',70000),
('Ananya','Sharma','ananya.sharma@employeehub.com','9876543306','Female','2023-03-21',101,'Business Analyst',62000),
('Vikram','Patel','vikram.patel@employeehub.com','9876543307','Male','2021-08-30',101,'System Engineer',65000),
('Pooja','Iyer','pooja.iyer@employeehub.com','9876543308','Female','2022-06-14',105,'Sales Executive',48000),
('Rohan','Gupta','rohan.gupta@employeehub.com','9876543309','Male','2019-12-10',105,'Regional Sales Manager',82000),
('Deepika','Rao','deepika.rao@employeehub.com','9876543310','Female','2023-10-01',106,'Customer Support Executive',42000),
('Sandeep','Joshi','sandeep.joshi@employeehub.com','9876543311','Male','2020-04-19',107,'Research Engineer',78000),
('Neha','Bansal','neha.bansal@employeehub.com','9876543312','Female','2021-02-23',102,'Accountant',56000),
('Akash','Malhotra','akash.malhotra@employeehub.com','9876543313','Male','2022-12-05',104,'Operations Executive',50000),
('Divya','Singh','divya.singh@employeehub.com','9876543314','Female','2024-03-11',103,'Digital Marketing Associate',47000),
('Manoj','Chauhan','manoj.chauhan@employeehub.com','9876543315','Male','2021-09-27',106,'Customer Support Lead',60000),
('Keerthi','Shetty','keerthi.shetty@employeehub.com','9876543316','Female','2023-05-16',107,'Data Research Analyst',64000);



/**************************  Attendance Data *************************/
DECLARE @CurrentDate DATE = '2026-09-01';

while @CurrentDate <= '2026-09-30'
begin
    DECLARE @EmployeeID INT = 1017;

    while @EmployeeID <= 1052
    begin

        DECLARE @Random INT =
            abs(checksum(newid())) % 100 + 1;

        DECLARE @Status VARCHAR(20);

        SET @Status =
            case
                when @Random <= 80 then 'Present'
                when @Random <= 88 then 'WFH'
                when @Random <= 93 then 'Leave'
                when @Random <= 97 then 'Half Day'
                else 'Absent'
            end;

        insert into Attendance
        (
            EmployeeID,
            AttendanceDate,
            CheckIn,
            CheckOut,
            Status
        )
        values
        (
            @EmployeeID,
            @CurrentDate,

            case
                when @Status in ('Leave','Absent')
                    then NULL
                when @Status = 'Half Day'
                    then cast(
                        dateadd(
                            minute,
                            abs(checksum(newid())) % 30,
                            '09:00'
                        ) as TIME
                    )
                else cast(
                        dateadd(
                            minute,
                            abs(checksum(newid())) % 45,
                            '09:00'
                        ) as TIME
                    )
            end,

            case
                when @Status in ('Leave','Absent')
                    then NULL
                when @Status = 'Half Day'
                    then cast(
                        dateadd(
                            minute,
                            abs(checksum(newid())) % 60,
                            '13:00'
                        ) as TIME
                    )
                else cast(
                        dateadd(
                            minute,
                            abs(checksum(newid())) % 90,
                            '18:00'
                        ) as TIME
                    )
            end,
            @Status
        );

        SET @EmployeeID = @EmployeeID + 1;
    end

    SET @CurrentDate = dateadd(day,1,@CurrentDate);

end;


/************************ Leave Request Data **********************/
DECLARE @Counter INT = 1;

while @Counter <= 100
begin

    insert into LeaveRequest
    (
        EmployeeID,
        LeaveType,
        StartDate,
        EndDate,
        Status
    )
    values
    (
        1017 + ((@Counter - 1) % 36),

        case abs(checksum(newid())) % 5
            when 0 then 'Sick Leave'
            when 1 then 'Casual Leave'
            when 2 then 'Compensatory Off Leave'
            when 3 then 'Maternity Leave'
            else 'Paternity Leave'
        end,

        dateadd(
            day,
            abs(checksum(newid())) % 25,
            '2026-09-01'
        ),

        dateadd(
            day,
            (abs(checksum(newid())) % 3) + 1,
            dateadd(
                DAY,
                abs(checksum(newid())) % 25,
                '2026-09-01'
            )
        ),

        case abs(checksum(newid())) % 4
            when 0 then 'Approved'
            when 1 then 'Rejected'
            when 2 then 'Pending'
            else 'Cancelled'
        end
    );

    SET @Counter = @Counter + 1;

end;


/*****************  Payroll Data *******************/
insert into Payroll
(
    employeeID,
    payrollMonth,
    basicSalary,
    allowance,
    deduction,
    netSalary
)
select
    e.employeeID,
    '2026-09-30',
    e.basicSalary,
    p.allowance,
    p.deduction,
    e.basicSalary + p.allowance - p.deduction
FROM Employee e
cross apply
(
    select
        round(e.basicSalary * 0.15, 2) AS allowance,
        round(
            e.basicSalary *
            ((abs(checksum(newid())) % 8 + 5) / 100.0),
            2
        ) as deduction
) p;