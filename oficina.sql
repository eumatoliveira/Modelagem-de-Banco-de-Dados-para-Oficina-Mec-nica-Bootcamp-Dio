-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(255) NOT NULL,
    endereco_cliente VARCHAR(255),
    telefone_cliente VARCHAR(20)
);

-- Criação da tabela Veiculo
CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    placa_veiculo VARCHAR(10) UNIQUE NOT NULL,
    modelo_veiculo VARCHAR(50),
    marca_veiculo VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Criação da tabela Mecanico
CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    codigo_mecanico VARCHAR(20) UNIQUE NOT NULL,
    nome_mecanico VARCHAR(255) NOT NULL,
    endereco_mecanico VARCHAR(255),
    especialidade_mecanico VARCHAR(50)
);

-- Criação da tabela Equipe
CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY AUTO_INCREMENT
);

-- Criação da tabela Equipe_Mecanico (tabela de junção)
CREATE TABLE Equipe_Mecanico (
    id_equipe INT NOT NULL,
    id_mecanico INT NOT NULL,
    PRIMARY KEY (id_equipe, id_mecanico),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

-- Criação da tabela Ordem_Servico
CREATE TABLE Ordem_Servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_equipe INT NOT NULL,
    numero_os INT UNIQUE NOT NULL,
    data_emissao_os DATE,
    data_conclusao_os DATE,
    status_os VARCHAR(50),
    valor_total_os DECIMAL(10, 2),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

-- Criação da tabela Servico
CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao_servico VARCHAR(255),
    valor_mao_de_obra DECIMAL(10, 2)
);

-- Criação da tabela Peca
CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(255),
    valor_peca DECIMAL(10, 2)
);

-- Criação da tabela OS_Servico (tabela de junção)
CREATE TABLE OS_Servico (
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

-- Criação da tabela OS_Peca (tabela de junção)
CREATE TABLE OS_Peca (
    id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade_peca INT,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);