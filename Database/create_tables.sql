/************** Department table ****************/
create table Department (
departmentID int identity(100,1) primary key,
departmentName varchar(100) not null
);


/************** Employee table ***************/
create table Employee (
	employeeId int identity(1000,1) primary key,
	employeeFirstName varchar(50) not null,
	employeeLastName varchar(50) not null,
	emailAddress varchar(50),
	phoneNumber varchar(20),
	gender varchar(10),
	hireDate date,
	departmentId int,
	position varchar(50),
	basicSalary decimal(12,2)

	foreign key (departmentId) references Department(departmentId)
);


/************** Attendence table to tack Employee attendence ***************/
create table Attendance (
    attendanceID int identity(1,1) primary key,
    employeeID int,
    attendanceDate date,
    checkIn time,
    checkOut time,
    status varchar(20),

    foreign key (employeeID) references Employee(employeeID)
);



/************** Leave Request table to track employee vacations ***************/
create table LeaveRequest (
    leaveID int identity(1,1) primary key,
    employeeID int,
    leaveType varchar(50),
    startDate date,
    endDate date,
    status varchar(20),

    foreign key (employeeID) references Employee(employeeId)
);


/************** Payroll table ***************/
create table Payroll (
    payrollID int identity(1,1) primary key,
    employeeID int,
    payrollMonth date,
    basicSalary decimal(12,2),
    allowance decimal(12,2),
    deduction decimal(12,2),
    netSalary decimal(12,2),

    foreign key (employeeID) references Employee(employeeId)
);