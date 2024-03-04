CREATE TABLE Midias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    postagem_id INT NOT NULL FOREIGN KEY,
    tipo_midia ENUM('Imagem', 'Video') NOT NULL,
    caminho_midia VARCHAR(255) NOT NULL,
    FOREIGN KEY (postagem_id) REFERENCES Postagens(id)
);

-- Tabela de Postagens
CREATE TABLE Postagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL FOREIGN KEY,
    midia INT FOREIGN KEY,
    conteudo TEXT NOT NULL,
    -- tipo_conteudo ENUM('Texto', 'Imagem', 'Video') NOT NULL,
    data_postagem DATETIME DEFAULT CURRENT_TIMESTAMP,
    localizacao VARCHAR(100),
    visibilidade ENUM('Publico', 'Amigos', 'Privado') NOT NULL,
    num_curtidas INT DEFAULT 0,
    num_comentarios INT DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (midia) REFERENCES Midias(id)
);

-- Tabela de Comentários
CREATE TABLE Comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    postagem_id INT NOT NULL FOREIGN KEY,
    usuario_id INT NOT NULL FOREIGN KEY,
    conteudo TEXT NOT NULL,
    data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (postagem_id) REFERENCES Postagens(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabela de Feed
-- CREATE TABLE Feed (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     usuario_id INT NOT NULL,
--     postagem_id INT NOT NULL,
--     FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
--     FOREIGN KEY (postagem_id) REFERENCES Postagens(id)
-- );

-- Tabela de Atividades
CREATE TABLE Atividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    tipo_atividade ENUM('Postagem', 'Curtida', 'Comentario', 'Seguimento') NOT NULL,
    postagem_id INT,
    comentario_id INT,
    usuario_interagido_id INT,
    data_atividade DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (postagem_id) REFERENCES Postagens(id),
    FOREIGN KEY (comentario_id) REFERENCES Comentarios(id),
    FOREIGN KEY (usuario_interagido_id) REFERENCES Usuarios(id)
);
