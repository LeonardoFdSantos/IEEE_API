-- Criação da tabela de Usuários (opcional, caso você queira associar posts e comentários a usuários)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Criação da tabela de Posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    autor_id INT REFERENCES usuarios(id)  -- Chave estrangeira para o autor (opcional)
);

-- Criação da tabela de Comentários
CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,  -- Chave estrangeira para o post
    autor_id INT REFERENCES usuarios(id),  -- Chave estrangeira para o autor (opcional)
    conteudo TEXT NOT NULL,
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Arquivos (para armazenar os PDFs)
CREATE TABLE arquivos (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,  -- Chave estrangeira para o post
    nome_arquivo VARCHAR(255) NOT NULL,
  ''  caminho_arquivo VARCHAR(255) NOT NULL  -- Caminho para o arquivo no sistema de arquivos ou armazenamento em nuvem
);