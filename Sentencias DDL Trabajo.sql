CREATE TABLE Persona
(
    DNI INT PRIMARY KEY,
    Nommbre VARCHAR(30),
    ApellidoPaterno VARCHAR(30),
    ApellidoMaterno VARCHAR(30),
    Telefono INT
);

CREATE TABLE Empleado
(
    ID_Empleado INT,
    DNI INT,
    PRIMARY KEY (ID_Empleado,DNI),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Vendedor
(
    ID_Vendedor INT,
    DNI INT,
    PRIMARY KEY (ID_Vendedor,DNI),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE CLIENTE
(
    ID_Cliente INT,
    DNI INT,
    PRIMARY KEY (ID_Cliente,DNI),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Pedido
(
    ID_Pedido INT PRIMARY KEY,
    Precio REAL,
    Talla VARCHAR(2),
    Color VARCHAR(30),
    Cantidad INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Polo
(
    ID_Polo INT,
    ID_Pedido INT,
    PRIMARY KEY (ID_Polo,ID_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Casaca
(
    ID_Casaca INT,
    ID_Pedido INT,
    PRIMARY KEY (ID_Casaca,ID_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Polera
(
    ID_Polera INT,
    ID_Pedido INT,
    PRIMARY KEY (ID_Polera,ID_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Pago
(
    ID_Pago INT PRIMARY KEY,
    Monto REAL,
    FechaPago DATE,
    ID_Cliente INT,
    ID_Pedido INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
);

CREATE TABLE Notificacion
(
    ID_Notificacion INT PRIMARY KEY,
    Tipo VARCHAR(30),
    Descripcion VARCHAR(100),
    ID_Pedido INT,
    ID_Empleado INT,
    ID_Vendedor INT,
    ID_Pago INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor),
    FOREIGN KEY (ID_Pago) REFERENCES Pago(ID_Pago)
);