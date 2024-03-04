-- Tabela de Usuarios
CREATE TABLE Usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    genero ENUM('Masculino', 'Feminino', 'Outro'),
    -- cidade VARCHAR(100),
    -- pais VARCHAR(100),
    foto_perfil VARCHAR(255) DEFAULT 'default.jpg',
    biografia TEXT,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela de Seguidores
CREATE TABLE Seguidores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    seguidor_id INT NOT NULL,
    data_seguimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (seguidor_id) REFERENCES Usuarios(id)
);

-- Tabela de Seguindo
-- CREATE TABLE Seguindo (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     usuario_id INT NOT NULL,
--     seguido_id INT NOT NULL,
--     data_seguimento DATETIME DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
--     FOREIGN KEY (seguido_id) REFERENCES Usuarios(id)
-- );
