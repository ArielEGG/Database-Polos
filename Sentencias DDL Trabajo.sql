CREATE TABLE Persona
(
    DNI INT PRIMARY KEY,
    Nommbre VARCHAR2(30),
    ApellidoPaterno VARCHAR2(30),
    ApellidoMaterno VARCHAR2(30),
    Telefono NUMBER
);

CREATE TABLE Empleado
(
    ID_Empleado NUMBER,
    DNI NUMBER,
    PRIMARY KEY (ID_Empleado,DNI),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Vendedor
(
    ID_Vendedor NUMBER,
    DNI NUMBER,
    PRIMARY KEY (ID_Vendedor,DNI),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Cliente
(
    ID_Cliente NUMBER,
    DNI NUMBER,
    PRIMARY KEY (ID_Cliente,DNI),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Pedido
(
    ID_Pedido NUMBER PRIMARY KEY,
    Precio NUMBER(3,2),
    Talla VARCHAR2,
    Color VARCHAR2(30),
    Cantidad NUMBER,
    ID_Cliente NUMBER,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Polo
(
    ID_Polo NUMBER,
    ID_Pedido NUMBER,
    PRIMARY KEY (ID_Polo,ID_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Casaca
(
    ID_Casaca NUMBER,
    ID_Pedido NUMBER,
    PRIMARY KEY (ID_Casaca,ID_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Polera
(
    ID_Polera NUMBER,
    ID_Pedido NUMBER,
    PRIMARY KEY (ID_Polera,ID_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Pago
(
    ID_Pago NUMBER PRIMARY KEY,
    Monto NUMBER(3,2),
    FechaPago DATE,
    ID_Cliente NUMBER,
    ID_Pedido NUMBER,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
);

CREATE TABLE Notificacion
(
    ID_Notificacion NUMBER PRIMARY KEY,
    Tipo VARCHAR2(30),
    Descripcion VARCHAR2(100),
    ID_Pedido NUMBER,
    ID_Empleado NUMBER,
    ID_Vendedor NUMBER,
    ID_Pago NUMBER,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor),
    FOREIGN KEY (ID_Pago) REFERENCES Pago(ID_Pago)
);
