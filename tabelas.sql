create database clinica_medica;
use clinica_medica;
CREATE TABLE pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200),
    alergias TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE medicos (
   id_medico INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   crm VARCHAR(20) UNIQUE NOT NULL,
   telefone VARCHAR(20) NOT NULL,
   email VARCHAR(100),
   especialidade VARCHAR(50) NOT NULL,
   ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_hora DATETIME NOT NULL,
    duracao INT DEFAULT 30 COMMENT 'Duração em minutos',
    status ENUM ('agendada', 'confirmada', 'realizada', 'cancelada', 'faltou') DEFAULT 'agendada',
    observacoes TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medicos (id_medico)
);

CREATE TABLE prontuarios (
   id_prontuario INT PRIMARY KEY AUTO_INCREMENT,
   id_paciente INT NOT NULL,
   id_consulta INT,
   anamnese TEXT COMMENT 'Histórico relatado pelo paciente',
   diagnostico TEXT,
   prescricao TEXT,
   observacoes TEXT,
   FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente),
   FOREIGN KEY (id_consulta) REFERENCES consultas (id_consulta)
);   
   
   CREATE TABLE exames (
      id_exame INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      descricao TEXT,
      preparo TEXT COMMENT 'Instruções de preparo',
      valor DECIMAL (10,2) NOT NULL
);  

   CREATE TABLE exames_solicitados (
      id_solicitado INT PRIMARY KEY AUTO_INCREMENT,
      id_prontuario INT NOT NULL,
      id_exame INT NOT NULL,
      data_solicitacao DATE DEFAULT CURRENT_DATE,
   

