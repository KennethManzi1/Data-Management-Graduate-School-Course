----Ken Kaijage

CREATE TABLE PARKS (
    ParkID  CHAR(3),
    Park    VARCHAR2(100) NOT NULL,
    Country VARCHAR2(50) NOT NULL, 
    StatusNote  VARCHAR2(100), 

    ------Constraints--------
    CONSTRAINT PARKS_PK PRIMARY KEY(ParkID)

);

CREATE TABLE WHALES (
    WhaleID     CHAR(5),
    NAME        VARCHAR2(100) NOT NULL,
    Sex         VARCHAR2(1) CHECK(Sex in ('M', 'F')),
    Origin      VARCHAR2(20) NOT NULL,
    Born        DATE,
    Weight      Number(6,2),
    Length      NUMBER(4,2),
    ParkID      CHAR(3) NOT NULL,

    ------Constraints--------
    CONSTRAINT WHALES_PK PRIMARY KEY(WhaleID),
    CONSTRAINT WHALES_FK FOREIGN KEY(ParkID) REFERENCES PARKS(ParkID)

);

CREATE TABLE POPULATIONS(
    WhaleID     CHAR(5),
    Population  VARCHAR2(50) NOT NULL,
    
    ------Constraints--------
    CONSTRAINT POPULATIONS_PK PRIMARY KEY(WhaleID, Population),
    FOREIGN KEY(WhaleID) REFERENCES WHALES(WhaleID)

)