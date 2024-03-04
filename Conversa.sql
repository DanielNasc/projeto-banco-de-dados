-- Tabela de Conversas
CREATE TABLE Conversas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_conversa ENUM('Individual', 'Grupo') NOT NULL,
    nome_conversa VARCHAR(255), -- Para conversas em grupo, nome do grupo
    usuario_id_1 INT NOT NULL, -- Para conversas individuais, ID do primeiro usuário
    usuario_id_2 INT, -- Para conversas individuais, ID do segundo usuário
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Mensagens
CREATE TABLE Mensagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    conversa_id INT NOT NULL,
    remetente_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data_envio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversa_id) REFERENCES Conversas(id),
    FOREIGN KEY (remetente_id) REFERENCES Usuarios(id)
);

