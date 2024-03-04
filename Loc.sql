-- Tabela de Localizações
CREATE TABLE Localizacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    usuario_id INT NOT NULL,
    nome VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255),
    pais VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
