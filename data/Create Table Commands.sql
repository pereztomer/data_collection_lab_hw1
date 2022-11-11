CREATE TABLE Cities(
    City            VARCHAR(40) PRIMARY KEY,
    RegionCode      VARCHAR(20),
    CountryCode     VARCHAR(5)
);

CREATE TABLE Imps(
    ImpID           VARCHAR(45) PRIMARY KEY,
    W               INTEGER,
    H               INTEGER,
    Pos             INTEGER,
    BidFloor        FLOAT
);

CREATE TABLE Devices(
    DeviceID        VARCHAR(10) PRIMARY KEY,
    City            VARCHAR(35),
    Make            VARCHAR(30),
    Model           VARCHAR(30)
);

CREATE TABLE Bids(
    ID          VARCHAR(40) PRIMARY KEY,
    TimeStamp   DATETIME,
    DeviceID    VARCHAR(10),
    ImpID       VARCHAR(45),
    FOREIGN KEY(DeviceID) REFERENCES Devices ON DELETE SET NULL,
    FOREIGN KEY(ImpID) REFERENCES Imps ON DELETE SET NULL
);