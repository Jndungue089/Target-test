-- Tabela de Estados
CREATE TABLE Estados (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(2) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de Tipos de Telefone
CREATE TABLE Tipos_de_telefone (
    id_tipo_telefone INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(255) NOT NULL,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES Estados(id_estado)
);

-- Tabela de Telefones
CREATE TABLE Telefones (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    numero VARCHAR(20) NOT NULL,
    id_tipo_telefone INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_tipo_telefone) REFERENCES Tipos_de_telefone(id_tipo_telefone)
);

SELECT 
    c.id_cliente, 
    c.razao_social, 
    t.numero, 
    tt.descricao AS tipo_telefone
FROM 
    Clientes c
JOIN 
    Estados e ON c.id_estado = e.id_estado
JOIN 
    Telefones t ON c.id_cliente = t.id_cliente
JOIN 
    Tipos_de_telefone tt ON t.id_tipo_telefone = tt.id_tipo_telefone
WHERE 
    e.sigla = 'SP';
